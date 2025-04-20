package com.example.mentor_me

import android.content.Context
import com.google.android.gms.tflite.java.TfLite
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import org.tensorflow.lite.DataType
import org.tensorflow.lite.InterpreterApi
import org.tensorflow.lite.support.common.FileUtil
import java.nio.ByteBuffer
import java.nio.ByteOrder

class LitertFlutterPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var interpreter: InterpreterApi
    private lateinit var flutterAssets: FlutterPlugin.FlutterAssets

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context       = binding.applicationContext
        flutterAssets = binding.flutterAssets
        channel       = MethodChannel(binding.binaryMessenger, "litert_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "initialize" -> {
                TfLite.initialize(context)
                    .addOnSuccessListener    { result.success(null) }
                    .addOnFailureListener    { e -> result.error("INIT_FAILED", e.message, null) }
            }
            "loadModel" -> {
                val assetPath = call.argument<String>("assetPath")!!
                val rawAssetPath = flutterAssets.getAssetFilePathByName(assetPath)
                val modelBuffer  = FileUtil.loadMappedFile(context, rawAssetPath)
                val options = InterpreterApi.Options()
                    .setRuntime(InterpreterApi.Options.TfLiteRuntime.FROM_SYSTEM_ONLY)
                interpreter = InterpreterApi.create(modelBuffer, options)
                result.success(null)
            }
            "runInference" -> try {
                // 1) pull inputs
                val inputList = call.argument<List<Double>>("input")!!
                val outShape  = call.argument<List<Int>>("outShape")!!

                // 2) inspect model dtypes
                val inTensor  = interpreter.getInputTensor(0)
                val inType    = inTensor.dataType()
                val outTensor = interpreter.getOutputTensor(0)
                val outType   = outTensor.dataType()

                // 3) build raw ByteBuffer for input
                val inputBuffer = ByteBuffer.allocateDirect(inputList.size * 4)
                    .order(ByteOrder.nativeOrder())
                when (inType) {
                    DataType.FLOAT32 -> inputList.forEach { inputBuffer.putFloat(it.toFloat()) }
                    DataType.INT32   -> inputList.forEach { inputBuffer.putInt(it.toInt()) }
                    else -> throw IllegalArgumentException("Unsupported input data type: $inType")
                }
                inputBuffer.rewind()

                // 4) build raw ByteBuffer for output
                val outputSize = outShape.fold(1) { acc, v -> acc * v }
                val outputBuffer = ByteBuffer.allocateDirect(outputSize * 4)
                    .order(ByteOrder.nativeOrder())

                // 5) run
                interpreter.run(inputBuffer, outputBuffer)
                outputBuffer.rewind()

                // 6) unpack result
                val resultList = when (outType) {
                    DataType.FLOAT32 -> List(outputSize) { outputBuffer.getFloat().toDouble() }
                    DataType.INT32   -> List(outputSize) { outputBuffer.getInt() }
                    else -> throw IllegalArgumentException("Unsupported output data type: $outType")
                }

                result.success(resultList)
            } catch (e: Exception) {
                result.error("INFERENCE_ERROR", e.message, null)
            }

            else -> result.notImplemented()
        }
    }
}
