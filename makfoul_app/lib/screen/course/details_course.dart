import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/course_info.dart';
import 'package:makfoul_app/widget/course/regusterd_widget.dart';

class DetailsCourse extends StatelessWidget {
  const DetailsCourse({
    super.key,

    this.coursetitle,
    this.categoryimage,
    this.regusterednum,
    this.canreguster,
  });

  final String? coursetitle;
  final String? categoryimage;
  final int? regusterednum;
  final int? canreguster;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text("Details", style: AppTextStyle.textTitleLarg24dark),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  "Course Title",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.colorDarkGrey,
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Course information",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.colorDarkGrey,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                CourseInfo(
                  categoryimage: 'assets/images/Clean (2).png',
                  categoryname: 'Clean',
                  date: "2222/23/4",
                  location: 'Alrass',
                  description:
                      'gfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgffggfgfgfgfgfg',
                  price: 150,
                  isActive: true,
                  trainer: 'Amal Abdallah',
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        "Registered in the Course",
                        style: AppTextStyle.textbold16,
                      ),
                      Spacer(),
                      Text("$regusterednum" + "/" + "$canreguster"),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                SizedBox(
                  height: context.getHeight() * 0.7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: RegusterdWidget(
                          numserial: index + 1,
                          username: 'Raghad',
                          image: 'assets/images/circler avtar instructor.png',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
