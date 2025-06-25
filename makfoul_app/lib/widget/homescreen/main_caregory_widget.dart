import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';

class MainCaregoryWidget extends StatelessWidget {
  const MainCaregoryWidget({
    super.key,
    required this.image,
    required this.categoryname, required this.ontap, 
  });
  final String image;
  final String categoryname;
  final VoidCallback ontap; 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            // height: context.gethight() * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.grey,
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
            ),
            width: context.getWidth() * 0.90,
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
        Positioned(
          right: 60,
          top: 30,
          child: Text(categoryname, style: TextStyle(fontSize: 30)),
        ),
      ],
    );
  }
}
