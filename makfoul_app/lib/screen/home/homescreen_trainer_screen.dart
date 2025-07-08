import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/user/user_model.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/TopCourses_widget.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/dashboardcard.dart';
import 'package:makfoul_app/widget/homescreen/home_trainer/activity_courses.dart';
import 'package:makfoul_app/widget/homescreen/home_trainer/add_modal_sheet.dart';

class HomescreenTrainerScreen extends StatelessWidget {
  const HomescreenTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userinfo = GetIt.I.get<AuthLayer>().userinfo;
    return BlocProvider(
      create: (context) =>
          AddCorseBloc()..add(GetCoursesEvent(id: userinfo.UID)),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddCorseBloc>();
          // WidgetsBinding.instance.addPostFrameCallback((_){
          //   context.read<AddCorseBloc>().add(GetCoursesEvent());
          // });
          return Scaffold(
            resizeToAvoidBottomInset: false,
            //header
            body: Column(
              children: [
                Stack(
                  children: [
                    BackgroundColorWidget(height: 170),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: SafeArea(
                        child: SizedBox(
                          width: context.getWidth(),
                          child: Row(
                            spacing: 16,
                            children: [
                              Container(
                                height: 68,
                                width: 68,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: userinfo.avatar == null
                                    ? Image.asset(
                                        "assets/images/circler avtar instructor.png",
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        userinfo.avatar!,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              Column(
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi,".tr() + userinfo.name,
                                    style: AppTextStyle.textTitleLarg24dark,
                                  ),
                                  Text(
                                    "dashboradText".tr(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: AppColors.colorDarkGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                //body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "dashboard".tr(),
                              style: AppTextStyle.textTitleLarg24dark,
                            ),
                          ),
                          SizedBox(height: 12),

                          BlocProvider.value(
                            value: bloc,
                            child: ActivityCourses(),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlocBuilder<AddCorseBloc, AddCorseState>(
                                builder: (context, state) {
                                  GetIt.I.get<OpreationsLayer>().getCoursesMethod();
                                  if (state is CoursesLoaded) {
                                    return Dashboardcard(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "courses".tr(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              color: AppColors.colorDarkGrey,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                "assets/images/Clean (2).png",
                                                height: 20,
                                                width: 20,
                                              ),
                                              Text(
                                                "${state.clean}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                "assets/images/cook (2).png",
                                                height: 20,
                                                width: 20,
                                              ),
                                              Text(
                                                "${state.cook}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return SizedBox();
                                },
                              ),
                              BlocProvider.value(
                                value: bloc,
                                child: AddModalSheet(),
                              ),
                            ],
                          ),

                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Courses ",
                              style: AppTextStyle.textTitleLarg24dark,
                            ),
                          ),
                          SizedBox(height: 12),
                          BlocBuilder<AddCorseBloc, AddCorseState>(
                            bloc: bloc,
                            builder: (context, state) {
                              bloc.add(GetCoursesEvent());
                              if (state is CoursesLoaded) {
                                return GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.trainearcourses!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.7,
                                      ),
                                  itemBuilder: (context, index) {
                                    final e = state.trainearcourses![index];
                                    return TopCourses(
                                      image: e.image,
                                      coursename: e.title,
                                      location: e.location,
                                      price: e.price,
                                    );
                                  },
                                );
                              }
                              return SizedBox();
                            },
                          ),
                        ],
                      ),
                    ),
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
