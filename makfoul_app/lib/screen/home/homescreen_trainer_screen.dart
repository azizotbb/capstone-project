import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/model/coursemodel.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/TopCourses_widget.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/dashboardcard.dart';

class HomescreenTrainerScreen extends StatelessWidget {
  const HomescreenTrainerScreen({super.key});
  final int totalcourse = 10;
  final int numofactivecourse = 5;
  final int numofainctivecourse = 5;
  final int cleancourse = 3;
  final int cookcourse = 7;
  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;
    return Scaffold(
      //header
      body: Column(
        children: [
          Stack(
            children: [
              BackgroundColorWidget(height: 160),
              Padding(
                padding: EdgeInsets.all(9),
                child: SafeArea(
                  child: Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Image.asset(
                          "assets/images/circler avtar instructor.png",
                        ),
                      ),
                      title: Text(
                        "Hi,".tr() + userinfo.username,
                        style: AppTextStyle.textTitleLarg24dark,
                      ),
                      subtitle: Text(
                        "your dashboard for managing training courses \nand empowering domestic workers ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.colorDarkGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //body
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                children: [
                  //Dashboard
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dashboard ",
                      style: AppTextStyle.textTitleLarg24dark,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Dashboardcard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "All courses",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.colorDarkGrey,
                              ),
                            ),
                            Text(
                              "${totalcourse}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.colorScondry,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Dashboardcard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "active",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColors.colorDarkGrey,
                                  ),
                                ),
                                Text(
                                  "${numofactivecourse}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColors.colorScondry,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "inactive",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColors.colorDarkGrey,
                                  ),
                                ),
                                Text(
                                  "${numofainctivecourse}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: AppColors.colorScondry,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Dashboardcard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "courses",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.colorDarkGrey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/Clean (2).png",
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  "${cleancourse}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/cook (2).png",
                                  height: 20,
                                  width: 20,
                                ),
                                Text(
                                  "${cookcourse}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Dashboardcard(
                        hasborder: true,
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add Course",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: AppColors.colorDarkGrey,
                                ),
                              ),
                              Image.asset("assets/images/AddCourse.png"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Courses
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Courses ",
                      style: AppTextStyle.textTitleLarg24dark,
                    ),
                  ),
                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 3,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final e = courses[index];
                      return TopCourses(
                        image: e.image,
                        coursename: e.coursename,
                        location: e.addres,
                        price: e.price,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
