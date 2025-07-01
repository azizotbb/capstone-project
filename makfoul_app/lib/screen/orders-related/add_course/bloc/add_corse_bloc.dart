import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makfoul_app/utility/permission.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'add_corse_event.dart';
part 'add_corse_state.dart';

class AddCorseBloc extends Bloc<AddCorseEvent, AddCorseState> {
  final items = ["Cook", "Clean"];
  LatLng? selectedLocation;

  String? selectedCategory;
  XFile? image;
  String? urlString;
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
    on<DynamicLocationEvent>(dynamicMethod);
    on<PickLocatioEvent>(pickedMethod);
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
    urlString = Supabase.instance.client.storage
        .from('images')
        .getPublicUrl(path);
  }

  FutureOr<void> pickedMethod(
    PickLocatioEvent event,
    Emitter<AddCorseState> emit,
  ) {
     print('Bloc received location: ${event.location}');
    selectedLocation = event.location;
    emit(PickLocatioState(selectedLocation!));
  }

  FutureOr<void> dynamicMethod(
    DynamicLocationEvent event,
    Emitter<AddCorseState> emit,
  ) async {
    try {
      final position = await determinePosition();
      final location = LatLng(position.latitude, position.longitude);
      emit(LocationLodedState(location));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
