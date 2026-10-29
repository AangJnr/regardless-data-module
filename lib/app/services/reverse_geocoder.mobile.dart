import 'package:geocoding/geocoding.dart';
import 'reverse_geocoder.dart';

ReverseGeocoder createGeocoder() => _MobileGeocoder();

class _MobileGeocoder implements ReverseGeocoder {
  @override
  Future<String> addressFromCoordinates(double lat, double lng) async {
    final placemarks = await Geocoding().placemarkFromCoordinates(lat, lng);
    return placemarks.isNotEmpty
        ? placemarks.first.name ?? 'Address'
        : 'Address';
  }
}
