import 'dart:io';

import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/model/order/order_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';

class OpreationsLayer {
  // List to store courses
  List<CourseModel> courses = [];

  List<OrderModel> ordersByUID = [];

  uploadImageMethod({required String path, required File file}) {
    SupabaseConnect.uploadImage(path: path, file: file);
  }

  getImageUrlMethod({required String path}) async {
    return await SupabaseConnect.getImageUrl(path: path);
  }

  addCourseMethod({
    required String catagory,
    required String title,
    required String description,
    required double price,
    required int numberOfTrainees,
    required String date,
    required String image,
    required String location,
    required String state,
    required String createdAt,
  }) {
    try {
      SupabaseConnect.addCourse(
        catagory: catagory,
        title: title,
        description: description,
        price: price,
        numberOfTrainees: numberOfTrainees,
        date: date,
        image: image,
        location: location,
        state: state,
        createdAt: createdAt,
      );
      print('supa2');
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  // Get courses from Supabase and save them to the list
  getCoursesMethod() async {
    // Get course data from Supabase
    final response = await SupabaseConnect.getCourses();

    // Convert the data to CourseModel objects if not empty
    if (response.isNotEmpty) {
      courses = response.map((item) {
        return CourseModelMapper.fromMap(item);
      }).toList();
    }
  }

  updateUserNameMethod({required String name}) async {
    SupabaseConnect.updateName(name: name);

    print('getit layer name');
  }

  updateImageMethod({required String urlString}) async {
    SupabaseConnect.updateImage(urlString: urlString);

    print('getit layer name');
  }

  // Method to add a new order using the given user ID and course ID
  addOrderMethod({required String uid, required int courseId}) {
    try {
      SupabaseConnect.addOrder(uid: uid, courseId: courseId);
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  // Method to fetch orders for a specific user by UID
  getordersByUID({required String uid}) async {
    final response = await SupabaseConnect.getordersByUID(uid: uid);
    // If response is not empty, map the data to a list of OrderModel
    if (response.isNotEmpty) {
      ordersByUID = response.map((item) {
        return OrderModelMapper.fromMap(item);
      }).toList();
    }
  }
}
