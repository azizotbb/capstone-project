import 'package:flutter/material.dart';

class CustomCourseWidget extends StatelessWidget {
  CustomCourseWidget({
    super.key,
    required this.coursetitle,
    required this.pricecourse,
    required this.image,
  });
  final String coursetitle;
  final int pricecourse;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(coursetitle),
                      Radio(
                        value: false,
                        groupValue: true,
                        onChanged: (val) {
                          // isActive.value != val;
                        },
                      ),
                      Text("$pricecourse SAR"),
                    ],
                  ),
                  Spacer(),
                  Image.asset(image),
                  SizedBox(width: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
