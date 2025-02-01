import 'package:flutter/foundation.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import '../../domain/model/predicted_location.dart';
import '../../domain/model/venue.dart';

class PlacesServiceImpl implements PlacesService {
  FlutterGooglePlacesSdk? _googlePlace;
  PlacesServiceImpl() {
    _googlePlace =
        FlutterGooglePlacesSdk("AIzaSyC1Q7EaLBqzrldfVay8HDAVS2v9R1r88KY");
  }

  @override
  Future<List<PredictedLocation>> searchPlaceByQuery(String query) async {
    final predictions = await _googlePlace?.findAutocompletePredictions(query);
    final locations = predictions?.predictions
            .map((e) => PredictedLocation(
                address: e.fullText, length: e.distanceMeters??0, offset: 0, placeId: e.placeId))
            .toList() ??
        [];
    debugPrint(
        "PlacesServiceImpl - Query ==> $query || Predictions is ==> ${locations.length}");
    return locations;
  }

  @override
  Future<Venue> getAddressDetails(PredictedLocation predictedLocation) async {
    FetchPlaceResponse? detailsResponse =
        await _googlePlace?.fetchPlace(predictedLocation.placeId, fields: []);
    if (detailsResponse != null) {
      final place = detailsResponse.place;

      debugPrint("PlacesService - result?.addressComponents?.toString()");
      final a = Venue(
        address: place?.address ?? '',
        city: getData(3, place?.addressComponents),
        country: getData(6, place?.addressComponents),
        state: getData(5, place?.addressComponents),
        lat: place?.latLng?.lat ?? 0.0,
        lng: place?.latLng?.lng ?? 0.0,
      );

      return a;
    }
    return Venue(address: predictedLocation.address);
  }

  String getData(int index, List<AddressComponent>? components,
      {bool isShortName = false}) {
    if (components?.isEmpty == true || components!.length <= index) return '';
    if (isShortName) {
      return components[index].shortName;
    }
    return components[index].name;
  }
}

abstract class PlacesService {
  Future<List<PredictedLocation>> searchPlaceByQuery(String query);
  Future<Venue> getAddressDetails(PredictedLocation predictedLocation);
}
