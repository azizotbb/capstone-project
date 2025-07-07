import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/profile/bloc/profile_bloc.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final userinfo = GetIt.I.get<AuthLayer>().userinfo;

    return Builder(
      builder: (context) {
        final bloc = context.read<ProfileBloc>();
        return Dialog(
          backgroundColor: Colors.white,
          child: SizedBox(
            width: context.getWidth(size: 0.85),
            height: context.getHeight(size: 0.3),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Enter Your New Name',
                      style: AppTextStyle.textTitleMedium20,
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
                        userinfo.username = bloc.nameController.text;
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
    ;
  }
}
