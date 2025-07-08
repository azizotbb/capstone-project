import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/model/user/user_model.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final supabase = Supabase.instance.client;

        await supabase.auth.signOut();
        GetIt.I.get<AuthLayer>().userinfo.UID = " ";
        GetIt.I.get<AuthLayer>().userinfo.avatar = " ";
        GetIt.I.get<AuthLayer>().userinfo.createdAt = " ";
        GetIt.I.get<AuthLayer>().userinfo.email = " ";
        GetIt.I.get<AuthLayer>().userinfo.name = " ";
        GetIt.I.get<AuthLayer>().userinfo.phone = " ";
        GetIt.I.get<AuthLayer>().userinfo.role = " ";

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      },
      leading: Icon(Icons.logout, color: Colors.red),
      title: Text(
        "logout".tr(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
