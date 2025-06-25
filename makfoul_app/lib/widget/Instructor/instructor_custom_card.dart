import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class InstructorCustomCard extends StatelessWidget {
  final String title;
  final String avatar;
  final String trainerName;

  const InstructorCustomCard({
    super.key,
    required this.title,
    required this.trainerName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        leading: CircleAvatar(maxRadius: 30, child: Image.asset(avatar)),
        title: Text(title, style: AppTextStyle.textReguler16),
        subtitle: Text(trainerName, style: AppTextStyle.text14primary),
      ),
    );
  }
}
