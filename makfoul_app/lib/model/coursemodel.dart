import 'package:flutter/material.dart';

class CourseModel {
  final String coursename;
  final String addres;
  final double price;
  final String image;
  final Function ontap;
  final bool isActive;

  CourseModel({
    required this.coursename,
    required this.addres,
    required this.price,
    required this.image,
    required this.ontap,
    required this.isActive,
  });
}

List<CourseModel> courses = [
  CourseModel(
    coursename: 'Raghad',
    addres: 'Alrass',
    price: 200,
    image: 'assets/images/Rectangle 61.png',
    ontap: () {},
    isActive: true,
  ),
  CourseModel(
    coursename: 'Waad',
    addres: 'Alrass',
    price: 200,
    image: 'assets/images/Rectangle 61.png',
    ontap: () {},
    isActive: true,
  ),
  CourseModel(
    coursename: 'Amal',
    addres: 'Alrass',
    price: 200,
    image: 'assets/images/Rectangle 61.png',
    ontap: () {},
    isActive: false,
  ),
  CourseModel(
    coursename: 'Amal',
    addres: 'Alrass',
    price: 200,
    image: 'assets/images/Rectangle 61.png',
    ontap: () {},
    isActive: false,
  ),
];
