import 'dart:io';

import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/model/order/order_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';

class OpreationsLayer {
  // List to hold all fetched courses
  List<CourseModel> courses = [];

  // List to hold users who ordered a specific course
  List<OrderModel> users = [];

  // List to hold all orders placed by a specific user
  List<OrderModel> ordersByUID = [];

  /// Method to upload an image to Supabase storage
  uploadImageMethod({required String path, required File file}) {
    SupabaseConnect.uploadImage(path: path, file: file);
  }

  /// Method to get the public URL of an uploaded image
  getImageUrlMethod({required String path}) async {
    return await SupabaseConnect.getImageUrl(path: path);
  }

  /// Method to add a new course to Supabase
  addCourseMethod({
    required String catagory,
    required String title,
    required String description,
    required double price,
    required int numberOfTrainees,
    required DateTime startDate,
    required DateTime endDate,
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
        image: image,
        location: location,
        state: state,
        createdAt: createdAt,
        startDate: startDate,
        endDate: endDate,
      );
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  /// Method to fetch all courses from Supabase
  /// - Converts expired courses (based on end date) from Active to InActive.

  getCoursesMethod() async {
    try {
      final responces = await SupabaseConnect.getCourses();
      if (responces.isNotEmpty) {
        final now = DateTime.now();
        for (final item in responces) {
          final endDateStr = item['endDate'];
          final state = item['state'];
          final id = item['id'];
          if (endDateStr != null && state == 'Active') {
            final endDate = DateTime.parse(endDateStr);
            if (endDate.isBefore(now)) {
              await SupabaseConnect.updatecoursesState(
                id: id,
                newState: 'InActive',
              );
            }
          }
        }

        courses = responces
            .map((item) => CourseModelMapper.fromMap(item))
            .toList();

        return courses;
      }
    } catch (e) {
      throw FormatException('faild to load courses');
    }
  }

  /// Method to delete a course by its ID
  /// Also deletes related orders automatically
  deletecourseMethod({required int idcourse}) async {
    try {
      SupabaseConnect.deletecourse(idcourse: idcourse);
    } catch (e) {
      throw FormatException('there was an error: $e');
    }
  }

  /// Method to update the user's name in the database
  updateUserNameMethod({required String name}) async {
    SupabaseConnect.updateName(name: name);
  }

  updateImageMethod({required String urlString}) async {
    SupabaseConnect.updateImage(urlString: urlString);
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

  getDetailes({required int courseId}) async {
    users = await SupabaseConnect.getDetailes(courseId: courseId);
    return users;
  }
}
