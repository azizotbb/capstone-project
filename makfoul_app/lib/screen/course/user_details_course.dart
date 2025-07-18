import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makfoul_app/extension/app_sizes.dart';
import 'package:makfoul_app/style/app_colors.dart';
import 'package:makfoul_app/style/app_text_style.dart';
import 'package:makfoul_app/utility/map_helper.dart';
import 'package:makfoul_app/widget/course/course_info.dart';

class UserDetailsCourse extends StatelessWidget {
  final String desc;
  final String categoryname;
  final String startDate;
  final String endDate;
  final String? location;
  final String state;
  final double price;
  final String coursetitle;
  final String? categoryimage;
  final int? regusterednum;
  final int canreguster;
  final String tranername;
  final String tranerPhone;
  

  const UserDetailsCourse({
    super.key,
    required this.desc,
    required this.categoryname,
    required this.startDate,
    required this.endDate,
    this.location,
    required this.state,
    required this.price,
    required this.coursetitle,
    this.categoryimage,
    this.regusterednum,
    required this.canreguster,
    required this.tranername,
    required this.tranerPhone,
  });

  @override
  Widget build(BuildContext context) {
     // Parse course location string into LatLng
    final LatLng? position = parseLatLng(location);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: AppColors.colorDarkGrey,
                    ),
                    SizedBox(width: 90),
                    Text(
                      "Details".tr(),
                      style: AppTextStyle.textTitleLarg24dark,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  coursetitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.colorDarkGrey,
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Course information".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                CourseInfo(
                  categoryimage: categoryname == "Clean"
                      ? "assets/icons/clean3.svg"
                      : "assets/icons/cook.svg",
                  categoryname: categoryname.tr(),
                  startDate: startDate,
                  endDate: endDate,
                  location: 'Ryaidh'.tr(),
                  description: desc,
                  price: price,
                  isActive: state,
                  trainer: tranername,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Trainer".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(":  $tranername"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(":  $tranerPhone"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                   Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Location".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),

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
                                        markerId: MarkerId(coursetitle.toString()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
