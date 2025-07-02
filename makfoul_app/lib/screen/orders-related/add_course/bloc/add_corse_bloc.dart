import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makfoul_app/utility/permission.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:meta/meta.dart';

part 'add_corse_event.dart';
part 'add_corse_state.dart';

class AddCorseBloc extends Bloc<AddCorseEvent, AddCorseState> {
  final items = ["Cook", "Clean"];
  LatLng? selectedLocation;
  String? stringLocation;
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
  final formKey = GlobalKey<FormState>();
  String? date;
  DateTime? fileName;
  String? path;
  File? file;
  bool? isDone = false;
  AddCorseBloc() : super(AddCorseInitial()) {
    on<SelectCategoryEvent>(selectCategoryMethod);

    on<AddNewCordeEvent>(addNewCordeMethod);
    on<UploadImageEvent>(uploadImageMethod);
    on<DynamicLocationEvent>(dynamicMethod);
    on<PickLocatioEvent>(pickedMethod);
    on<SavePickedLocationEvent>(saveLocationMethod);
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
  ) async {
        fileName = DateTime.now();
     path = 'course/$fileName';
    File file = File(image!.path);

    await opreationsGet.uploadImageMethod(path: path!, file: file);

    urlString = await opreationsGet.getImageUrlMethod(path: path!);

    await opreationsGet.addCourseMethod(
      catagory: selectedCategory!,
      title: titleController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      numberOfTrainees: int.parse(numberOfTraineesController.text),
      date: pickedDate.toString(),
      image: urlString!,
      location: 'stringLocation',
      state: 'Active',
      createdAt: DateTime.now().toString(),
    );
    print('supa1');

    emit(SuccessState());
    // isDone = true;
    // image = null;
    // print(selectedCategory);
    // print(date);
  }

  //upload image need to be optimized and write it the correct way
  FutureOr<void> uploadImageMethod(
    UploadImageEvent event,
    Emitter<AddCorseState> emit,
  ) async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // final fileName = DateTime.now();
    // final path = 'course/$fileName';
    // File file = File(image!.path);
    if (image == null) {
      emit(NullState());

      return;
    }

    // opreationsGet.uploadImageMethod(path: path, file: file);
    // print('layer3');

    // Supabase.instance.client.storage.from('images').upload(path, file);
    //  urlString =  Supabase.instance.client.storage.from('images').getPublicUrl(path);
    // urlString = await opreationsGet.getImageUrlMethod(path: path);

    emit(SuccessState());
  }

  // Called when user taps a location on the map.
  // Updates temporary selected location (for marker display only).
  FutureOr<void> pickedMethod(
    PickLocatioEvent event,
    Emitter<AddCorseState> emit,
  ) {
    print('Bloc received location: ${event.location}');
    selectedLocation = event.location;
    emit(PickLocatioState(selectedLocation!));
  }

  // Called on page load to fetch user's current GPS location.
  // Used if no location is picked manually yet.
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

  // Called when user confirms and saves picked location.
  // Final location is saved and can be passed to other screens or backend.
  FutureOr<void> saveLocationMethod(
    SavePickedLocationEvent event,
    Emitter<AddCorseState> emit,
  ) {
    print('Final saved location: ${event.finalLocation}');

    selectedLocation = event.finalLocation;
    stringLocation = event.finalLocation.toString();

    emit(PickLocatioState(event.finalLocation));
  }
}
