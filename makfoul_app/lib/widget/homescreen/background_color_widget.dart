import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
//homescreen BackgroundColorWidget
class BackgroundColorWidget extends StatelessWidget {
  const BackgroundColorWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
      ),
    );
  }
}
