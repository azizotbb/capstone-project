// import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:makfoul_app/screen/home/homescreen_trainer_screen.dart';
import 'package:makfoul_app/screen/home/test3.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_theme.dart';
import 'package:makfoul_app/utility/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to Initialized supabase
  await SupabaseConnect.init();

  setup();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.appTheme,
      // home: BottomNavigationWidget(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Test3(),
    );
  }
}
