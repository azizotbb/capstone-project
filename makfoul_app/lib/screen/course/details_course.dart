import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/course_info.dart';
import 'package:makfoul_app/widget/course/regusterd_widget.dart';

class DetailsCourse extends StatelessWidget {
  const DetailsCourse({
    super.key,

    required this.coursetitle,
      this.categoryimage,
     this.regusterednum,
    required this.canreguster, required this.categoryname, required this.startDate, required this.endDate, this.location, required this.state, required this.price, required this.desc, required this.tranername, 
  });
final String desc; 
final String categoryname; 
final String startDate; 
final String endDate; 
final String? location; 
final String state; 
final double price;  
  final String coursetitle;
  final String? categoryimage;
  final int? regusterednum;
  final int canreguster;
  final String tranername; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: AppColors.colorDarkGrey,
                    ),
                    SizedBox(width: 90),
                    Text("Details", style: AppTextStyle.textTitleLarg24dark),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  coursetitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.colorDarkGrey,
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Course information",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.colorDarkGrey,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                CourseInfo(
                  categoryimage: categoryname=="Cleen"?"assets/images/Clean (2).png":"assets/images/cook (2).png",
                  categoryname: categoryname,
                  startDate: startDate,
                  endDate: endDate,
                  location: 'Alrass',
                  description:desc,
                  price: price,
                  isActive: state,
                  trainer: tranername,
                ),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        "Registered in the Course",
                        style: AppTextStyle.textbold16,
                      ),
                      Spacer(),
                      Text("$regusterednum" + "/" + "$canreguster"),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                SizedBox(
                  height: context.getHeight() * 0.7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: RegusterdWidget(
                          numserial: index + 1,
                          username: 'Raghad',
                          image: 'assets/images/circler avtar instructor.png',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
