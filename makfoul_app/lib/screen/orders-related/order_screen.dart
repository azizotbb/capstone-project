import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/course/user_details_course.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the list of user orders by UID from the operations layer (injected via GetIt)
    final ordersByUID = GetIt.I.get<OpreationsLayer>().ordersByUID;

    return Scaffold(
      appBar: AppBar(title: Text("order").tr(), centerTitle: true),
      // If there are no orders, show a message. Otherwise, display the list of courses.
      body: ordersByUID.isEmpty
          ? Center(child: Text("No orders found".tr()))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: ordersByUID.length,
                itemBuilder: (BuildContext context, int index) {
                  GetIt.I.get<OpreationsLayer>().getCoursesMethod();
                  return CustomCourseWidget(
                    coursetitle: ordersByUID[index].courseId.title,
                    pricecourse: ordersByUID[index].courseId.price,
                    image: ordersByUID[index].courseId.image,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsCourse(
                            desc: ordersByUID[index].courseId.description,
                            categoryname: ordersByUID[index].courseId.category,
                            startDate: ordersByUID[index].courseId.startDate,
                            endDate: ordersByUID[index].courseId.endDate,
                            state: ordersByUID[index].courseId.state,
                            price: ordersByUID[index].courseId.price,
                            coursetitle: ordersByUID[index].courseId.title,
                            canreguster:
                                ordersByUID[index].courseId.numberOfTrainees,
                            tranername: ordersByUID[index].courseId.user!.name,
                            tranerPhone:
                                ordersByUID[index].courseId.user!.phone,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
