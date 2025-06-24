import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.setHint,
    this.isPassword = false,
    this.isSmall = false,
    this.suffIcon,
    this.prefIcon,
    this.isDescription = false,
    this.controller,
    this.validator,
    this.isVisable,
    this.onPressedSuffix,
  });

  //set Hint text
  final String setHint;
  // is obscure text or not
  bool? isPassword;
  // width small or large
  bool? isSmall;
  // extended height for description
  bool? isDescription;
  //Change visablity
  final bool? isVisable;
  //handle suffix on click for visability
  final void Function()? onPressedSuffix;
  //suffix icon
  final Icon? suffIcon;
  //prefix icon
  final Icon? prefIcon;
  //controller for the input
  final TextEditingController? controller;
  //validate user input
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmall!
          ? context.getWidth(size: 0.38)
          : context.getWidth(size: 0.9),
      child: TextFormField(
        validator: validator,
        controller: controller,
        //change the height if it's a description
        maxLines: isDescription! ? 5 : 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.colorLightGrey,
          prefixIcon: prefIcon,
          suffixIcon: isPassword!
              //if password will be given the visibility icon by default
              //onpressdsuffix can be called so it will handle the icon if it's turend on or off
              ? (IconButton(
                  onPressed: onPressedSuffix,
                  icon: isVisable!
                      ? Icon(
                          Icons.visibility_outlined,
                          color: AppColors.colorMedimGrey,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: AppColors.colorMedimGrey,
                        ),
                ))
              //give it other icon
              : suffIcon,
          //hint text
          hintText: setHint,
          hintStyle: AppTextStyle.textDes12,
          //underline border none
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide.none,
          ),
        ),
        //check if the password is obscure or not
        obscureText: isPassword! ? true : false,
      ),
    );
  }
}
