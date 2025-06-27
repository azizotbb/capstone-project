import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class EmptyCustomButton extends StatelessWidget {
  const EmptyCustomButton({super.key, required this.setText, this.onPressed});

  final String setText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.colorScondry, width: 1),
      ),
      width: context.getWidth(size: 0.469),
      height: context.getHeight(size: 0.055),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          overlayColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(setText, style: AppTextStyle.textSemiBold16),
      ),
    );
  }
}
