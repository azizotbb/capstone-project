// import 'package:flutter/material.dart';
// import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
// import 'package:makfoul_app/style/app_text_style.dart';
// import 'package:makfoul_app/widget/homescreen/cook_cleen_widget.dart';

// class CookScreen extends StatelessWidget {
//   const CookScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Text("Cook", style: AppTextStyle.textTitleLarg24dark),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Flexible(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Column(
//                         children: [
//                           CookCleenWidget(
//                             image: "images/Group 2.png",
//                             height: 290,
//                             category: "Traditional Dishes",
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => TrainerScreen(
//                                     appbarTitle: 'Traditional Dishes',
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(height: 10),
//                           CookCleenWidget(
//                             image: 'images/sweet.png',
//                             height: 95,
//                             category: 'Sweets',
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       TrainerScreen(appbarTitle: 'Sweets'),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(height: 10),
//                           CookCleenWidget(
//                             image: "images/Bakery & Sweets.png",
//                             height: 290,
//                             category: "Bakery",
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       TrainerScreen(appbarTitle: 'Bakery'),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),

//                       Column(
//                         children: [
//                           CookCleenWidget(
//                             image: "images/Beverages.png",
//                             height: 190,
//                             category: "Beverages",
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       TrainerScreen(appbarTitle: 'Beverages'),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(height: 10),

//                           CookCleenWidget(
//                             image: "images/Main Dishes.png",
//                             height: 240,
//                             category: "Main Dishes",
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       TrainerScreen(appbarTitle: 'Main Dishes'),
//                                 ),
//                               );
//                             },
//                           ),
//                           SizedBox(height: 10),
//                           CookCleenWidget(
//                             image: "images/Appetizers.png",
//                             height: 240,
//                             category: "Appetizers",
//                             ontap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       TrainerScreen(appbarTitle: 'Appetizers'),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
