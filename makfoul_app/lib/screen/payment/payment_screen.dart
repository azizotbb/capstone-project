import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/payment/orderwating.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Payment", style: AppTextStyle.textTitleLarg24dark),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 22, left: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(setHint: 'Cardholder Name'),
            SizedBox(height: 12),
            CustomTextField(setHint: 'Card Number'),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: CustomTextField(setHint: 'Expiration')),
                SizedBox(width: 12),
                Expanded(child: CustomTextField(setHint: 'CVV')),
              ],
            ),
            Spacer(),
            PrimryCustomButton(
              setText: 'Pay',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orderwaiting()),
                );
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
