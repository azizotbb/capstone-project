import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authGetit = GetIt.I.get<AuthLayer>();

    final opreationsGet = GetIt.I.get<OpreationsLayer>().getordersByUID(
      uid: authGetit.userinfo.uid,
    );

    return Scaffold(
      appBar: AppBar(title: Text("order").tr(), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return CustomCourseWidget(
              coursetitle: 'italy cook ',
              pricecourse: 200,
              image: 'assets/images/Rectangle 61.png',
            );
          },
        ),
      ),
    );
  }
}
