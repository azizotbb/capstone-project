import 'package:flutter/material.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:makfoul_app/screen/auth/login/login_screen.dart';
import 'package:makfoul_app/utility/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to Initialized supabase
  await SupabaseConnect.init();

  setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
