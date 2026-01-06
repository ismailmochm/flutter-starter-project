import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtilHelper.ensureScreenReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilHelper.init(
      builder: (context, child) {
        context.initScreenUtil();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppRoutes.splashScreen,
        );
      },
    );
  }
}
