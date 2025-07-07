import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Parses a string like "LatLng(24.7136, 46.6753)" into a LatLng object.
/// Returns null if the format is invalid.
LatLng? parseLatLng(String? locationString) {
  if (locationString == null) return null;

  String cleaned = locationString
      .replaceAll(RegExp(r'LatLng|\(|\)'), '')
      .trim();

  final parts = cleaned.split(',');
  if (parts.length != 2) return null;

  final lat = double.tryParse(parts[0].trim()) ?? 0.0;
  final lng = double.tryParse(parts[1].trim()) ?? 0.0;
  return LatLng(lat, lng);
}

/// Opens Google Maps in the browser with the given coordinates.
/// Used to view course location externally from the app.
void openGoogleMap(LatLng? location) async {
  if (location == null) return;
  final lat = location.latitude;
  final lng = location.longitude;
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    print("❌ Can't launch any map URL.");
  }
}
