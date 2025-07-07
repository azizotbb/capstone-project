import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/auth/signup/signup.dart';
import 'package:makfoul_app/style/app_colors.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
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
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
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
      ),
    );
  }
}
