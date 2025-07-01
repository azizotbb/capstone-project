import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/coursemodel.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/screen/orders-related/notification_screen.dart';
import 'package:makfoul_app/screen/trainer/trainer_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';
import 'package:makfoul_app/widget/homescreen/main_caregory_widget.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (_) => AddCorseBloc()
        ..add(
          GetCoursesEvent(id: Supabase.instance.client.auth.currentUser!.id),
        ),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddCorseBloc>();
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      );
                    },
                  ),
                ],
                title: Text(
                  'history'.tr(),
                  style: AppTextStyle.textTitleLarg24dark,
                ),
                bottom: TabBar(
                  indicatorColor: AppColors.colorPrimary,
                  labelColor: AppColors.colorDarkGrey,
                  tabs: [
                    Tab(icon: Icon(Icons.access_time)),
                    Tab(icon: Icon(Icons.do_disturb)),
                  ],
                ),
              ),

              body: BlocBuilder<AddCorseBloc, AddCorseState>(
  builder: (context, state) {
    print(state);
    if (state is CoursesLoaded ) {
      final courses = state.trainearcourses ?? [];
      final activeCourse = courses.where((e) => e.state == "Active").toList();
      final inactiveCourse = courses.where((e) => e.state == "InActive").toList();

      return TabBarView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: activeCourse.length,
            itemBuilder: (BuildContext context, int index) {
              final e = activeCourse[index];
              return Dismissible(
                key: Key(e.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  context.read<AddCorseBloc>().add(DeleteCourseEvent(courseId: e.id));
                  Future.delayed(Duration(milliseconds: 300),(){bloc.add(GetCoursesEvent());});
                },
                background: Container(
                  color: Colors.red.withOpacity(0.1),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                ),
                child: CustomCourseWidget(
                  coursetitle: e.title,
                  pricecourse: e.price,
                  image: e.image,
                ),
              );
            },
          ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: inactiveCourse.length,
            itemBuilder: (BuildContext context, int index) {
              final e = inactiveCourse[index];
              return CustomCourseWidget(
                coursetitle: e.title,
                pricecourse: e.price,
                image: e.image,
              );
            },
          ),
        ],
      );
    }

    return const Center(child: CircularProgressIndicator());
  },
              
            
          )));
        },
      ),
    );
  }
}

// body: BlocBuilder<AddCorseBloc, AddCorseState>(
              //   builder: (context, state) {
              //     print(state);
              //     if (state is CoursesLoaded) {
              //       final courses=state.trainearcourses??[];
              //       final activeCourse =courses.where((e) => e.state=="Active").toList();
              //      final inactiveCourse = courses.where((e) => e.state=="InActive").toList();
              //       return TabBarView(
              //         children: [
              //           ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: activeCourse.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               final e = activeCourse[index];
              //               print("${activeCourse.length}");
              //               return Dismissible(
              //                 key: Key('activeCourse'),
              //                 //supabase delete course
              //                 onDismissed: (direction) {
              //                   final coursesid= e.id;
              //                   bloc.add(DeleteCourseEvent(courseId: coursesid));
              //                 },
              //                 background: Container(
              //                   alignment: Alignment.centerRight,
              //                   child: Icon(
              //                     Icons.delete_outline_outlined,
              //                     color: AppColors.colorPrimary,
              //                   ),
              //                 ),
              //                 child: CustomCourseWidget(
              //                   coursetitle: e.title,
              //                   pricecourse:e.price,
              //                   image: e.image,
              //                 ),
              //               );
              //             },
              //           ),

              //           ////
              //           //
              //           ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: inactiveCourse.length,
              //             itemBuilder: (BuildContext context, int index) {
              //                   final e1 = inactiveCourse[index];
              //               return CustomCourseWidget(
              //                 coursetitle: e1.title,
              //                 pricecourse: e1.price,
              //                 image: e1.image,
              //               );
              //             },
              //           ),
              //         ],
              //       );
              //     }
              //     return Text("jkkklkk");
              //   },
              // ),

              // body: SingleChildScrollView(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 24),
              //     child: Column(
              //       children: [
              //         SizedBox(height: 30),
              //         Align(
              //           alignment: Alignment.topLeft,
              //           child: Text("active_courses").tr(),
              //         ),
              //         //active course
              //         ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: activeCourse.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             print("${activeCourse.length}");
              //             return Dismissible(
              //               key: Key('activeCourse'),
              //               //supabase delete course
              //               onDismissed: (direction) {},
              //               background: Container(
              //                 alignment: Alignment.centerRight,
              //                 child: Icon(
              //                   Icons.delete_outline_outlined,
              //                   color: AppColors.colorPrimary,
              //                 ),
              //               ),
              //               child: CustomCourseWidget(
              //                 coursetitle: activeCourse[index].coursename,
              //                 pricecourse: activeCourse[index].price,
              //                 image: 'assets/images/Rectangle 61.png',
              //               ),
              //             );
              //           },
              //         ),
              //         Align(
              //           alignment: Alignment.topLeft,
              //           child: Text("inactive_courses").tr(),
              //         ),
              //         //   active course
              //         ListView.builder(
              //           shrinkWrap: true,
              //           itemCount: inactiveCourse.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             return CustomCourseWidget(
              //               coursetitle: inactiveCourse[index].coursename,
              //               pricecourse: inactiveCourse[index].price,
              //               image: inactiveCourse[index].image,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),