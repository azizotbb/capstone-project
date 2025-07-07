// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
// import 'package:makfoul_app/style/app_colors.dart';
// import 'package:makfoul_app/style/app_text_style.dart';

// class SearchWidget extends StatelessWidget {
//   const SearchWidget({super.key});
// //هنا السيرش ويدجت 
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: SearchBar(
//         leading: Icon(Icons.search, color: AppColors.colorDarkGrey),
//         hintText: "Search",
//         hintStyle: MaterialStateProperty.all(AppTextStyle.textReguler16),
//         elevation: WidgetStatePropertyAll(1),
//         backgroundColor: WidgetStatePropertyAll(Colors.white),
//         shape: WidgetStatePropertyAll(
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//         onChanged: (value) {
//           context.read<AddCorseBloc>().add(UpdateSearchQuery(searchtext: value));
//         },
//       ),
//     );
//   }
// }
