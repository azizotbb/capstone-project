import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class InstructorCustomCard extends StatelessWidget {
  final String title;
  final String avatar;
  final String trainerName;
  final VoidCallback ontap;
  const InstructorCustomCard({
    super.key,
    required this.title,
    required this.trainerName,
    required this.avatar,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          minVerticalPadding: 30,
          leading: Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.network(avatar, fit: BoxFit.cover),
          ),
          title: Text(title, style: AppTextStyle.textReguler16),
          subtitle: Row(
            spacing: 2,
            children: [
              Image.asset("assets/images/Saudi_Riyal_Symbol.png", height: 10),
              Text(trainerName, style: AppTextStyle.text14primary),
            ],
          ),
        ),
      ),
    );
  }
}
