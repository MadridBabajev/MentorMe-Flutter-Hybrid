package com.example.mentor_me

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // this will call your plugin's onAttachedToEngine(...)
        flutterEngine.plugins.add(LitertFlutterPlugin())
    }
}