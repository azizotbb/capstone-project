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
  }

  FutureOr<void> selectCategoryMethod(
    SelectCategoryEvent event,
    Emitter<AddCorseState> emit,
  ) {
    selectedCategory = event.value;
    emit(SelectCategoryState());
  }

  FutureOr<void> addNewCordeMethod(
    AddNewCordeEvent event,
    Emitter<AddCorseState> emit,
  ) {
    opreationsGet.addCourseMethod(
      catagory: selectedCategory!,
      title: titleController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      numberOfTrainees: int.parse(numberOfTraineesController.text),
      date: pickedDate.toString(),
      image: urlString!,
      location: 'location',
      state: 'Active',
      createdAt: DateTime.now().toString(),
    );
    // emit(SuccessState());
    // opreationsGet.getCoursesMethod();
    add(GetCoursesEvent(id: Supabase.instance.client.auth.currentUser!.id));
    print('supa1');
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
      final courseuser = opreationsGet.courses.where((e) => e.tid == Supabase.instance.client.auth.currentUser!.id);
      print("to try rode   ${courseuser}");
      final total = await courseuser.length;
      final active = await courseuser.where((e) => e.state == 'Active').length;
      final inactive = await courseuser
          .where((e) => e.state == 'inactive')
          .length;
      final cook = await courseuser.where((e) => e.category == 'Cook').length;
      final clean = await courseuser.where((e) => e.category == 'Clean').length;
      print("total${total}");
      print("active${active}");
      print("inactive${inactive}");
      print("cook${cook}");
      print("clean${clean}");
      emit(
        CoursesLoaded(
          trainearcourses:courseuser.toList(),
          total: total,
          active: active,
          inactive: inactive,
          cook: cook,
          clean: clean,

        ),
      );
    } catch (e) {
      log("error rodeeee whyydsydydfydf:$e");
    }
  }
}
