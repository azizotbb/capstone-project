import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/auth/welcom_screen.dart';
import 'package:makfoul_app/screen/onboarding/bloc/onboarding_bloc.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboardingBloc>();
          bloc.add(LoadImageEvent());
          return Scaffold(
            body: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                if (state is LodaingState) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        CarouselSlider(
                          items: state.topImages.map((path) {
                            return Builder(
                              builder: (context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Image.asset(path, fit: BoxFit.cover),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 150,
                            autoPlay: true,
                            enlargeFactor: 0.3,
                            viewportFraction: 0.3,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              bloc.add(ChangeImageEvent(index: index));
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        CarouselSlider(
                          items: state.bottomImages.map((path) {
                            return Builder(
                              builder: (context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Image.asset(path, fit: BoxFit.cover),
                                );
                              },
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 150,
                            autoPlay: true,
                            reverse: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                            enlargeFactor: 0.3,
                            viewportFraction: 0.3,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              bloc.add(ChangeImageEvent(index: index));
                            },
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          'Master Home Skills with Ease',
                          style: AppTextStyle.textSemiBold18,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Start your cooking and cleaning journey with clear steps, and track your progress to grow with confidence.',
                          style: AppTextStyle.textSemiBold16,
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        PrimryCustomButton(
                          setText: 'Get Started',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WelcomScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          );
        },
      ),
    );
  }
}

