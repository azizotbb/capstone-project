import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/home/homescreen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class Orderwaiting extends StatelessWidget {
  const Orderwaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Center(child: Image.asset("images/OrderWaiting.png")),
            Text("Thank you for your trust!", style: AppTextStyle.textbold16),
            SizedBox(height: 12),
            Text(
              " Your request is under review by available trainers.\n We’ll notify you as soon as it’s confirmed.",
              textAlign: TextAlign.center,
              style: AppTextStyle.text14primary,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                "“You’ll receive a notification once your request is accepted”",
                textAlign: TextAlign.center,
                style: AppTextStyle.text14primary,
              ),
            ),
            // SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: PrimryCustomButton(
                setText: 'Back To Home',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
            ),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }
}
