

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatelessWidget {
  const MapSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Map")),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(24.7136, 46.6753), 
          zoom: 12,
        ),
      ),
    );
  }
}
