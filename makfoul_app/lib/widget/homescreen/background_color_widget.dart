import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
//homescreen BackgroundColorWidget
class BackgroundColorWidget extends StatelessWidget {
  const BackgroundColorWidget({super.key, required this.height, this.child});
  final double height;
  final Widget ?child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
      ),
      child: child,
    );
  }
}
