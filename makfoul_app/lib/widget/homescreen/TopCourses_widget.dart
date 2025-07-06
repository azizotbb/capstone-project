import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

//the
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
      padding: const EdgeInsets.only(top: 5, right: 3, left: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.colorpeige,
          boxShadow: [
            BoxShadow(
              color: AppColors.colorMedimGrey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 11, right: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 122,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Image.network(image, fit: BoxFit.fill),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 5),
                      Text(
                        coursename,
                        style: AppTextStyle.textbold16,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Image.asset("assets/images/Location.png"),
                          SizedBox(width: 8),
                          Text(location, style: AppTextStyle.textMedium14),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: null,
                child: Text("${price} SAR", style: AppTextStyle.textMedium14),
              ),
            ),
          ],
        ),

        // Positioned(
        //   right: 16,
        //   bottom: 14,
        //   child:
      ),
    );
  }
}
