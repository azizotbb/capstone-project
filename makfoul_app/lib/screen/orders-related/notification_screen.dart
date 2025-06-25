
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
        title: Text('Notiifcations', style: AppTextStyle.textTitleLarg24),
        centerTitle: true,
      ),

      body: Center(
        child: Column(spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            CustomNotification(setText: 'Hellooooooooooooooooo'),
            CustomNotification(setText: 'Hellooooooooooooooooo',isOrderRequest: false,),
          ],
        ),
      ),
    );
  }
}
