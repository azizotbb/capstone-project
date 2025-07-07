import 'dart:developer';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:makfoul_app/model/order/order_model.dart';
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

  static Future<void> uploadImage({
    required String path,
    required File file,
  }) async {
    try {
      await supabase!.client.storage.from('images').upload(path, file);
    } catch (error) {
      throw ('There was an error on your uploading: $error');
    }
  }

  static Future<String> getImageUrl({required String path}) async {
    try {
      return supabase!.client.storage.from('images').getPublicUrl(path);
    } catch (error) {
      throw FormatException('There was an error on your request: $error');
    }
  }

  static Future<void> addCourse({
    required String catagory,
    required String title,
    required String description,
    required double price,
    required int numberOfTrainees,
    required DateTime startDate,
    required DateTime endDate,
    required String image,
    required String location,
    required String createdAt,
    required String state,
  }) async {
    try {
      await supabase!.client.from('course').insert({
        'tid': supabase!.client.auth.currentSession!.user.id,
        'category': catagory,
        'title': title,
        'description': description,
        'price': price,
        'number_of_trainees': numberOfTrainees,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'image': image,
        'location': location,
        'state': state,
        'created_at': createdAt,
      });
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  // Supabase.instance.client.storage.from('images').upload(path, file);
  static Future<List<dynamic>> getCourses() async {
    final response = await supabase!.client.from("course").select("*,user(*)");

    return response;
  }

  static Future<void> updatePassword({
    required String password,
    required String oldPassword,
  }) async {
    await supabase!.client.auth.updateUser(UserAttributes(password: password));
  }

  static Future<void> updateName({required String name}) async {
    await supabase!.client
        .from('user')
        .update({'name': name})
        .eq('UID', supabase!.client.auth.currentUser!.id);
  }

  static Future<void> updateImage({required String urlString}) async {
    await supabase!.client
        .from('user')
        .update({'avatar': urlString})
        .eq('UID', supabase!.client.auth.currentUser!.id);
  }

  //  need testing

  static Future<void> addOrder({
    required String uid,
    required int courseId,
  }) async {
    try {
      await supabase!.client.from('order').insert({
        'course_id': courseId,
        'uid': supabase!.client.auth.currentSession!.user.id,
      });
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  static Future forgotPassword({required String email}) async {
    try {
      final res = await supabase!.client.auth.resetPasswordForEmail(email);
      return res;
    } catch (error) {
      return error;
    }
  }

  static Future verifyWithOTP({
    required String token,
    required String email,
  }) async {
    try {
      final res = await supabase!.client.auth.verifyOTP(
        type: OtpType.recovery,
        email: email,
        token: token,
      );
      return res.session?.isExpired;
    } on AuthException catch (error) {
      throw AuthException(error.message);
    } catch (error) {
      return error;
    }
  }

  static Future<void> deletecourse({required int idcourse}) async {
    await supabase!.client.from("order").delete().eq('course_id', idcourse);

    await supabase!.client.from("course").delete().eq('id', idcourse);
    log(idcourse.toString());
    getCourses(); //to try
  }

  static Future<void> updatecoursesState({
    required int id,
    required String newState,
  }) async {
    await supabase!.client
        .from('course')
        .update({'state': newState})
        .eq('id', id);
  }

  // Static method to fetch orders for a specific user by UID from the "order" table
  static Future<List<dynamic>> getordersByUID({required String uid}) async {
    final response = await supabase!.client
        .from("order")
        .select("*,uid(*),course_id(* , user(*))")
        .eq("uid", uid);
    return response;
  }

  static Future<List<OrderModel>> getDetailes({required int courseId}) async{

    final  response = await supabase?.client.from('order').select('*,uid(*),course_id(*,user(*))').eq('course_id',courseId);
      print(response);
      print("here course responce ${response!.length}");
    if(response.isEmpty){return[];}

    return response.map((users){
      return OrderModelMapper.fromMap(users);
    }).toList();
// return response;
  }
}
