import 'package:geocoding/geocoding.dart';

Future<String> getLocationName(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;

      String address = placemark.name ?? '';
      if (placemark.subLocality != null) {
        address += ', ${placemark.subLocality}';
      }
      if (placemark.locality != null) {
        address += ', ${placemark.locality}';
      }
      if (placemark.administrativeArea != null) {
        address += ', ${placemark.administrativeArea}';
      }
      if (placemark.country != null) {
        address += ', ${placemark.country}';
      }
      return address;
    } else {
      return 'No location found';
    }
  } catch (e) {
    print('Error during reverse geocoding: $e');
    return 'Error';
  }
}