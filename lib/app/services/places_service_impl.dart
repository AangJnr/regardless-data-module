import 'package:flutter/foundation.dart';
import 'package:google_place/google_place.dart';
import '../../domain/model/predicted_location.dart';
import '../../domain/model/venue.dart';

class PlacesServiceImpl implements PlacesService {
  GooglePlace? _googlePlace;
  PlacesServiceImpl() {
    _googlePlace = GooglePlace("AIzaSyC1Q7EaLBqzrldfVay8HDAVS2v9R1r88KY");
  }

  @override
  Future<List<PredictedLocation>> searchPlaceByQuery(String query) async {
    AutocompleteResponse? result = await _googlePlace?.autocomplete.get(query);
    final predictions = result?.predictions
            ?.map((e) => PredictedLocation(
                address: e.description ?? '',
                length: (e.matchedSubstrings?.isNotEmpty == true)
                    ? e.matchedSubstrings?.first.length ?? 0
                    : 0,
                offset: (e.matchedSubstrings?.isNotEmpty == true)
                    ? e.matchedSubstrings?.first.offset ?? 0
                    : 0,
                placeId: e.placeId ?? ""))
            .toList() ??
        [];
    debugPrint(
        "PlacesServiceImpl - Query ==> $query || Predictions is ==> ${predictions.length}");
    return predictions;
  }

  @override
  Future<Venue> getAddressDetails(PredictedLocation predictedLocation) async {
    DetailsResponse? detailsResponse =
        await _googlePlace?.details.get(predictedLocation.placeId);
    if (detailsResponse != null) {
      final result = detailsResponse.result;

      debugPrint("PlacesService - result?.addressComponents?.toString()");
      final a = Venue(
        address: result?.formattedAddress ?? '',
        city: getData(3, result?.addressComponents),
        country: getData(6, result?.addressComponents),
        state: getData(5, result?.addressComponents),
        lat: result?.geometry?.location?.lat ?? 0.0,
        lng: result?.geometry?.location?.lng ?? 0.0,
      );

      return a;
    }
    return Venue(address: predictedLocation.address);
  }

  String getData(int index, List<AddressComponent>? components,
      {bool isShortName = false}) {
    if (components?.isEmpty == true || components!.length <= index) return '';
    if (isShortName) {
      return components[index].shortName!;
    }
    return components[index].longName!;
  }
}

abstract class PlacesService {
  Future<List<PredictedLocation>> searchPlaceByQuery(String query);
  Future<Venue> getAddressDetails(PredictedLocation predictedLocation);
}
