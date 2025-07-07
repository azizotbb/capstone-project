import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/course/course_model.dart';
import 'package:makfoul_app/screen/course/course_view.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';

import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/Instructor/instructor_custom_card.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/search_widget.dart';

class TrainerScreen extends StatelessWidget {
  TrainerScreen({super.key, required this.appbarTitle, required this.courses});
  final String appbarTitle;
  final List courses;
  List? searchCourses;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCorseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddCorseBloc>();
          Future.delayed(Duration.zero, () {
            bloc.add(UpdateSearchQuery(searchtext: '', toserch: courses));
          });
          return Scaffold(
            appBar: AppBar(
              title: Text(
                appbarTitle,
                style: AppTextStyle.textTitleLarg24light,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              backgroundColor: AppColors.colorPrimary,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Stack(
                  children: [
                    BackgroundColorWidget(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: SearchBar(
                        leading: Icon(
                          Icons.search,
                          color: AppColors.colorDarkGrey,
                        ),
                        hintText: "Search",
                        hintStyle: MaterialStateProperty.all(
                          AppTextStyle.textReguler16,
                        ),
                        elevation: WidgetStatePropertyAll(1),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          bloc.add(
                            UpdateSearchQuery(
                              searchtext: value,
                              toserch: courses,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  // height: context.getHeight(),
                  child: BlocBuilder<AddCorseBloc, AddCorseState>(
                    builder: (context, state) {
                      List<CourseModel> coursestoshow = [];

                      if (state is updateserch) {
                        coursestoshow = List<CourseModel>.from(state.toserch);
                      }
                      return ListView.builder(
                        itemCount: coursestoshow.length,
                        // physics: CarouselScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InstructorCustomCard(
                              //supabase here to get coures title
                              title: coursestoshow[index].title,
                              //supabase here to get Trainer Name
                              trainerName: coursestoshow[index].price
                                  .toString(),
                              //supabase here to get Trainer avatar
                              avatar: coursestoshow[index].image,
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseView(
                                      courseId: coursestoshow[index].id,
                                      title: coursestoshow[index].title,
                                      img: coursestoshow[index].image,
                                      description:
                                          coursestoshow[index].description,
                                      location: coursestoshow[index].location,
                                      price: coursestoshow[index].price,
                                      tid: coursestoshow[index].tid,
                                      category: coursestoshow[index].category,
                                      numberOfTrainees:
                                          coursestoshow[index].numberOfTrainees,
                                      state: coursestoshow[index].state,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
