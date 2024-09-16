import '../../domain/model/venue.dart';
import '../../domain/repositories/event_repository.dart';
import '../app.locator.dart';

class GeocoderImpl implements TGeocoder {
  @override
  Future<Venue> addressFromCoordinates(double lat, double lng) async {
    return await module<EventRepository>().geocode(lat, lng);
  }
}

abstract class TGeocoder {
  Future<Venue> addressFromCoordinates(double lat, double lon);
}
