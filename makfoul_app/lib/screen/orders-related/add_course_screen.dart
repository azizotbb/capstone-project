import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/course/custom_course_widget.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Icon(Icons.add, size: 50, color: Colors.black),
        ),
        appBar: AppBar(
          centerTitle: true,
          actions: [Icon(Icons.notifications_none)],
          title: Text('Add Course', style: AppTextStyle.textTitleLarg24light),
        ),
        body: Column(
          children: [
            TabBar(
              labelStyle: AppTextStyle.textTitleMedium20,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.colorPrimary,
              labelColor: AppColors.colorPrimary,
              tabs: [
                Tab(child: Text('Cook')),
                Tab(child: Text('Clean')),
              ],
            ),
            Container(
              height: 750,
              child: TabBarView(
                children: [
                  Tab(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {},
                          background: Container(
                            width: context.getWidth(),

                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete, color: Colors.redAccent),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          key: Key(item.toString()),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: item,
                          )),
                        );
                      },
                    ),
                  ),
                  Tab(child:ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {},
                          background: Container(
                            width: context.getWidth(),

                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.delete, color: Colors.redAccent),
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          key: Key(item.toString()),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: item,
                          )),
                        );
                      },
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> items = [CustomCourseWidget(coursetitle: 'coursetitle', pricecourse: 121, image: 'assets/images/Rectangle 61.png'),CustomCourseWidget(coursetitle: 'coursetitle', pricecourse: 121, image: 'assets/images/Rectangle 61.png'),CustomCourseWidget(coursetitle: 'coursetitle', pricecourse: 121, image: 'assets/images/Rectangle 61.png')];
