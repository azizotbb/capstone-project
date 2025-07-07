import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/profile/bloc/profile_bloc.dart';
import 'package:makfoul_app/widget/profile/change_image.dart';
import 'package:makfoul_app/widget/profile/change_name.dart';
import 'package:makfoul_app/widget/profile/change_password.dart';
import 'package:makfoul_app/widget/profile/customer_service.dart';
import 'package:makfoul_app/widget/profile/delete_account.dart';
import 'package:makfoul_app/widget/profile/logout.dart';
import 'package:makfoul_app/widget/profile/profile_option.dart';

//327

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
                              return BlocProvider.value(
                                value: bloc,
                                child: ChangeImage(),
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
                                  return Text(userinfo.name);
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
                              return BlocProvider.value(
                                value: bloc,
                                child: ChangeName(),
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
                        builder: (context) => BlocProvider.value(
                          value: bloc,
                          child: ChangePassword(),
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
                          return BlocProvider.value(
                            value: bloc,
                            child: DeleteAccount(),
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
                        builder: (context) => CustomerService(),
                      );
                    },
                    text: "customer_service".tr(),
                  ),
                  SizedBox(height: 46),
                  Logout(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
