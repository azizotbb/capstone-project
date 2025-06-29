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

XFile? image;

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activeCourse = courses.where((e) => e.isActive).toList();
    final inactiveCourse = courses.where((e) => !e.isActive).toList();
    return BlocProvider(
      create: (context) => AddCorseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddCorseBloc>();
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  useSafeArea: true,
                  isScrollControlled: true,

                  context: context,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SizedBox(
                      width: context.getWidth(),
                      height: 600,
                      child: Column(
                        spacing: 19,
                        children: [
                          Container(
                            width: 330,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.colorLightGrey,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: bloc.items[0],
                                isExpanded: true,
                            
                                items: bloc.items
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Text(
                                            item,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  bloc.add(
                                    SelectCategoryEvent(value: value!),
                                  );
                                  print(bloc.selectedCategory);
                                },
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: bloc.titleController,
                            setHint: "Course Title".tr(),
                          ),
                          CustomTextField(
                            controller: bloc.descriptionController,
                            setHint: "Description".tr(),
                            isDescription: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 40,
                            children: [
                              CustomTextField(
                                controller: bloc.priceController,
                                setHint: "Price".tr(),
                                isSmall: true,
                              ),
                              CustomTextField(
                                controller: bloc.numberOfTraineesController,
                                setHint: "number of trainees".tr(),
                                isSmall: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 17,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  DateTimeRange<DateTime>?
                                  picked = await showDateRangePicker(
                                    context: context,
                                    firstDate: DateTime(
                                      DateTime.now().year - 5,
                                    ),
                                    lastDate: DateTime(DateTime.now().year + 5),

                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData(
                                          colorScheme: ColorScheme.fromSwatch(
                                            // primarySwatch: Colors.orange,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxWidth: 400.0,
                                                maxHeight: 500,
                                              ),
                                              child: child,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  bloc.date = picked.toString();
                                },
                                child: Container(
                                  height: 56,
                                  width: 59,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorLightGrey,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Icon(
                                    Icons.date_range_outlined,
                                    size: 25,
                                    color: AppColors.colorDarkGrey,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  //here image

                                  print('hello');

                                  bloc.add(UploadImageEvent());

                                  // print(image!.path.toString());
                                },
                                child: Container(
                                  height: 56,
                                  width: 59,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorLightGrey,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Icon(
                                    Icons.image,
                                    size: 25,
                                    color: AppColors.colorDarkGrey,
                                  ),
                                ),
                              ),
                              TextButton(
                                // print the url link for image replace with Google Map
                                onPressed: () {
                                  print(bloc.urlString);
                                },
                                child: Container(
                                  height: 56,
                                  width: 59,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorLightGrey,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Icon(
                                    Icons.place_sharp,
                                    size: 25,
                                    color: AppColors.colorDarkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 350,
                            child: PrimryCustomButton(
                              setText: "Add course".tr(),
                              onPressed: () {
                                bloc.add(AddNewCordeEvent());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              backgroundColor: AppColors.colorScondry,
              child: Icon(Icons.add, color: AppColors.colorpeige),
            ),
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
                        return Dismissible(
                          key: Key('activeCourse'),
                          //supabase delete course
                          onDismissed: (direction) {},
                          background: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.delete_outline_outlined,
                              color: AppColors.colorPrimary,
                            ),
                          ),
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
        },
      ),
    );
  }
}
