import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/screen/guest_signup.dart';
import 'package:makfoul_app/screen/payment/payment_screen.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/map_helper.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class CourseView extends StatelessWidget {
  final int courseId;
  final String tid;
  final String category;
  final String img;
  final String title;
  final String description;
  final String location;
  final double price;
  final int numberOfTrainees;
  final String state;

  const CourseView({
    super.key,
    required this.courseId,
    required this.img,
    required this.title,
    required this.description,
    required this.location,
    required this.price,
    required this.tid,
    required this.category,
    required this.numberOfTrainees,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    // Parse course location string into LatLng
    final LatLng? position = parseLatLng(location);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(16),
        child: PrimryCustomButton(
          setText: "Get Course".tr(),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.colorPrimary,
                  ),
                );
              },
            );
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.pop(context);
              if(GetIt.I.get<AuthLayer>().userinfo.UID != ' '){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(
                    courseId: courseId,
                    amount: (price * 100).round(),
                  ),
                ),
              );
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GuestSignup()));
            }
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.getWidth(),
                  height: 300,

                  child: Image.network(img, fit: BoxFit.fill),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 50, left: 18),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title, style: AppTextStyle.textbold16),
                          Row(
                            children: [
                              Text(numberOfTrainees.toString()),
                              const Icon(
                                Icons.person,
                                color: AppColors.colorPrimary,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(description, style: AppTextStyle.textDes12),
                      const SizedBox(height: 16),

                      Text("Location".tr(), style: AppTextStyle.textbold16),

                      const SizedBox(height: 16),

                      SizedBox(
                        width: context.getWidth(),
                        height: 150,
                        child: position == null
                            ? Image.asset(
                                'assets/images/map.png',
                                fit: BoxFit.cover,
                              )
                            : Stack(
                                // Show Google Map if position is valid
                                children: [
                                  GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: position,
                                      zoom: 14,
                                    ),
                                    // Display a single marker on the map for the course location
                                    markers: {
                                      (Marker(
                                        markerId: MarkerId(courseId.toString()),
                                        position: position,
                                      )),
                                    },
                                    zoomControlsEnabled: false,
                                    myLocationButtonEnabled: false,
                                    liteModeEnabled: true,
                                    gestureRecognizers: {},
                                  ),

                                  // When the map is tapped, open Google Maps externally
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          final latLng = parseLatLng(location);
                                          openGoogleMap(latLng);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      const SizedBox(height: 16),
                      Text("Price".tr(), style: AppTextStyle.textbold16),
                      Row(
                        spacing: 2,
                        children: [
                          Image.asset(
                            "assets/images/Saudi_Riyal_Symbol.png",
                            height: 10,
                          ),
                          Text(
                            price.toString(),
                            style: AppTextStyle.text14primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
