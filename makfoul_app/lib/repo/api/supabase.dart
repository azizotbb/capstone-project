import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  static Supabase? supabase;

  // Initializes the Supabase
  static Future<void> init() async {
    try {
      await dotenv.load(fileName: ".env");

      supabase = await Supabase.initialize(
        url: dotenv.env["baseURL"].toString(),
        anonKey: dotenv.env["anonKey"].toString(),
      );

      log("Successfully connected to Supabase 🎉");
    } catch (error) {
      throw FormatException("There is error with connecting");
    }
  }

  //Supabase sign-up integration
  static Future<dynamic> signUp({
    required String phoneNumber,
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final AuthResponse user = await supabase!.client.auth.signUp(
        password: password,
        email: email,
        data: {'phoneNumber': phoneNumber, "username": username, 'role': role},
      );
      return user.user;
    } on AuthException catch (error) {
      // Throws a more specific auth-related error
      throw AuthException(error.message);
    } catch (error) {
      // General signup error
      throw FormatException("There is error with sign Up");
    }
  }

  //add user
  static addUser({
    required String userid,
    required String phone,
    required String name,
    required String email,
    required String role,
  }) async {
    await supabase?.client.from("user").upsert({
      "UID": userid,
      "phone": phone,
      "name": name,
      "email": email,
      "role": role,
    });
  }

  //Supabase sign-in integration

  static Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse user = await supabase!.client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return user.user;
    } on AuthException catch (error) {
      // Throws a more specific auth-related error
      throw AuthException(error.message);
    } catch (error) {
      // General signهى error
      throw FormatException("There is error with sign in");
    }
  }
}
