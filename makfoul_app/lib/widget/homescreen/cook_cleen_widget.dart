import 'package:flutter/material.dart';

class CookCleenWidget extends StatelessWidget {
  const CookCleenWidget({
    super.key,
    required this.image,
    required this.height,
    required this.category,
    required this.ontap,
  });
  final String image;
  final double height;
  final String category;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,

                  blurRadius: 3,
                  spreadRadius: -12,
                  // offset: Offset(3, 12),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            width: 180,
            height: height,
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 174,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            ),

            child: Align(alignment: Alignment.topCenter, child: Text(category)),
          ),
        ),
      ],
    );
  }
}
