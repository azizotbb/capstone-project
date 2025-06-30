import 'package:makfoul_app/model/user_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLayer {
  //authenticated user's information
  UserModel userinfo = UserModel(
    uid: " ",
    username: " ",
    email: " ",
    role: " ",
    createdAt: " ",
    phone: " ",
  );
  // Method to handle user sign-up process
  signUpMethod({
    required String phoneNumber,
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Call signUp function from SupabaseConnect to create a new user account
      final user = await SupabaseConnect.signUp(
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        role: role,
        username: username,
      );
      // After successful sign-up, add user data to the "user" table in Supabase
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

  // uploadImage(){
    
    

  // }


updatePasswordMethod({required String password,required String oldPassword}){


  SupabaseConnect.updatePassword(password: password,oldPassword: oldPassword);
  print('Layer getit');
}


}
