import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/screen/payment/payment_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;
    final bool isgust = userinfo == null;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.getWidth(),
                  height: 300,
                  child: Image.asset("assets/chef.jpg"),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.colorDarkGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Course title", style: AppTextStyle.textbold16),
                      SizedBox(height: 8),
                      Text(
                        "Cooking and Cleaning Trainer Cooking and Cleaning Trainer Cooking and Cleaning Trainer Cooking and Cleaning Trainer Cooking and Cleaning Trainer Cooking and Cleaning Trainer",
                        style: AppTextStyle.textDes12,
                      ),
                      SizedBox(height: 16),

                      Text("Location", style: AppTextStyle.textbold16),
                      SizedBox(height: 16),
                      SizedBox(
                        width: context.getWidth(),
                        height: 150,
                        child: Image.asset("assets/google.png"),
                      ),
                      SizedBox(height: 100),

                      Center(
                        child: PrimryCustomButton(
                          setText: "Add to Cart",
                          onPressed: () {
                            if (isgust) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.colorpeige,
                                    content: Text(
                                      "This feature is restricted to registered user",
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.colorPrimary,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "restricter",
                                          style: TextStyle(
                                            color: AppColors.colorpeige,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
