import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class MainCaregoryWidget extends StatelessWidget {
  const MainCaregoryWidget({
    super.key,
    this.image,
    required this.categoryname,
    required this.ontap,
  });
  final String? image;
  final String categoryname;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Stack(
            children: [
              Container(
                height: 70,
                width: 70,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorpeige,
                  // borderRadius: BorderRadius.circular(11),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: image != null
                      ? Image.asset(image!, fit: BoxFit.contain)
                      : Icon(
                          Icons.grid_view,
                          color: AppColors.colorPrimary,
                          size: 40,
                        ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(categoryname, style: AppTextStyle.textMedium14),
      ],
    );
  }
}
