import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/profile/bloc/profile_bloc.dart';

class ChangeImage extends StatelessWidget {
  const ChangeImage({super.key});

  @override
  Widget build(BuildContext context) {
    var userinfo = GetIt.I.get<AuthLayer>().userinfo;

    return Builder(
      builder: (context) {
        final bloc = context.read<ProfileBloc>();

        return InkWell(
          onTap: () {
            bloc.add(UpdateImageEvent());
            userinfo.avatar = userinfo.avatar = bloc.urlString;
          },
          child: Container(
            height: 68,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: userinfo.avatar == null
                ? Image.asset("assets/images/circler avtar instructor.png")
                : Image.network(userinfo.avatar!),
          ),
        );
      },
    );
  }
}
