import 'package:app_core/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splashScreen = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "splashScreen",
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
