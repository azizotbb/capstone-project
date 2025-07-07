import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class PickedLocation extends StatelessWidget {
  PickedLocation({super.key});
  final LatLng defaultLoc = LatLng(
    24.7136,
    46.6753,
  ); // Default location (Riyadh)

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddCorseBloc>();
    return Scaffold(
      body: BlocBuilder<AddCorseBloc, AddCorseState>(
        builder: (context, state) {
          LatLng currentLoc = defaultLoc;

          // Priority 1: Use location picked by trainer
          if (bloc.selectedLocation != null) {
            currentLoc = bloc.selectedLocation!;
          }
          // Priority 2: Use GPS location loaded from state if no picked location
          else if (state is LocationLodedState) {
            currentLoc = state.currentLocation;
          }

          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLoc,
                    zoom: 14,
                  ),
                  myLocationEnabled:
                      true, // Show user's current location button
                  mapType: MapType.normal,
                  markers: {
                    Marker(markerId: MarkerId('sel'), position: currentLoc),
                  },
                  // When user taps on map, send location picked event
                  onTap: (newloc) {
                    bloc.add(PickLocatioEvent(location: newloc));
                  },
                ),
              ),
              SizedBox(height: 16),
              PrimryCustomButton(
                setText: 'Save',
                onPressed: () {
                  if (bloc.selectedLocation != null) {
                    // Return selected location back to previous screen
                    Navigator.pop(context, bloc.selectedLocation);
                  } else {
                    // Show message if no location selected yet
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Choose Your Location')),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}
