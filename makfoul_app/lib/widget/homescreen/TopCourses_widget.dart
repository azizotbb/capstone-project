import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class TopCourses extends StatelessWidget {
  const TopCourses({
    super.key,
    required this.image,
    required this.coursename,
    required this.location,
    required this.price,
  });
  final String image;
  final String coursename;
  final String location;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 8, left: 8),
      child: Container(
        height: context.getHeight() * 0.30,
        width: context.getWidth() * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.colorpeige,
          border: Border.all(color: AppColors.colorMedimGrey, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(1, 2),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(coursename, style: AppTextStyle.textbold16),

                    Row(
                      children: [
                        Image.asset("assets/images/Location.png"),
                        SizedBox(width: 8),
                        Text(location, style: AppTextStyle.textMedium14),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("${price} SAR", style: AppTextStyle.textMedium14),
                    Container(alignment: context.locale.countryCode == 'US'? Alignment.centerRight:Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "view_details".tr(),
                          style: AppTextStyle.textMedium14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //   right: 16,
        //   bottom: 14,
        //   child:
      ),
    );
  }
}
