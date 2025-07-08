import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
// RegusterdWidget details screen

class RegusterdWidget extends StatelessWidget {
  const RegusterdWidget({
    super.key,
    required this.numserial,
    required this.username,
    required this.image,
    required this.phoneNumber
  });
  final int numserial;
  final String username;
  final String image;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$numserial"),
        SizedBox(width: context.getWidth(size: 0.75),child: ListTile(title: Text(username),subtitle: Text(phoneNumber),)),
        CircleAvatar(backgroundImage:  NetworkImage(image.isNotEmpty?image:"assets/imagescircler avtar instructor.png")),
      ],
    );
  }
}
