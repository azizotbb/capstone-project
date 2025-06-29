import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_corse_event.dart';
part 'add_corse_state.dart';

class AddCorseBloc extends Bloc<AddCorseEvent, AddCorseState> {
  final items = ["Cook", "Clean"];

  String? selectedCategory;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController numberOfTraineesController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String? date;

  AddCorseBloc() : super(AddCorseInitial()) {
    on<SelectCategoryEvent>(selectCategoryMethod);

    on<AddNewCordeEvent>(addNewCordeMethod);
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
    print(selectedCategory);
    print(date);
  }
}
