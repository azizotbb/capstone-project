import 'package:makfoul_app/model/course/course_model.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:makfoul_app/model/user_model.dart';

part 'order_model.mapper.dart';


@MappableClass()
class OrderModel with OrderModelMappable {
  int? id;
  @MappableField(key: 'created_at')
  String createdAt;
  String uid;
  @MappableField(key: 'course_id')
  int courseId;
  CourseModel? courseData;
  UserModel? userData;

  OrderModel({
    this.id,
    required this.createdAt,
    required this.uid,
    required this.courseId,
    this.courseData,
    this.userData,
  });
}
