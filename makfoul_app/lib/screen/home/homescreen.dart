import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/TopCourses_widget.dart';
import 'package:makfoul_app/widget/homescreen/main_caregory_widget.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BackgroundColorWidget(height: 116),
                Positioned(
                  left: 30,
                  top: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("hi".tr() + name!, style: AppTextStyle.textButton20),
                      SizedBox(height: 8),
                      Text(
                        'ad_title'.tr(),
                        style: AppTextStyle.text14,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 40,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "create_account".tr(),
                      style: AppTextStyle.textMedium14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: context.getWidth(),
              height: context.getHeight() * 0.2,
              child: PageView(
                children: [
                  Image.asset("assets/images/addcard.png", fit: BoxFit.contain),
                  Stack(
                    children: [
                      Image.asset("assets/images/Ad2.png"),
                      Positioned(
                        left: 65,
                        bottom: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(80, 30),
                            backgroundColor: AppColors.colorPrimary,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Join",
                            style: TextStyle(color: AppColors.colorpeige),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Courses
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("courses".tr(), style: AppTextStyle.textTitleLarg24dark),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCaregoryWidget(
                    image: null,
                    categoryname: 'all'.tr(),
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'courses'.tr()),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  MainCaregoryWidget(
                    image: "assets/images/Clean (2).png",
                    categoryname: 'clean'.tr(),
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'clean_courses'.tr()),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  MainCaregoryWidget(
                    image: "assets/images/cook (2).png",
                    categoryname: 'cook'.tr(),
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'cook_courses'.tr()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "top_courses".tr(),
                style: AppTextStyle.textTitleLarg24dark,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: context.getHeight() * 0.33,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.80),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return TopCourses(
                    image: 'assets/images/TopCourse.png',
                    //supabase get the name for the trainer and location and price
                    coursename: 'Amal',
                    location: 'Alrass',
                    price: 150,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
