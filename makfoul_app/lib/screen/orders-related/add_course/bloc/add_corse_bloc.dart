import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_corse_event.dart';
part 'add_corse_state.dart';

class AddCorseBloc extends Bloc<AddCorseEvent, AddCorseState> {
  final items = ["Cook", "Clean"];

  String? selectedCategory;
  XFile? image;
  DateTimeRange<DateTime>? pickedDate;
  String? urlString;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberOfTraineesController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final opreationsGet = GetIt.I.get<OpreationsLayer>();
  // final
  String? date;

  AddCorseBloc() : super(AddCorseInitial()) {
    on<SelectCategoryEvent>(selectCategoryMethod);
    on<AddNewCordeEvent>(addNewCordeMethod);
    on<UploadImageEvent>(uploadImageMethod);
    on<GetCoursesEvent>(getCourseMethod);
    on<DeleteCourseEvent>(deleteCourseMethod);
  }

  FutureOr<void> selectCategoryMethod(
    SelectCategoryEvent event,
    Emitter<AddCorseState> emit,
  ) {
    selectedCategory = event.value;
    print ("category ${selectedCategory}");
    emit(SelectCategoryState());
   add(GetCoursesEvent(id: Supabase.instance.client.auth.currentUser!.id));
  }

  FutureOr<void> addNewCordeMethod(

  AddNewCordeEvent event,

  Emitter<AddCorseState> emit,

) async {
  final start= pickedDate?.start??DateTime.now();
  final end =pickedDate?.end??DateTime.now();
  final now=DateTime.now();
  int registered=0; 
  int required=int.parse(numberOfTraineesController.text);

  final String courseState; 
  if(now.isAfter(end)){
    courseState="InActive";

  }else if(registered>=required){
    courseState="InActive"; 
  }else{
    courseState="Active";
  }

  final result = await opreationsGet.addCourseMethod(
    catagory: selectedCategory!,
    title: titleController.text,
    description: descriptionController.text,
    price: double.parse(priceController.text),
    numberOfTrainees: int.parse(numberOfTraineesController.text),
    startDate: pickedDate?.start??DateTime.now(),
    endDate: pickedDate?.end??DateTime.now(),
    image: urlString!,
    location: 'location',
    state: courseState,
    createdAt: DateTime.now().toString(),

  );

    final updatedCourses = await opreationsGet.getCoursesMethod( 
    );
 try {
      final courseuser =await opreationsGet.courses.where(
        (e) => e.tid == Supabase.instance.client.auth.currentUser!.id,
      );
      print("to try rode   ${courseuser}");
      final total = await courseuser.length;
      final active = await courseuser.where((e) => e.state == 'Active').length;
      final inactive = await courseuser
          .where((e) => e.state == 'InActive')
          .length;
      final cook = await courseuser.where((e) => e.category == 'Cook').length;
      final clean = await courseuser.where((e) => e.category == 'Clean').length;
      print("total${total}");
      print("active${active}");
      print("inactive${inactive}");
      print("cook${cook}");
      print("clean${clean}"); 
      emit(
        CoursesLoaded().copyWith(
          trainearcourses: courseuser.toList(),
          total: total,
          active: active,
          inactive: inactive,
          cook: cook,
          clean: clean,
        ),
      );
    } catch (e) {
      log("error :$e");
    }
 descriptionController.clear();
                                                 titleController.clear(); 
                                                priceController.clear(); 
                                              numberOfTraineesController.clear();
                                                selectedCategory=null; 
                                                  pickedDate=null; 
                                                  image=null; 

  

}


  //upload image need to be optimized and write it the correct way
  FutureOr<void> uploadImageMethod(
    UploadImageEvent event,
    Emitter<AddCorseState> emit,
  ) async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final fileName = DateTime.now();
    final path = 'course/$fileName';
    File file = File(image!.path);
    if (image == null) return;

    opreationsGet.uploadImageMethod(path: path, file: file);
    print('layer3');

    // Supabase.instance.client.storage.from('images').upload(path, file);
    //  urlString =  Supabase.instance.client.storage.from('images').getPublicUrl(path);
    urlString = await opreationsGet.getImageUrlMethod(path: path);
  }

  FutureOr<void> getCourseMethod(
    GetCoursesEvent event,
    Emitter<AddCorseState> emit,
  ) async {
    try {
      final courseuser = opreationsGet.courses.where(
        (e) => e.tid == Supabase.instance.client.auth.currentUser!.id,
      ).toList();
      print("from courses : ${opreationsGet.courses.length}");
      print("to try rode   ${courseuser}");
      final total = await courseuser.length;
      final active = await courseuser.where((e) => e.state == 'Active').length;
      final inactive = await courseuser
          .where((e) => e.state == 'InActive')
          .length;
      final cook = await courseuser.where((e) => e.category == 'Cook').length;
      final clean = await courseuser.where((e) => e.category == 'Clean').length;
      print("total${total}");
      print("active${active}");
      print("inactive${inactive}");
      print("cook${cook}");
      print("clean${clean}");
      emit(
        CoursesLoaded().copyWith(
          trainearcourses: courseuser,
          total: total,
          active: active,
          inactive: inactive,
          cook: cook,
          clean: clean,
        ),
      );
    } catch (e) {
      log("error in get course method$e");
    }
  }

  FutureOr<void> deleteCourseMethod(
    DeleteCourseEvent event,
    Emitter<AddCorseState> emit,
  ) async {
    await opreationsGet.deletecourseMethod(idcourse: event.courseId);
    final updatecourses = await opreationsGet.getCoursesMethod();
    emit(CoursesLoaded().copyWith(trainearcourses: updatecourses));
   add(GetCoursesEvent(id: Supabase.instance.client.auth.currentUser!.id));
  }
}
