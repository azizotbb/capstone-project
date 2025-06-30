import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconButton,
  });
  final void Function()? onPressed;
  final Icon iconButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 59,
      decoration: BoxDecoration(
        color: AppColors.colorLightGrey,
        borderRadius: BorderRadius.circular(17),
      ),
      child: IconButton(
        onPressed:onPressed,
        icon:iconButton,
        color: AppColors.colorDarkGrey,
        iconSize:25 ,
       )
    );
  }
}
