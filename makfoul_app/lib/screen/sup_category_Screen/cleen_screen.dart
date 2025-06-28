// import 'package:flutter/material.dart';
// import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
// import 'package:makfoul_app/style/app_text_style.dart';
// import 'package:makfoul_app/widget/homescreen/cook_cleen_widget.dart';

// class CleanScreen extends StatelessWidget {
//   const CleanScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Text("Clean", style: AppTextStyle.textTitleLarg24dark),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: Flexible(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         CookCleenWidget(
//                           image: "images/Deep cleaning .png",
//                           height: 290,
//                           category: "Deep cleaning",
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     TrainerScreen(appbarTitle: 'Deep cleaning'),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 10),
//                         CookCleenWidget(
//                           image: 'images/bathroom.png',
//                           height: 95,
//                           category: 'Bathroom Cleaning',
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => TrainerScreen(
//                                   appbarTitle: 'Bathroom Cleaning',
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 10),
//                         CookCleenWidget(
//                           image: "images/Organizing.png",
//                           height: 290,
//                           category: "Organizing",
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     TrainerScreen(appbarTitle: 'Organizing'),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     // const SizedBox(width: 12),
//                     Column(
//                       children: [
//                         CookCleenWidget(
//                           image: "images/Cleaning products.png",
//                           height: 190,
//                           category: "Cleaning products",
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => TrainerScreen(
//                                   appbarTitle: 'Cleaning products',
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: 10),

//                         CookCleenWidget(
//                           image: "images/Laundry.png",
//                           height: 240,
//                           category: "Laundry",
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     TrainerScreen(appbarTitle: 'Laundry'),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         CookCleenWidget(
//                           image: "images/Kitchen cleaning.png",
//                           height: 240,
//                           category: "Kitchen cleaning",
//                           ontap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => TrainerScreen(
//                                   appbarTitle: 'Kitchen cleaning',
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
