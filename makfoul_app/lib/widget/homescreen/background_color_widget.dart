import 'package:flutter/material.dart';
import 'package:makfoul_app/extension/app_sizes.dart';

class BackgroundColorWidget extends StatelessWidget {
  const BackgroundColorWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: context.getWidth(),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 109, 64, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
