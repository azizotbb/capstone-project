import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/widget/bottomNavigation/bloc/bottom_navigation_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<BottomNavigationBloc>();

          return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: bloc.selectIndex,

                  selectedItemColor: AppColors.colorPrimary,
                  unselectedItemColor: AppColors.colorMedimGrey,
                  backgroundColor: Colors.white,
                  iconSize: 25,
                  onTap: (value) {
                    bloc.add(ChangeNavSelectEvent(index: value));
                  },

                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: " ",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt),
                      label: " ",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: " ",
                    ),
                  ],
                ),
                body: bloc.listWidget[bloc.selectIndex],
              );
            },
          );
        },
      ),
    );
  }
}
