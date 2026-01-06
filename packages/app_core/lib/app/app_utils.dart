import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilHelper {
  ScreenUtilHelper._();

  static ScreenUtilInit init({
    required Widget Function(BuildContext, Widget?)? builder,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: builder,
    );
  }

  static Future<void> ensureScreenReady() async {
    await ScreenUtil.ensureScreenSize();
  }
}
