import 'package:flutter/material.dart';
import 'package:makfoul_app/screen/sup_category_Screen/cleen_screen.dart';
import 'package:makfoul_app/screen/sup_category_Screen/cook_clean_screen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/homescreen/background_color_widget.dart';
import 'package:makfoul_app/widget/homescreen/main_caregory_widget.dart';
import 'package:makfoul_app/widget/homescreen/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundColorWidget(height: 226),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: SearchWidget()),
                          SizedBox(width: 12),
                          Container(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Container(
                    //   width: context.getWidth() * 2,
                    //   child: Image.asset("images/Ad2.png", fit: BoxFit.cover),
                    // ),
                    // SizedBox(height: 100, width: 400, child: AdWidget()),
                    Container(child: Image.asset("assets/images/addcard.png")),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Category",
                  style: AppTextStyle.textTitleLarg24dark,
                ),
              ),
            ),
            SizedBox(height: 16),
            MainCaregoryWidget(
              image: "assets/images/Clean.png",
              categoryname: 'Clean',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CleanScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            MainCaregoryWidget(
              image: "assets/images/Cook.png",
              categoryname: 'Cook',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CookScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
