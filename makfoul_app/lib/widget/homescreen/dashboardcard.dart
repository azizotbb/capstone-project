import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';

//homescreen Dashboardcard trainer
class Dashboardcard extends StatelessWidget {
  const Dashboardcard({super.key, this.child, this.hasborder = false});
  final Widget? child;
  final bool hasborder;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight() * 0.10,
      width: context.getWidth() * 0.42,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.colorMedimGrey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 2),
          ),
        ],
        border: hasborder
            ? Border.all(color: AppColors.colorMedimGrey, width: 1.0)
            : null,
        color: AppColors.colorpeige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
