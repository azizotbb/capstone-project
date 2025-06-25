import 'package:flutter/material.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SearchBar(
        leading: Icon(Icons.search, color: AppColors.colorDarkGrey),
        hintText: "Search",
        hintStyle: MaterialStateProperty.all(AppTextStyle.textReguler16),
        elevation: WidgetStatePropertyAll(1),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
