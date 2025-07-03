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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(child: Image.asset("assets/images/OrderWaiting.png")),
            Text("Thank you for your trust!", style: AppTextStyle.textbold16),
            Spacer(),
            Text(
              """Your request is under review — you’ll be notified once it’s accepted.""",
              textAlign: TextAlign.center,
              style: AppTextStyle.text14primary,
            ),
            SizedBox(height: 20),
            PrimryCustomButton(
              setText: 'Back To Home',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
