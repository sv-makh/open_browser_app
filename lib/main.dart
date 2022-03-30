import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const platform = MethodChannel('open.browser');

  //метод для вызова нативного кода:
  //для android код на Java
  // /android/app/src/main/java/com/example/open_browser_app/MainActivity.java
  //для ios код на Objective C (не проверялся)
  // /ios/Runner/AppDelegate.m
  Future<void> _launchBrowser() async {
    try {
      await platform.invokeMethod('launchBrowser');
    } on PlatformException catch (e) {
      print('Failed to launch: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Browser App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Open Browser App')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Open Browser'),
            onPressed: _launchBrowser,
          ),
        ),
      )
    );
  }
}
