import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/home/picked_location.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/homescreen/dashboardcard.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/custom_icon_button.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class AddModalSheet extends StatelessWidget {
  const AddModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final bloc = context.read<AddCorseBloc>();
        return Dashboardcard(
          hasborder: true,
          child: GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                showDragHandle: true,
                useSafeArea: true,
                isScrollControlled: true,

                context: context,
                builder: (context) => Form(
                  key: bloc.formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SizedBox(
                      width: context.getWidth(),
                      height: 600,
                      child: Column(
                        spacing: 19,
                        children: [
                          BlocBuilder<AddCorseBloc, AddCorseState>(
                            bloc: bloc,
                            builder: (context, state) {
                              return Container(
                                width: 330,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.colorLightGrey,
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text(
                                      "   select category",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.colorMedimGrey,
                                      ),
                                    ),
                                    value: bloc.selectedCategory,
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
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          CustomTextField(
                            validator: (p0) {
                              return Validators.validateCourseTitle(p0);
                            },
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
                              CustomTextField(inputFormatters: [FilteringTextInputFormatter.digitsOnly],keyboardType: TextInputType.number,
                                validator: (p0) {
                                  return Validators.validatePrice(p0);
                                },
                                controller: bloc.priceController,
                                setHint: "Price".tr(),
                                isSmall: true,
                              ),
                              CustomTextField(inputFormatters: [FilteringTextInputFormatter.digitsOnly],keyboardType: TextInputType.number,
                                validator: (p0) {
                                  return Validators.validateTraineesNumber(p0);
                                },
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
                              CustomIconButton(
                                onPressed: () async {
                                  bloc.pickedDate = await showDateRangePicker(
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
                                  // bloc.date = picked
                                  // .toString();
                                },
                                iconButton: Icon(Icons.date_range_outlined),
                              ),

                              CustomIconButton(
                                onPressed: () async {
                                  //here image

                                  print('hello');

                                  bloc.add(UploadImageEvent());

                                  // print(image!.path.toString());
                                },
                                iconButton: Icon(Icons.image),
                              ),

                              CustomIconButton(
                                onPressed: () async {
                                  // Open the map screen to pick a location
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: bloc
                                          ..add(
                                            DynamicLocationEvent(), // Load user's current GPS location
                                          ),
                                        child: PickedLocation(),
                                      ),
                                    ),
                                  );
                                  // If user selected a location, save it to the bloc
                                  if (result != null && result is LatLng) {
                                    print('User picked location: $result');
                                    bloc.add(SavePickedLocationEvent(result));
                                  }
                                },
                                iconButton: Icon(Icons.place_sharp),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 350,
                            child: PrimryCustomButton(
                              setText: "Add course".tr(),
                              onPressed: () {
                                if (bloc.formKey.currentState!.validate()) {
                                  bloc.add(AddNewCordeEvent());
                                  GetIt.I
                                      .get<OpreationsLayer>()
                                      .getCoursesMethod();
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ); //
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        );
      },
    );
  }
}
