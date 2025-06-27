import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/screen/auth/resetpassword/reset_password_screen.dart';
import 'package:makfoul_app/screen/auth/resetpassword/verification_code_screen.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/auth/welcom_screen.dart';
import 'package:makfoul_app/screen/course/course_view.dart';
import 'package:makfoul_app/screen/course/details_course.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/screen/onboarding/onboarding.dart';
import 'package:makfoul_app/screen/orders-related/add_course_screen.dart';
import 'package:makfoul_app/screen/orders-related/order_screen.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_theme.dart';


//supapase_pages
//profile
//home
//trainer_screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: SplashScreen(),
    );
  }
}
