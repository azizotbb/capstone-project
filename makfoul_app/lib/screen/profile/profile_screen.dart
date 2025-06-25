import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/widget/profile/profile_option.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 24),
        //profile info and edit
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 68,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("assets/chef.jpg"),
                    ),
                    Column(
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Aziz"),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined, color: Color(0xffFF6D40)),
                ),
              ],
            ),

            //profile option
            SizedBox(height: 80),
            ProfileOption(icon: Icons.language, onTap: () {}, text: "Language"),
            ProfileOption(
              icon: Icons.loop,
              onTap: () {
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
                      height: 330,
                      child: Column(
                        spacing: 19,
                        children: [
                          CustomTextField(setHint: "Password"),
                          CustomTextField(setHint: "Confirm Password"),
                          CustomTextField(setHint: "New password"),
                          PrimryCustomButton(setText: "save", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                );
              },
              text: "Change password",
            ),
            ProfileOption(
              icon: Icons.error_outline,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        "Are you sure you want to delete the account?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "cancel",
                            style: TextStyle(color: Color(0xff444444)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Accept",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              text: "Delete Account",
            ),
            ProfileOption(
              icon: Icons.headphones_outlined,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SizedBox(
                      height: 137,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.phone_outlined),
                            title: Text(
                              "0500000000",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.email_outlined),
                            title: Text(
                              "Email: Makfoul@gmail.com",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              text: "Customer serves",
            ),
            SizedBox(height: 46),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
