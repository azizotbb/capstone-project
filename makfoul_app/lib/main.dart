import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:makfoul_app/screen/profile/profile_screen.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_theme.dart';
import 'package:makfoul_app/utility/setup.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to Initialized supabase
  await SupabaseConnect.init();

  setup();

  await EasyLocalization.ensureInitialized();

  // Only orientation for this app is Portia up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MainApp(),
    ),
  );

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ec565c2d-a535-4611-8aa1-0c56d6447495");
  OneSignal.Notifications.requestPermission(false);
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
      home: ProfileScreen(),
    );
  }
}
