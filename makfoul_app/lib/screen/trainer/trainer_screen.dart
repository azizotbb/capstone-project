import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/course/course_view.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/Instructor/instructor_custom_card.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/search_widget.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key, required this.appbarTitle});
  final String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle, style: AppTextStyle.textTitleLarg24light),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundColorWidget(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SearchWidget(),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: context.getHeight(),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InstructorCustomCard(
                      //supabase here to get coures title
                      title: "Course title",
                      //supabase here to get Trainer Name
                      trainerName: "Trainer Name",
                      //supabase here to get Trainer avatar
                      avatar: "assets/images/circler avtar instructor.png",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CourseView()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
