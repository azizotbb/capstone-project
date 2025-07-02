import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  static Future<void> uploadImage({
    required String path,
    required File file,
  }) async {
    try {
      await supabase!.client.storage.from('images').upload(path, file);
      print('layer1');
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
    required String date,
    required String image,
    required String location,
    required String createdAt,
    required String state,
  }) async {
    try {
      print('supa3');
       await supabase!.client.from('course').insert({
        'tid': supabase!.client.auth.currentSession!.user.id,
        'category': catagory,
        'title': title,
        'description': description,
        'price': price,
        'number_of_trainees': numberOfTrainees,
        'date': date,
        'image': image,
        'location': location,
        'state': state,
        'created_at': createdAt,
      });
      print('object');
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  // Supabase.instance.client.storage.from('images').upload(path, file);
  static Future<List<dynamic>> getCourses() async {
    final response = await supabase!.client.from("course").select();
    return response;
  }

  static Future<void> updatePassword({
    required String password,
    required String oldPassword,
  }) async {
      await supabase!.client.auth.updateUser(
        UserAttributes(password: password),
      );
      print('Layer supa');
    
   
  }

  static Future<void> updateName({required String name})async{


    await supabase!.client.from('user').update({'name':name}).eq('UID', supabase!.client.auth.currentUser!.id);
    print('supabase layer names');

  }


  static Future<void> updateImage({required String urlString})async{



    await supabase!.client.from('user').update({'avatar':urlString}).eq('UID', supabase!.client.auth.currentUser!.id);


  }


  //  need testing

static Future<void> addOrder({

    required String createdAt,
    required String uid,
    required int courseId,

  }) async {
    try {
      await supabase!.client.from('order').insert({
        'created_at':createdAt,
        'course_id': courseId,
        'uid': supabase!.client.auth.currentSession!.user.id,
        
      });
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

}
