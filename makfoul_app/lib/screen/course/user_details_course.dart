import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/course_info.dart';

class UserDetailsCourse extends StatelessWidget {
  final String desc;
  final String categoryname;
  final String startDate;
  final String endDate;
  final String? location;
  final String state;
  final double price;
  final String coursetitle;
  final String? categoryimage;
  final int? regusterednum;
  final int canreguster;
  final String tranername;
  final String tranerPhone;

  const UserDetailsCourse({
    super.key,
    required this.desc,
    required this.categoryname,
    required this.startDate,
    required this.endDate,
    this.location,
    required this.state,
    required this.price,
    required this.coursetitle,
    this.categoryimage,
    this.regusterednum,
    required this.canreguster,
    required this.tranername,
    required this.tranerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: AppColors.colorDarkGrey,
                    ),
                    SizedBox(width: 90),
                    Text(
                      "Details".tr(),
                      style: AppTextStyle.textTitleLarg24dark,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  coursetitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.colorDarkGrey,
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Course information".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                CourseInfo(
                  categoryimage: categoryname == "Clean"
                      ? "assets/images/Clean (2).png"
                      : "assets/images/cook (2).png",
                  categoryname: categoryname.tr(),
                  startDate: startDate,
                  endDate: endDate,
                  location: 'Ryaidh'.tr(),
                  description: desc,
                  price: price,
                  isActive: state,
                  trainer: tranername,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Trainer".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(":  $tranername"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(":  $tranerPhone"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
