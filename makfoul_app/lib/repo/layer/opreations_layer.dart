import 'dart:io';
import 'dart:math';

import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/model/order/order_model.dart';
import 'package:makfoul_app/model/user_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';

class OpreationsLayer {
  // List to store courses
  List<CourseModel> courses = [];
  List<OrderModel> users = [];


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
         startDate: startDate, endDate: endDate,
      );
      // getCoursesMethod();
      print('supa2');
    } catch (error) {
      throw FormatException('there was an error: $error');
    }
  }

  /// Get courses from Supabase and save them to the list
  // getCoursesMethod() async {
  //   // Get course data from Supabase
  //   print("get course method rodeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  //   final response = await SupabaseConnect.getCourses();
  //   print("الريسبونس والكورسات هذي : $response");
  //   // Convert the data to CourseModel objects if not empty
  //   if (response.isNotEmpty) {
  //     courses = response.map((item) {
  //       return CourseModelMapper.fromMap(item);
  //     }).toList();
  //   }
  // }
 getCoursesMethod() async{
  try{
    final responces=await SupabaseConnect.getCourses();
    if(responces.isNotEmpty){
      print("responce in layer is look :$responces");
      final now= DateTime.now();
      for(final item in responces){
        final endDateStr=item['endDate'];
        final state =item['state'];
        final id=item['id']; 
        if(endDateStr!=null &&state=='Active'){
          final endDate=DateTime.parse(endDateStr);
          if(endDate.isBefore(now)){
            await SupabaseConnect.updatecoursesState(id: id, newState: 'InActive');
          }
        }
      }
    
      courses= await responces.map((item)=>CourseModelMapper.fromMap(item)).toList();
      return courses;
    }
  }catch(e){
    print("error in get course method layer $e");
    throw FormatException('faild to load courses');
  }
}


  deletecourseMethod({required int idcourse}) async{
 try{
SupabaseConnect.deletecourse(idcourse: idcourse);
 }catch(e){
print("error in delet course $e");
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


  getDetailes({required int courseId})async{
    print(users);

     users = await SupabaseConnect.getDetailes(courseId: courseId);
  
    


  }

}
