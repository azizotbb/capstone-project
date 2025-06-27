import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/coursemodel.dart';
import 'package:makfoul_app/screen/orders-related/notification_screen.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/course_info.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';
import 'package:makfoul_app/widget/homescreen/main_caregory_widget.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeCourse = courses.where((e) => e.isActive).toList();
    final inactiveCourse = courses.where((e) => !e.isActive).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
          }),
        ],
        title: Text('history'.tr(), style: AppTextStyle.textTitleLarg24dark),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCaregoryWidget(
                    image: null,
                    categoryname: 'All',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'Courses'),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  MainCaregoryWidget(
                    image: "assets/images/Clean (2).png",
                    categoryname: 'Clean',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'Clean Courses'),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  MainCaregoryWidget(
                    image: "assets/images/cook (2).png",
                    categoryname: 'Cook',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TrainerScreen(appbarTitle: 'Cook Courses'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text("active_courses").tr(),
              ),
              //active course
              ListView.builder(
                shrinkWrap: true,
                itemCount: activeCourse.length,
                itemBuilder: (BuildContext context, int index) {
                  print("${activeCourse.length}");
                  return Dismissible(key: Key('activeCourse'),
                  //supabase delete course
                  onDismissed: (direction) {
                    
                  },
                  background: Container(alignment: Alignment.centerRight,child: Icon(Icons.delete_outline_outlined,color: AppColors.colorPrimary,),),
                    child: CustomCourseWidget(
                      coursetitle: activeCourse[index].coursename,
                      pricecourse: activeCourse[index].price,
                      image: 'assets/images/Rectangle 61.png',
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("inactive_courses").tr(),
              ),
              //   active course
              ListView.builder(
                shrinkWrap: true,
                itemCount: inactiveCourse.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCourseWidget(
                    coursetitle: inactiveCourse[index].coursename,
                    pricecourse: inactiveCourse[index].price,
                    image: inactiveCourse[index].image,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// ListView.builder(
//                       itemCount: items.length,
//                       itemBuilder: (context, index) {
//                         final item = items[index];
//                         return Dismissible(
//                           direction: DismissDirection.endToStart,
//                           onDismissed: (direction) {},
//                           background: Container(
//                             width: context.getWidth(size: 0.5),

//                             color: Colors.redAccent,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.delete, color: Colors.white),
//                                 Text(
//                                   'Delete',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           key: Key(item),
//                           child: Center(child: Text(item)),
//                         );
//                       },
//                     ),
