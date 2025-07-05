import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makfoul_app/model/userinfo_model.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final String confirmPassword = '';
  final TextEditingController nameController = TextEditingController();
  final getAuth = GetIt.I.get<AuthLayer>();
  final getOpreations = GetIt.I.get<OpreationsLayer>();
  String? urlString;
  XFile? image;
  UserModel userinfo = GetIt.I.get<AuthLayer>().userinfo;

  ProfileBloc() : super(ProfileInitial()) {
    on<UpdatePasswordEvent>(updatePasswordMethod);
    on<UpdateNameEvent>(updateNameMethod);
    on<UpdateImageEvent>(updateImageMethod);
  }

  FutureOr<void> updatePasswordMethod(
    UpdatePasswordEvent event,
    Emitter<ProfileState> emit,
  ) {
    getAuth.updatePasswordMethod(
      password: newPasswordController.text,
      oldPassword: passwordController.text,
    );
  }

  FutureOr<void> updateNameMethod(
    UpdateNameEvent event,
    Emitter<ProfileState> emit,
  ) {
    getOpreations.updateUserNameMethod(name: nameController.text);
    emit(SuccessState());
  }

  FutureOr<void> updateImageMethod(
    UpdateImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final imageName = DateTime.now();
    final String path = 'avatar/$imageName';
    File file = File(image!.path);
    print(image);
    if (image == null) return;

    await getOpreations.uploadImageMethod(path: path, file: file);
    print(urlString);
    urlString = await getOpreations.getImageUrlMethod(path: path);
    print('--------------------------------');
    userinfo.url = urlString;
    print(urlString);

    await getOpreations.updateImageMethod(urlString: urlString!);

    emit(SuccessState());
  }
}
