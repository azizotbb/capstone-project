import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// CourseInfo details screen
class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.categoryimage,
    required this.categoryname,
    required this.startDate,
    required this.location,
    required this.description,
    required this.price,
    required this.isActive,
    required this.trainer, required this.endDate,
  });
  final String categoryimage;
  final String categoryname;
  final String startDate;
  final String endDate; 
  final String location;
  final String description;
  final double price;
  final String isActive;
  final String trainer;
  @override
  Widget build(BuildContext context) {
  final startdateday=DateTime.parse(startDate);
  final enddateday=DateTime.parse(endDate);
String formateddateStart= DateFormat('yyyy-MM-dd').format(startdateday);
String formateddateEnd= DateFormat('yyyy-MM-dd').format(enddateday);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Row(
                children: [
                  Image.asset(categoryimage, height: 25),
                  SizedBox(width: 10),
                  Text(
                    categoryname,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              Row(
                children: [
                  Image.asset("assets/images/date.png"),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("$formateddateStart ", style: TextStyle(fontWeight: FontWeight.w500)),
                   Text("$formateddateEnd ", style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),

              Row(
                children: [
                  Image.asset("assets/images/Location.png"),
                  SizedBox(width: 10),
                  Text(location, style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(description,)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  Text("Price", style: TextStyle(fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text("$price"),
                ],
              ),
              Column(
                children: [
                  Text("State", style: TextStyle(fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text(isActive),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Trainer",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(trainer),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
