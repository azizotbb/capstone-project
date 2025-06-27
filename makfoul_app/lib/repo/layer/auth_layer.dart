import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  // Stores the authenticated user's ID and username after successful sign-up
  String userID = "";
  String username = "";

  // Stores additional user information
  Map userInfo = {};

  signUpMethod({
    required String phoneNumber,
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        username: username,
      );

      await SupabaseConnect.addUser(
        userid: user.id,
        phone: phoneNumber,
        name: username,
        email: email,
        role: role,
      );

      userID = user.id;
      userInfo = user.userMetadata;
      username = user.userMetadata["username"];

      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
