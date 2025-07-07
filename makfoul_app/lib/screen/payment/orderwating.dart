import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/botton_nav/bottom_navigation_widget.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class Orderwaiting extends StatelessWidget {
  const Orderwaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(child: Image.asset("assets/images/OrderWaiting.png")),
            Text(
              "Thank you for your trust!".tr(),
              style: AppTextStyle.textbold16,
            ),
            Spacer(),
            Text(
              "Thank you! Your payment was processed successfully.".tr(),
              textAlign: TextAlign.center,
              style: AppTextStyle.text14primary,
            ),
            SizedBox(height: 20),
            PrimryCustomButton(
              setText: 'Back To Home'.tr(),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavigationWidget(),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
