
import 'package:flutter/material.dart';


class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final image = ['1', '2', '3', '4'];
  final index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // برجع اكمل عليها
        // child: CarouselSlider(
        //   items: image.map((path) {
        //     return Builder(
        //       builder: (context) {
        //         return ClipRRect(
        //           borderRadius: BorderRadius.circular(17),
        //           child: Image.asset(path, fit: BoxFit.cover),
        //         );
        //       }
        //     );
        //   }).toList(),
        //   options: CarouselOptions(
        //     height: 350,
        //     autoPlay: true,
        //     autoPlayCurve: Curves.bounceIn,
        //     autoPlayAnimationDuration: Duration(microseconds: 600),
        //     viewportFraction: 2,
        //     onPageChanged: (index, reason) {
              
        //     },
        //   ),
        // ),
      ),
    );
  }
}

// 
// 
// 
// 
// Scaffold(
//       backgroundColor: Colors.white,
//       body: ListWheelScrollView.useDelegate(
//         itemExtent: MediaQuery.of(context).size.height * 0.8,
//         diameterRatio: 2.5,
//         perspective: 0.002,
//         physics: FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           childCount: titles.length,
//           builder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(images[index], height: 250),
//                   SizedBox(height: 32),
//                   Text(
//                     titles[index],
//                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     descriptions[index],
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 32),
//                   if (index == titles.length - 1)
//                     ElevatedButton(
//                       onPressed: () {
//                         // Navigate to next screen
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 40,
//                           vertical: 14,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       child: Text("Get Started"),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );  
//
//
//
//
//
//// final List<String> titles = [
  //   'Welcome to Jojo App',
  //   'Discover New Features',
  //   'Start Your Journey',
  // ];

  // final List<String> descriptions = [
  //   'We help you bake smarter and faster!',
  //   'Explore courses, recipes and more!',
  //   'Let’s get started together 🎉',
  // ];

  // final List<String> images = [
  //   'assets/onboard1.png',
  //   'assets/onboard2.png',
  //   'assets/onboard3.png',
  // ];


  // final pages = [ _buildPage(
  //     color: Colors.purple,
  //     title: 'Welcome!',
  //     desc: 'Discover your new experience',
  //     image: 'assets/on1.png',
  //   ),
  //   _buildPage(
  //     color: Colors.blue,
  //     title: 'Easy Shopping',
  //     desc: 'Shop from anywhere',
  //     image: 'assets/on2.png',
  //   ),
  //   _buildPage(
  //     color: Colors.deepOrange,
  //     title: 'Fast Delivery',
  //     desc: 'To your doorstep',
  //     image: 'assets/on3.png',
  //   ),
  // ];
//  return Scaffold(
//       body: LiquidSwipe(
//         pages: pages,
//         fullTransitionValue: 300,
//         enableLoop: false, 
//         waveType: WaveType.liquidReveal, 
//         slideIconWidget: Icon(Icons.arrow_back_ios_new, color: Colors.white),
//         positionSlideIcon: 0.5,
//       ),
//     );
//   }

//   static Widget _buildPage({
//     required Color color,
//     required String title,
//     required String desc,
//     required String image,
//   }) {
//     return Container(
//       color: color,
//       padding: const EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image, height: 250),
//           SizedBox(height: 40),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 34,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             desc,
//             style: TextStyle(fontSize: 18, color: Colors.white70),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );