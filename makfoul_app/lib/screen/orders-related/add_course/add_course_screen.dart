import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/model/user/user_model.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/course/details_course.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/screen/orders-related/notification_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userinfo = GetIt.I.get<AuthLayer>().userinfo;

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
                  if (state is CoursesLoaded) {
                    final courses = state.trainearcourses ?? [];
                    final activeCourse = courses
                        .where((e) => e.state == "Active")
                        .toList();
                    final inactiveCourse = courses
                        .where((e) => e.state == "InActive")
                        .toList();

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

                              confirmDismiss: (direction) async {
                                context.read<AddCorseBloc>().add(
                                  DeleteCourseEvent(courseId: e.id),
                                );
                                await Future.delayed(
                                  Duration(milliseconds: 300),
                                  () {},
                                );
                                return true;
                              },
                              background: Container(
                                color: Colors.red.withOpacity(0.1),
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              child: CustomCourseWidget(
                                coursetitle: e.title,
                                pricecourse: e.price,
                                image: e.image,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsCourse(
                                        coursetitle: e.title,
                                        canreguster: e.numberOfTrainees,
                                        categoryname: e.category,
                                        startDate: e.startDate,
                                        endDate: e.endDate,
                                        state: e.state,
                                        price: e.price,
                                        desc: e.description,
                                        tranername: userinfo.name,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: inactiveCourse.length,
                          itemBuilder: (BuildContext context, int index) {
                            final e1 = inactiveCourse[index];
                            return Dismissible(
                              key: Key(e1.id.toString()),
                              direction: DismissDirection.endToStart,

                              confirmDismiss: (direction) async {
                                context.read<AddCorseBloc>().add(
                                  DeleteCourseEvent(courseId: e1.id),
                                );
                                await Future.delayed(
                                  Duration(milliseconds: 300),
                                  () {},
                                );
                                return true;
                              },
                              background: Container(
                                color: Colors.red.withOpacity(0.1),
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: const Icon(
                                  Icons.delete_outline_outlined,
                                  color: Colors.red,
                                ),
                              ),
                              child: CustomCourseWidget(
                                coursetitle: e1.title,
                                pricecourse: e1.price,
                                image: e1.image,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsCourse(
                                        coursetitle: e1.title,
                                        canreguster: e1.numberOfTrainees,
                                        categoryname: e1.category,
                                        startDate: e1.startDate,
                                        endDate: e1.endDate,
                                        state: e1.state,
                                        price: e1.price,
                                        desc: e1.tid,
                                        tranername: userinfo.name,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
