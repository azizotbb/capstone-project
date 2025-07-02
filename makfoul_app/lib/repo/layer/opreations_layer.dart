import 'dart:io';

import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';

class OpreationsLayer {
  // List to store courses
  List<CourseModel> courses = [];

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

  addOrderMethod({
    required String createdAt,
    required String uid,
    required int courseId,
  }) {
    try {
      SupabaseConnect.addOrder(
        createdAt: createdAt,
        uid: uid,
        courseId: courseId,
      );
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }
}
