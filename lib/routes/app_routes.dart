import 'package:flutter/material.dart';
import 'package:myapp/features/splash/splash_screen.dart';

class AppRoutes {
  static const splashScreen = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
