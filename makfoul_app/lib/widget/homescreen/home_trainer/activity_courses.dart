import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/widget/homescreen/dashboardcard.dart';

class ActivityCourses extends StatelessWidget {
  const ActivityCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCorseBloc, AddCorseState>(
      builder: (context, state) {
        final bloc = context.read<AddCorseBloc>();
        bloc.add(GetCoursesEvent());

        if (state is CoursesLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dashboardcard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "All courses",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.colorDarkGrey,
                      ),
                    ),
                    Text(
                      "${state.total}",

                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.colorScondry,
                      ),
                    ),
                  ],
                ),
              ),
              Dashboardcard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "active",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.colorDarkGrey,
                          ),
                        ),
                        Text(
                          "${state.active}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.colorScondry,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "inActive",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.colorDarkGrey,
                          ),
                        ),
                        Text(
                          "${state.inactive}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColors.colorScondry,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Text("no data or error");
      },
    );
  }
}
