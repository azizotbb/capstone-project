import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makfoul_app/screen/orders-related/add_course/bloc/add_corse_bloc.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

class PickedLocation extends StatelessWidget {
  PickedLocation({super.key});
  final LatLng defaultLoc = LatLng(24.7136, 46.6753);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddCorseBloc>();
    bloc.add(DynamicLocationEvent());
    return Scaffold(
      body: BlocBuilder<AddCorseBloc, AddCorseState>(
        builder: (context, state) {
          LatLng currentLoc = defaultLoc;
          if (state is LocationLodedState) {
              print('Location loaded from state: ${state.location}');

            currentLoc = state.location;
          } else if (bloc.selectedLocation != null) {
            currentLoc = bloc.selectedLocation!;
          }
       
          return Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLoc,
                    zoom: 14,
                  ),
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  markers: {
                    Marker(markerId: MarkerId('sel'), position: currentLoc),
                  },
                  onTap: (newloc) {
                     print(' New location selected: $newloc'); 
                    bloc.add(PickLocatioEvent(location: newloc));
                  },
                ),
              ),
              SizedBox(height: 16),
              PrimryCustomButton(
                setText: 'Save',
                onPressed: () {
                      print(' selectedLocation: ${bloc.selectedLocation}'); 

                  if (bloc.selectedLocation != null) {
                    Navigator.pop(context, bloc.selectedLocation);
                  } else {
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
