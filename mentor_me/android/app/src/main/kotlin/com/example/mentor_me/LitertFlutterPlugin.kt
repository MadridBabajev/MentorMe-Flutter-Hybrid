package com.example.mentor_me

import android.content.Context
import com.google.android.gms.tflite.java.TfLite
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import org.tensorflow.lite.DataType
import org.tensorflow.lite.InterpreterApi
import org.tensorflow.lite.flex.FlexDelegate
import org.tensorflow.lite.support.common.FileUtil
import java.nio.ByteBuffer
import java.nio.ByteOrder

class LitertFlutterPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var flutterAssets: FlutterPlugin.FlutterAssets

    // Keep interpreters by their assetPath
    private val interpreters = mutableMapOf<String, InterpreterApi>()

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        flutterAssets = binding.flutterAssets
        channel = MethodChannel(binding.binaryMessenger, "litert_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        try {
            when (call.method) {
                "initialize" -> {
                    TfLite.initialize(context)
                        .addOnSuccessListener { result.success(null) }
                        .addOnFailureListener { e -> result.error("INIT_FAILED", e.message, null) }
                }
                // loadModel now remembers the interpreter under its assetPath key
                "loadModel" -> {
                    val assetPath = call.argument<String>("assetPath")!!
                    val rawAssetPath = flutterAssets.getAssetFilePathByName(assetPath)
                    val modelBuffer = FileUtil.loadMappedFile(context, rawAssetPath)

                    // Use app‑bundled TF-Lite so you can attach a FlexDelegate
                    val options = InterpreterApi.Options()
                        .setRuntime(InterpreterApi.Options.TfLiteRuntime.FROM_APPLICATION_ONLY)
                        .addDelegate(FlexDelegate())

                    val interp = InterpreterApi.create(modelBuffer, options)
                    interp.allocateTensors()
                    interpreters[assetPath] = interp
                    result.success(null)
                }
                "getInputShape" -> {
                    val assetPath = call.argument<String>("assetPath")!!
                    val idx = call.argument<Int>("tensorIndex")!!
                    val interp = interpreters[assetPath]
                        ?: error("Model not loaded: $assetPath")
                    val shape = interp.getInputTensor(idx).shape()
                    result.success(shape.toList())
                }

                "getOutputShape" -> {
                    val assetPath = call.argument<String>("assetPath")!!
                    val idx = call.argument<Int>("tensorIndex")!!
                    val interp = interpreters[assetPath]
                        ?: error("Model not loaded: $assetPath")
                    val shape = interp.getOutputTensor(idx).shape()
                    result.success(shape.toList())
                }
                // runInference takes an extra assetPath argument and picks the correct interpreter
                "runOcrInference" -> {
                    val assetPath = call.argument<String>("assetPath")!!
                    val interpreter = interpreters[assetPath]
                        ?: error("Model not loaded: $assetPath")

                    // pull inputs
                    val inputList = call.argument<List<Double>>("input")!!
                    val outShape = call.argument<List<Int>>("outShape")!!

                    // inspect model dtypes
                    val inTensor = interpreter.getInputTensor(0)
                    val inType = inTensor.dataType()
                    val outTensor = interpreter.getOutputTensor(0)
                    val outType = outTensor.dataType()

                    // build raw ByteBuffer for input
                    val inputBuffer = ByteBuffer.allocateDirect(inputList.size * 4)
                        .order(ByteOrder.nativeOrder())
                    when (inType) {
                        DataType.FLOAT32 -> inputList.forEach { inputBuffer.putFloat(it.toFloat()) }
                        DataType.INT32 -> inputList.forEach { inputBuffer.putInt(it.toInt()) }
                        else -> throw IllegalArgumentException("Unsupported input data type: $inType")
                    }
                    inputBuffer.rewind()

                    // build raw ByteBuffer for output
                    val outputSize = outShape.fold(1) { acc, v -> acc * v }
                    val outputBuffer = ByteBuffer.allocateDirect(outputSize * 4)
                        .order(ByteOrder.nativeOrder())

                    // run
                    interpreter.run(inputBuffer, outputBuffer)
                    outputBuffer.rewind()

                    // unpack result
                    val resultList = when (outType) {
                        DataType.FLOAT32 -> List(outputSize) { outputBuffer.getFloat().toDouble() }
                        DataType.INT32 -> List(outputSize) { outputBuffer.getInt().toDouble() }
                        else -> throw IllegalArgumentException("Unsupported output data type: $outType")
                    }
                    result.success(resultList)
                }
                // New summarization method: returns List<Int> generated IDs
                "runSummarize" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, *>
                    val assetPath    = args["assetPath"]     as String
                    val rawEncIds    = (args["inputIds"]      as List<Int>).toIntArray()
                    val rawAttMask   = (args["attentionMask"] as List<Int>).toIntArray()
                    val maxNewTokens = args["maxNewTokens"]  as Int
                    val padTokenId   = args["padTokenId"]    as Int
                    val eosTokenId   = args["eosTokenId"]    as Int

                    val interp = interpreters[assetPath]
                        ?: error("Model not loaded: $assetPath")

                    // --- figure out which slot is which ---
                    val inputNames = listOf(
                        interp.getInputTensor(0).name(),
                        interp.getInputTensor(1).name(),
                        interp.getInputTensor(2).name()
                    )
                    val encIndex  = inputNames.indexOfFirst  { it.contains("encoder_input_ids") }
                        .takeIf { it >= 0 } ?: 0
                    val maskIndex = inputNames.indexOfFirst  { it.contains("encoder_attention_mask") }
                        .takeIf { it >= 0 } ?: 1
                    val decIndex  = inputNames.indexOfFirst  { it.contains("decoder_input_ids") }
                        .takeIf { it >= 0 } ?: 2

                    // --- fetch the *true* shapes for each slot ---
                    val encLen  = interp.getInputTensor(encIndex).shape()[1]
                    val maskLen = interp.getInputTensor(maskIndex).shape()[1]
                    val decLen  = interp.getInputTensor(decIndex).shape()[1]

                    // --- helper to pad or truncate an IntArray to exactly targetLen ---
                    fun padOrTruncate(arr: IntArray, targetLen: Int): IntArray {
                        return when {
                            arr.size > targetLen ->
                                arr.copyOfRange(0, targetLen)
                            arr.size < targetLen ->
                                arr + IntArray(targetLen - arr.size) { padTokenId }
                            else -> arr
                        }
                    }

                    // --- build final input arrays of the right length ---
                    val encIds  = padOrTruncate(rawEncIds, encLen)
                    val attMask = padOrTruncate(rawAttMask, maskLen)

                    // --- build ByteBuffers ---
                    fun makeBuffer(vals: IntArray, tensorIndex: Int): ByteBuffer {
                        val tensor = interp.getInputTensor(tensorIndex)
                        val bb = ByteBuffer.allocateDirect(vals.size * 4)
                            .order(ByteOrder.nativeOrder())
                        if (tensor.dataType() == DataType.INT32) for (v in vals) bb.putInt(v)
                        else for (v in vals) bb.putFloat(v.toFloat())
                        bb.rewind()
                        return bb
                    }

                    val encBuf  = makeBuffer(encIds,  encIndex)
                    val maskBuf = makeBuffer(attMask, maskIndex)

                    // --- prepare decoder buffer and output ---
                    val decBufArr = IntArray(decLen) { padTokenId }
                    val generated = mutableListOf<Int>()

                    val outShape  = interp.getOutputTensor(0).shape()   // [1, decLen, vocabSize]
                    val vocabSize = outShape[2]
                    val outBuf    = ByteBuffer.allocateDirect(decLen * vocabSize * 4)
                        .order(ByteOrder.nativeOrder())

                    // --- greedy decode ---
                    for (step in 0 until maxNewTokens) {
                        // rebuild decoder input
                        val decBufBB = ByteBuffer.allocateDirect(decLen * 4)
                            .order(ByteOrder.nativeOrder())
                        val dTensor = interp.getInputTensor(decIndex)
                        if (dTensor.dataType() == DataType.INT32) {
                            decBufArr.forEach { decBufBB.putInt(it) }
                        } else {
                            decBufArr.forEach { decBufBB.putFloat(it.toFloat()) }
                        }
                        decBufBB.rewind()

                        // assemble inputs in the correct order
                        val inputs = arrayOfNulls<Any>(3)
                        inputs[encIndex]  = encBuf
                        inputs[maskIndex] = maskBuf
                        inputs[decIndex]  = decBufBB

                        // run interpreter
                        outBuf.rewind()
                        interp.runForMultipleInputsOutputs(inputs, mapOf(0 to outBuf))
                        outBuf.rewind()

                        // pick next token
                        var best  = Float.NEGATIVE_INFINITY
                        var argm  = padTokenId
                        val base  = step * vocabSize
                        for (v in 0 until vocabSize) {
                            val f = outBuf.getFloat((base + v) * 4)
                            if (f > best) {
                                best = f
                                argm = v
                            }
                        }
                        if (argm == eosTokenId) break

                        generated += argm
                        decBufArr[step + 1] = argm
                    }

                    result.success(generated)
                }

                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("INFERENCE_ERROR", e.message, null)
        }
    }
}
