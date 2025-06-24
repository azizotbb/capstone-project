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
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15),
        ],
      ),
      child: ListTile(
        leading: Container(
          height: 68,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(avatar),
        ),
        title: Text(title, style: AppTextStyle.textbold16),
        subtitle: Text(
          trainerName,
          style: TextStyle(fontSize: 14, color: Color(0xffFF9E80)),
        ),
      ),
    );
  }
}
