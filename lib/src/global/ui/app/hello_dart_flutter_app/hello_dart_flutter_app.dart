import 'package:flutter/material.dart';
import 'package:hello_dart_flutter/src/features/features_barrel.dart';
import 'package:hello_dart_flutter/src/global/ui/app/theme/app_theme.dart';

class HelloDartFlutterApp extends StatelessWidget {
  const HelloDartFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
