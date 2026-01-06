import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExt on BuildContext {
  void push(String route, {Object? args}) {
    Navigator.pushNamed(this, route, arguments: args);
  }

  void replace(String route, {Object? args}) {
    Navigator.pushReplacementNamed(this, route, arguments: args);
  }

  void pop() => Navigator.pop(this);

  void showSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  // Text
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Color
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void initScreenUtil() => ScreenUtil.init(this);
}
