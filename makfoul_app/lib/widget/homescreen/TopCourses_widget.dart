import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(clipBehavior: Clip.hardEdge,
              height: 120,
              decoration: BoxDecoration(
        
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(image,fit: BoxFit.fill,),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coursename,
                  style: AppTextStyle.textbold16,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        spacing: 4,
                        children: [
                          Image.asset(
                            "assets/images/Saudi_Riyal_Symbol.png",
                            height: 13,
                          ),
                          Text(
                            price.toString(),
                            style: AppTextStyle.textMedium14,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 1,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.colorPrimary,
                        ),
                        Text('Riyadh'.tr(), style: AppTextStyle.textMedium14),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
