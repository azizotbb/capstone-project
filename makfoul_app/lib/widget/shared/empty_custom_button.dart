import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';

class EmptyCustomButton extends StatelessWidget {
  const EmptyCustomButton({super.key, required this.setText});

  final String setText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        border: Border.all(color: Color(0xffFF9E80), width: 1),
      ),
      width: context.getWidth(size: 0.469),
      height: context.getHeight(size: 0.055),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          overlayColor: Colors.grey,
        ),
        onPressed: () {},
        child: Text(
          setText,
          style: TextStyle(
            color: Color(0xffFF9E80),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
