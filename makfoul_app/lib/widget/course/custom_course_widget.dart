import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class CustomCourseWidget extends StatelessWidget {
  CustomCourseWidget({
    super.key,
    required this.coursetitle,
    required this.pricecourse,
    required this.image,
  });
  final String coursetitle;
  final double pricecourse;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.getWidth(),
        height: context.getHeight() * 0.14,
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          elevation: 3.5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListTile(
              title: Text(coursetitle, style: AppTextStyle.textbold16),
              subtitle: Text(
                "$pricecourse SAR",
                style: TextStyle(
                  color: AppColors.colorScondry,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Image.network(
                image,
                height: 80,
                width: 110,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
