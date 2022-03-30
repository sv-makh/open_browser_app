package com.example.open_browser_app;

import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "open.browser";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("launchBrowser")) {
                                result.success(1);
                                launchBrowser();
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    private void launchBrowser() {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse("https://flutter.dev"));
        startActivity(intent);
    }
}
