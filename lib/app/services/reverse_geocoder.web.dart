// reverse_geocoder_web.dart  (no geocoding import)
import 'reverse_geocoder.dart';

ReverseGeocoder createGeocoder() => _WebGeocoder();

class _WebGeocoder implements ReverseGeocoder {
  @override
  Future<String> addressFromCoordinates(double lat, double lng) async {
    return 'Address';
  }
}
