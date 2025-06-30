import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/model/coursemodel.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/TopCourses_widget.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/dashboardcard.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class HomescreenTrainerScreen extends StatelessWidget {
  const HomescreenTrainerScreen({super.key});
  final int totalcourse = 10;
  final int numofactivecourse = 5;
  final int numofainctivecourse = 5;
  final int cleancourse = 3;
  final int cookcourse = 7;
  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;

    return BlocProvider(
      create: (context) => AddCorseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AddCorseBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            //header
            body: Column(
              children: [
                Stack(
                  children: [
                    BackgroundColorWidget(height: 160),
                    Padding(
                      padding: EdgeInsets.all(9),
                      child: SafeArea(
                        child: Container(width: context.getWidth(),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: Image.asset(
                                "assets/images/circler avtar instructor.png",
                              ),
                            ),
                            title: Text(
                              "Hi,".tr() + userinfo.username,
                              style: AppTextStyle.textTitleLarg24dark,
                            ),
                            subtitle: Text(
                              "your dashboard for managing training courses \nand empowering domestic workers ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.colorDarkGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView(
                      children: [
                        //Dashboard
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Dashboard ",
                            style: AppTextStyle.textTitleLarg24dark,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Dashboardcard(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    "${totalcourse}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                        "${numofactivecourse}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: AppColors.colorScondry,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "inactive",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: AppColors.colorDarkGrey,
                                        ),
                                      ),
                                      Text(
                                        "${numofainctivecourse}",
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
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Dashboardcard(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "courses",
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
                                        "${cleancourse}",
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
                                        "${cookcourse}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Dashboardcard(
                              hasborder: true,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    showDragHandle: true,
                                    useSafeArea: true,
                                    isScrollControlled: true,

                                    context: context,
                                    builder: (context) => Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom,
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
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  value: bloc.items[0],
                                                  isExpanded: true,

                                                  items: bloc.items
                                                      .map(
                                                        (
                                                          item,
                                                        ) => DropdownMenuItem(
                                                          value: item,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      20,
                                                                ),
                                                            child: Text(
                                                              item,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (value) {
                                                    bloc.add(
                                                      SelectCategoryEvent(
                                                        value: value!,
                                                      ),
                                                    );
                                                    print(
                                                      bloc.selectedCategory,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            CustomTextField(
                                              controller: bloc.titleController,
                                              setHint: "Course Title".tr(),
                                            ),
                                            CustomTextField(
                                              controller:
                                                  bloc.descriptionController,
                                              setHint: "Description".tr(),
                                              isDescription: true,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 40,
                                              children: [
                                                CustomTextField(
                                                  controller:
                                                      bloc.priceController,
                                                  setHint: "Price".tr(),
                                                  isSmall: true,
                                                ),
                                                CustomTextField(
                                                  controller: bloc
                                                      .numberOfTraineesController,
                                                  setHint: "number of trainees"
                                                      .tr(),
                                                  isSmall: true,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 17,
                                              children: [
                                                TextButton(
                                                  onPressed: () async {
                                               
                                                   bloc.pickedDate  = await showDateRangePicker(
                                                      context: context,
                                                      firstDate: DateTime(
                                                        DateTime.now().year - 5,
                                                      ),
                                                      lastDate: DateTime(
                                                        DateTime.now().year + 5,
                                                      ),

                                                      builder: (context, child) {
                                                        return Theme(
                                                          data: ThemeData(
                                                            colorScheme:
                                                                ColorScheme.fromSwatch(
                                                                  // primarySwatch: Colors.orange,
                                                                ),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ConstrainedBox(
                                                                constraints:
                                                                    BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                      maxHeight:
                                                                          500,
                                                                    ),
                                                                child: child,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    // bloc.date = picked
                                                        // .toString();
                                                  },
                                                  child: Container(
                                                    height: 56,
                                                    width: 59,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .colorLightGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            17,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.date_range_outlined,
                                                      size: 25,
                                                      color: AppColors
                                                          .colorDarkGrey,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    //here image

                                                    print('hello');

                                                    bloc.add(
                                                      UploadImageEvent(),
                                                    );

                                                    // print(image!.path.toString());
                                                  },
                                                  child: Container(
                                                    height: 56,
                                                    width: 59,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .colorLightGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            17,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.image,
                                                      size: 25,
                                                      color: AppColors
                                                          .colorDarkGrey,
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
                                                      color: AppColors
                                                          .colorLightGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            17,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.place_sharp,
                                                      size: 25,
                                                      color: AppColors
                                                          .colorDarkGrey,
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Add Course",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: AppColors.colorDarkGrey,
                                      ),
                                    ),
                                    Image.asset("assets/images/AddCourse.png"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Courses
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Courses ",
                            style: AppTextStyle.textTitleLarg24dark,
                          ),
                        ),
                        SizedBox(height: 12),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: courses.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 3,
                                childAspectRatio: 0.8,
                              ),
                          itemBuilder: (context, index) {
                            final e = courses[index];
                            return TopCourses(
                              image: e.image,
                              coursename: e.coursename,
                              location: e.addres,
                              price: e.price,
                            );
                          },
                        ),
                      ],
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
