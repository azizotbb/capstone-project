import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/TopCourses_widget.dart';
import 'package:makfoul_app/widget/homescreen/main_caregory_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;
    // final bool isgust = userinfo == null;
    final allCourses = GetIt.I.get<OpreationsLayer>().courses;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            height: context.getHeight() * 0.35,
            child: Stack(
              children: [
                BackgroundColorWidget(height: 230),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Container(
                    width: context.getWidth(),
                    child: ListTile(
                      leading: Container(
                        height: 68,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: userinfo.url == null
                            ? Image.asset(
                                "assets/images/circler avtar instructor.png",
                              )
                            : Image.network(userinfo.url!),
                      ),
                      title: Text(
                        "Hi,".tr() + userinfo.username,
                        style: AppTextStyle.textTitleLarg24dark,
                      ),
                      subtitle: Text(
                        'ad_title'.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.colorDarkGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                userinfo.role == 'User'
                    ? Container()
                    : Positioned(
                        right: 20,
                        top: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "create_account".tr(),
                            style: AppTextStyle.textMedium14,
                          ),
                        ),
                      ),

                Positioned(
                  top: 120,
                  child: Container(
                    width: context.getWidth(),
                    child: AspectRatio(
                      aspectRatio: 16 / 7,
                      child: PageView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              "assets/images/adcard1.png",
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/Ad2.png",
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: 65,
                                bottom: 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(80, 30),
                                    backgroundColor: AppColors.colorPrimary,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Join",
                                    style: TextStyle(
                                      color: AppColors.colorpeige,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "courses".tr(),
                      style: AppTextStyle.textTitleLarg24dark,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MainCaregoryWidget(
                        image: null,
                        categoryname: 'all'.tr(),
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainerScreen(
                                appbarTitle: 'courses'.tr(),
                                courses: allCourses,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12),
                      MainCaregoryWidget(
                        image: "assets/images/Clean (2).png",
                        categoryname: 'clean'.tr(),
                        ontap: () {
                          List cleanCourses = allCourses
                              .where((course) => course.category == "Clean")
                              .toList();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainerScreen(
                                appbarTitle: 'clean_courses'.tr(),
                                courses: cleanCourses,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12),
                      MainCaregoryWidget(
                        image: "assets/images/cook (2).png",
                        categoryname: 'cook'.tr(),
                        ontap: () {
                          List cookCourses = allCourses
                              .where((course) => course.category == "Cook")
                              .toList();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainerScreen(
                                appbarTitle: 'cook_courses'.tr(),
                                courses: cookCourses,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  //top courses
                  Text(
                    "top_courses".tr(),
                    style: AppTextStyle.textTitleLarg24dark,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: context.getHeight() * 0.30,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.99),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: TopCourses(
                            image: allCourses[index].image,
                            //supabase get the name for the trainer and location and price
                            coursename: allCourses[index].title,
                            location: "الرياض",
                            price: allCourses[index].price,
                          ),
                        );
                      },
                    ),
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
