import 'package:geolocator/geolocator.dart';

Future<Position?> getLocation() async {
  // Return Position? (nullable)
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null; // Return null if location services are disabled
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null; // Return null if permissions are denied
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return null; // Return null if permissions are permanently denied
  }

  try {
    return await Geolocator.getCurrentPosition();
  } catch (e) {
    return null; // Return null if there's an error getting the position
  }
}