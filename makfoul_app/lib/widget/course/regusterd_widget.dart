import 'package:flutter/material.dart';

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
      children: [
        Text("$numserial"),
        Text(username),
        CircleAvatar(child: Image.asset(image)),
      ],
    );
  }
}
