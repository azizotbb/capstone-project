import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

// main category widget homescreen user
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
          child: Container(
            height: 66,
            width: 66,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorpeige,
            ),
            child: Align(
              alignment: Alignment.center,
              child: image != null
                  ? SvgPicture.asset(
                      image!,
                      height: 32,
                      width: 37,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      Icons.grid_view,
                      color: AppColors.colorScondry,
                      size: 37,
                    ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(categoryname, style: AppTextStyle.textMedium14),
      ],
    );
  }
}
