import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/screen/profile/bloc/profile_bloc.dart';
import 'package:makfoul_app/screen/splash/splash_screen.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/profile/profile_option.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProfileBloc>();
          return Scaffold(
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 10,
                vertical: 24,
              ),
              //profile info and edit
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  bloc.add(UpdateImageEvent());
                                  print('Clicked');
                                },
                                child: Container(
                                  height: 68,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: bloc.urlString == null
                                      ? Image.asset(
                                          "assets/images/circler avtar instructor.png",
                                        )
                                      : Image.network(bloc.urlString!),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 12),
                          Column(
                            children: [
                              Text(
                                "hello".tr(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              //supabase here to get current Username
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  return Text(userinfo.username);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          //edit here
                          showDialog(
                            context: context,
                            builder: (context) {
                              //translation needed
                              return Dialog(
                                child: Container(
                                  width: context.getWidth(size: 0.85),
                                  height: context.getHeight(size: 0.3),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Enter Your New Name',
                                            style:
                                                AppTextStyle.textTitleMedium20,
                                          ),
                                          CustomTextField(
                                            setHint: 'New Name',
                                            controller: bloc.nameController,
                                          ),
                                          PrimryCustomButton(
                                            setText: "save".tr(),
                                            onPressed: () {
                                              bloc.add(UpdateNameEvent());
                                              print('Done');
                                              userinfo.username =
                                                  bloc.nameController.text;
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Color(0xffFF6D40),
                        ),
                      ),
                    ],
                  ),

                  //profile option
                  SizedBox(height: 80),
                  ProfileOption(
                    icon: Icons.language,
                    onTap: () {
                      if (context.locale.languageCode == "ar") {
                        context.setLocale(Locale('en', 'US'));
                      } else {
                        context.setLocale(Locale('ar', 'AR'));
                      }
                    },
                    text: "lang".tr(),
                  ),
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
                            height: 400,
                            child: Form(
                              key: bloc.formKey,
                              child: Column(
                                spacing: 19,
                                children: [
                                  CustomTextField(
                                    controller: bloc.passwordController,
                                    setHint: "password".tr(),
                                    validator: (value) {
                                      return Validators.password(value);
                                    },
                                  ),
                                  CustomTextField(
                                    controller: bloc.newPasswordController,
                                    setHint: "new_password".tr(),
                                    validator: (value) {
                                      return Validators.password(value);
                                    },
                                  ),
                                  CustomTextField(
                                    setHint: "confirm_password".tr(),
                                    validator: (value) {
                                      return Validators.confirmPassword(
                                        value,
                                        bloc.newPasswordController.text,
                                      );
                                    },
                                  ),

                                  SizedBox(height: 16),
                                  PrimryCustomButton(
                                    setText: "save".tr(),
                                    onPressed: () {
                                      if (bloc.formKey.currentState!
                                          .validate()) {
                                        bloc.add(UpdatePasswordEvent());
                                        print('Done');
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    text: "change_password".tr(),
                  ),
                  ProfileOption(
                    icon: Icons.error_outline,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("delete_confirmation".tr()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "cancel".tr(),
                                  style: TextStyle(color: Color(0xff444444)),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "accept".tr(),
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: "delete_account".tr(),
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
                                    "Makfoul@gmail.com",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    text: "customer_service".tr(),
                  ),
                  SizedBox(height: 46),
                  ListTile(
                    onTap: () async {
                      final supabase = Supabase.instance.client;

                      await supabase.auth.signOut();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen()),
                      );
                    },
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      "logout".tr(),
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
        },
      ),
    );
  }
}
