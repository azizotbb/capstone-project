import 'package:flutter/material.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/orders-related/add_course_screen.dart';
import 'package:makfoul_app/utility/setup.dart';
import 'package:makfoul_app/widget/bottomNavigation/bottom_navigation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return MaterialApp(home: SignupScreen());
  }
}
