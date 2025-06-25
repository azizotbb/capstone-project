import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

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
                            width: context.getWidth(size: 0.5),

                            color: Colors.redAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.delete, color: Colors.white),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          key: Key(item),
                          child: Center(child: Text(item)),
                        );
                      },
                    ),
                  ),
                  Tab(child: Text('Cook')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> items = ['1', '2', '3'];
