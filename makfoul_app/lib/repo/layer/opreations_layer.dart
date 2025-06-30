import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/repo/api/supabase.dart';

class OpreationsLayer {
  // List to store courses
  List<CourseModel> courses = [];

  /// Get courses from Supabase and save them to the list
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
}
