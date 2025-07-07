import 'package:flutter/material.dart';
// RegusterdWidget details screen

class RegusterdWidget extends StatelessWidget {
  const RegusterdWidget({
    super.key,
    required this.numserial,
    required this.username,
    required this.image,
  });
  final int numserial;
  final String username;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$numserial"),
        Text(username),
        CircleAvatar(backgroundImage:  NetworkImage(image.isNotEmpty?image:"assets/imagescircler avtar instructor.png")),
      ],
    );
  }
}
