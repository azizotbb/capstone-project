import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
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

  String? date;

  AddCorseBloc() : super(AddCorseInitial()) {
    on<SelectCategoryEvent>(selectCategoryMethod);

    on<AddNewCordeEvent>(addNewCordeMethod);
    on<UploadImageEvent>(uploadImageMethod);
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
    print('supa1');

    // print(selectedCategory);
    // print(date);
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
}
