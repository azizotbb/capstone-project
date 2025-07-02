import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/screen/profile/bloc/profile_bloc.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final bloc = context.read<ProfileBloc>();
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            width: context.getWidth(),
            height: context.getHeight(size: 0.37),
            child: Form(
              key: bloc.formKey,
              child: Column(
                spacing: 19,
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return CustomTextField(
                        controller: bloc.newPasswordController,
                        setHint: "new_password".tr(),
                        isPassword: true,
                        isVisable: bloc.showPassword,
                        onPressedSuffix: () {
                          bloc.add(ShowPasswordEvent());
                        },
                        validator: (value) {
                          return Validators.password(value);
                        },
                      );
                    },
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return CustomTextField(
                        isPassword: true,
                        isVisable: bloc.showConfirmPassword,
                        onPressedSuffix: () {
                          bloc.add(ShowConfirmPasswordEvent());
                        },
                        setHint: "confirm_password".tr(),
                        validator: (value) {
                          return Validators.confirmPassword(
                            value,
                            bloc.newPasswordController.text,
                          );
                        },
                      );
                    },
                  ),
        
                  SizedBox(height: context.getHeight(size: 0.08)),
                  PrimryCustomButton(
                    setText: "save".tr(),
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        bloc.add(UpdatePasswordEvent());
                        print('Done');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
