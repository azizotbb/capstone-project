import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_corse_event.dart';
part 'add_corse_state.dart';

class AddCorseBloc extends Bloc<AddCorseEvent, AddCorseState> {
  final items = ["Cook", "Clean"];

  String? selectedCategory;
  XFile? image;
 String? urlString ;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberOfTraineesController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();

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

    Supabase.instance.client.storage.from('images').upload(path, file);
   urlString =  Supabase.instance.client.storage.from('images').getPublicUrl(path);

  
  }
}
