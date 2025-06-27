import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/coursemodel.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundColorWidget(height: 150),
                Padding(
                  padding: EdgeInsets.all(9),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset(
                            "assetsظimagesظcircler avtar instructor.png",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi,",
                              style: AppTextStyle.textTitleLarg24dark,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "your dashboard for managing training \n courses and empowering  domestic workers ",

                              style: AppTextStyle.textMedium14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dashboard ",
                  style: AppTextStyle.textTitleLarg24dark,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 1.4,
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Dashboardcard(),
                      Column(
                        children: [Text("All courses"), Text("${totalcourse}")],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Dashboardcard(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("active"),
                              Text("${numofactivecourse}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("inactive"),
                              Text("${numofainctivecourse}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Dashboardcard(),
                      Column(
                        children: [
                          Text("course"),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/Clean (2).png",
                                height: 20,
                                width: 20,
                              ),
                              Text("${cleancourse}"),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/cook (2).png",
                                height: 20,
                                width: 20,
                              ),
                              Text("${cookcourse}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Dashboardcard(),
                        Column(
                          children: [
                            Text("Add Course"),
                            Image.asset("assets/images/AddCourse.png"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Courses ",
                  style: AppTextStyle.textTitleLarg24dark,
                ),
              ),
            ),
            SizedBox(
              height: context.getHeight() * 0.40,
              child: GridView.count(
                crossAxisCount: 2,
                children: courses.map((e) {
                  return TopCourses(
                    image: e.image,
                    coursename: e.coursename,
                    location: e.addres,
                    price: e.price,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
