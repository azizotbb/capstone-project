import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_theme.dart';
import 'package:makfoul_app/widget/botton_nav/bottom_navigation_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: BottomNavigationWidget(),
    );
  }
}
