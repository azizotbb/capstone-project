import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.categoryimage,
    required this.categoryname,
    required this.date,
    required this.location,
    required this.description,
    required this.price,
    required this.isActive,
    required this.trainer,
  });
  final String categoryimage;
  final String categoryname;
  final String date;
  final String location;
  final String description;
  final double price;
  final bool isActive;
  final String trainer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(children: [Image.asset(categoryimage), Text(categoryname)]),

            Row(
              children: [Image.asset("assets/images/date.png"), Text("$date")],
            ),

            Row(
              children: [
                Image.asset("assets/images/Location.png"),
                Text(location),
              ],
            ),
          ],
        ),
        Text("Description"),
        Text(description),
        Row(
          children: [
            Column(children: [Text("Price "), Text("$price")]),
            Column(
              children: [Text("State"), Text(isActive ? "Active" : "inactive")],
            ),
            Column(children: [Text("Trainer"), Text(trainer)]),
          ],
        ),
      ],
    );
  }
}
