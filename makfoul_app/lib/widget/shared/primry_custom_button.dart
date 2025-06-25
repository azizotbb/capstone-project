import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class PrimryCustomButton extends StatelessWidget {
  const PrimryCustomButton({super.key, required this.setText, this.onPressed});

  final String setText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorScondry,
        minimumSize: Size(context.getWidth(), 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      onPressed: onPressed,
      child: Text(setText, style: AppTextStyle.textButton20),
    );
  }
}
