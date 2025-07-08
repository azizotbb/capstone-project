import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:makfoul_app/style/app_colors.dart';

// CourseInfo details screen
class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.categoryimage,
    required this.categoryname,
    required this.startDate,
    required this.location,
    required this.description,
    required this.price,
    required this.isActive,
    required this.trainer,
    required this.endDate,
  });
  final String categoryimage;
  final String categoryname;
  final String startDate;
  final String endDate;
  final String location;
  final String description;
  final double price;
  final String isActive;
  final String trainer;

  @override
  Widget build(BuildContext context) {
    final startdateday = DateTime.parse(startDate);
    final enddateday = DateTime.parse(endDate);
    String formateddateStart = DateFormat('yyyy-MM-dd').format(startdateday);
    String formateddateEnd = DateFormat('yyyy-MM-dd').format(enddateday);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/calender.svg'),
                  // Image.asset("assets/images/date.png"),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "$formateddateStart ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "$formateddateEnd ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(categoryimage, height: 25, width: 25),
                  SizedBox(width: 10),
                  Text(
                    categoryname,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              Row(
                children: [
                
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.colorScondry,
                  ),
                  SizedBox(width: 10),
                  Text(location, style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Text(
                    "Price".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  Text(":  $price"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "State".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(":  $isActive"),
                  SizedBox(width: 45),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
