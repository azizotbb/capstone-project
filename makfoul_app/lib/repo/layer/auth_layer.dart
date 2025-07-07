import 'package:makfoul_app/model/user/user_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  //authenticated user's information
  UserModel userinfo = UserModel(
    UID: " ",
    name: " ",
    email: " ",
    role: " ",
    createdAt: " ",
    phone: " ",
    avatar: '',
  );

  /// Method to handle user sign-up process
  signUpMethod({
    required String phoneNumber,
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Step 1: Sign up the user through Supabase Auth
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        username: username,
      );
      // Step 2: Store user details in the database
      await SupabaseConnect.addUser(
        userid: user.id,
        phone: phoneNumber,
        name: username,
        email: email,
        role: role,
      );

      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  // Method to handle user sign-in using email and password

  signInMethod({required String email, required String password}) async {
    try {
      final user = await SupabaseConnect.signIn(
        email: email,
        password: password,
      );

      return user;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  /// Method to update the user's password
  updatePasswordMethod({
    required String password,
    required String oldPassword,
  }) {
    SupabaseConnect.updatePassword(
      password: password,
      oldPassword: oldPassword,
    );
  }

  /// Sends a reset password link to the user's email address.
  forgotPasswordMethod({required String email}) {
    try {
      SupabaseConnect.forgotPassword(email: email);
    } catch (error) {
      return error;
    }
  }

  /// Method to verify OTP token for password recovery
  verifyWithOTPMethod({required String token, required String email}) async {
    try {
      final res = await SupabaseConnect.verifyWithOTP(
        token: token,
        email: email,
      );
      return res;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      return error;
    }
  }
}
