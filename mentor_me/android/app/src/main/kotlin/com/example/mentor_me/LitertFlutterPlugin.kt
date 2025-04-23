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
                "runSummarizationStep" -> {
                    // 1) unpack arguments
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, *>
                    val assetPath = args["assetPath"] as String
                    val inputsRaw = args["inputs"] as List<List<Double>>
                    val shapesRaw = args["inputShapes"] as List<List<Int>>
                    val interp = interpreters[assetPath]
                        ?: error("Model not loaded: $assetPath")

                    // 2) build one ByteBuffer per input
                    val inputBuffers = inputsRaw.mapIndexed { i, list ->
                        val buf = ByteBuffer.allocateDirect(list.size * 4)
                            .order(ByteOrder.nativeOrder())
                        when (interp.getInputTensor(i).dataType()) {
                            DataType.FLOAT32 -> list.forEach { buf.putFloat(it.toFloat()) }
                            DataType.INT32   -> list.forEach { buf.putInt(it.toInt()) }
                            else -> throw IllegalArgumentException("Unsupported input type")
                        }
                        buf.rewind()
                        buf
                    }.toTypedArray()

                    // 3) figure out output dims [1, decLen, vocabSize]
                    val outShape = interp.getOutputTensor(0).shape()
                    val decLen = outShape[1]
                    val vocabSize = outShape[2]
                    val outBuf = ByteBuffer.allocateDirect(decLen * vocabSize * 4)
                        .order(ByteOrder.nativeOrder())

                    // 4) run
                    interp.runForMultipleInputsOutputs(inputBuffers, mapOf(0 to outBuf))
                    outBuf.rewind()

                    // 5) argmax on last timestep
                    val offset = (decLen - 1) * vocabSize
                    var maxVal = Float.NEGATIVE_INFINITY
                    var argMax = 0
                    for (i in 0 until vocabSize) {
                        val v = outBuf.getFloat((offset + i) * 4)
                        if (v > maxVal) {
                            maxVal = v
                            argMax = i
                        }
                    }

                    // 6) return single token id
                    result.success(argMax)
                }

                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("INFERENCE_ERROR", e.message, null)
        }
    }
}
