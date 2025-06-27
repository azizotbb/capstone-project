import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';

class Dashboardcard extends StatelessWidget {
  const Dashboardcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.colorpeige,
        borderRadius: BorderRadius.circular(24),
      ),
      
    );
  }
}
