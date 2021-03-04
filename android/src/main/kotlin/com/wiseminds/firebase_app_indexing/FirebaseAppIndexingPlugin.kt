package com.wiseminds.firebase_app_indexing

import android.content.Context
import androidx.annotation.NonNull
import android.net.Uri
import android.util.Log
import com.google.firebase.appindexing.FirebaseAppIndex
import com.google.firebase.appindexing.FirebaseUserActions
import com.google.firebase.appindexing.Indexable
import com.google.firebase.appindexing.builders.Actions
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FirebaseAppIndexingPlugin */
class FirebaseAppIndexingPlugin : FlutterPlugin, MethodCallHandler {

  companion object {
   const val TAG =  "FirebaseAppIndexing"
  }

  private lateinit var channel: MethodChannel
  private lateinit var mContext: Context
  private lateinit var firebaseAppIndex: FirebaseAppIndex

  override fun onAttachedToEngine(
      @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "firebase_app_indexing")
    channel.setMethodCallHandler(this)
    mContext = flutterPluginBinding.applicationContext
    firebaseAppIndex = FirebaseAppIndex.getInstance(mContext)

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "start" -> start(call.argument<String>("title")!!, call.argument<String>("url")!!)
      "stop" -> stop(call.argument<String>("title")!!, call.argument<String>("url")!!)
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun start(title: String, url: String) {
    val appUri = Uri.parse(url).toString()
    val index = Indexable.Builder().setName(title).setUrl(appUri).build()

    val task = firebaseAppIndex.update(index)

    // If the Task is already complete, a call to the listener will be immediately
    // scheduled
    task.addOnSuccessListener() {
      Log.d(TAG, "App Indexing API: Successfully added $title to index")
    }

    task.addOnFailureListener() { exception ->
      Log.e(TAG, "App Indexing API: Failed to add $title to index. ${exception.message}")
    }

    val actionTask = FirebaseUserActions
            .getInstance(mContext)
            .start(Actions.newView(title, appUri))

    actionTask.addOnSuccessListener() {
      Log.d(TAG, "App Indexing API: Successfully started view action on $title")
    }

    actionTask.addOnFailureListener() { exception ->
      Log.e(TAG, "App Indexing API: Failed to start view action on $title. ${exception.message}")
    }
  }

  private fun stop(title: String, url: String) {
    if (title == null || url == null) {
        return
    }
 
    val actionTask = FirebaseUserActions
            .getInstance(mContext)
            .end(Actions.newView(title, Uri.parse(url).toString()))

    actionTask.addOnSuccessListener() {
        Log.d(TAG, "App Indexing API: Successfully ended view action on $title")
    }

    actionTask.addOnFailureListener() { exception ->
        Log.e(TAG, "App Indexing API: Failed to end view action on $title. ${exception.message}")
    }
}
}
