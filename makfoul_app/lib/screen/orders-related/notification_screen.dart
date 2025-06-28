import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/notification/custom_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Text('notiifcations'.tr(), style: AppTextStyle.textTitleLarg24dark),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            //show order
            CustomNotification(setText: 'Hellooooooooooooooooo'),
            CustomNotification(
              setText: 'Hellooooooooooooooooo',
              isOrderRequest: false,
            ),
          ],
        ),
      ),
    );
  }
}
