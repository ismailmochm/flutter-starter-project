import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final PreferredSizeWidget? preferredSizeWidget;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  const AppScreen({
    super.key,
    this.preferredSizeWidget,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: preferredSizeWidget,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(child: body),
    );
  }
}
