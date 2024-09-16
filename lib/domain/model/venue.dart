import '../../data/model/venue_api.dart';
import '../domain_mapper.dart';

class Venue implements DataMapper<VenueApi> {
  final String country;
  final String countryIso;
  final String placeId;
  final String address;
  final double lng;
  final String city;
  final String name;
  final String state;
  final double lat;
  final String otherAddress;

  const Venue({
    this.placeId = '',
    this.country = "",
    this.address = "",
    this.otherAddress = "",
    this.lng = 0.0,
    this.city = "",
    this.countryIso = '',
    this.name = "",
    this.state = "",
    this.lat = -0.0,
  });

  @override
  String toString() {
    return 'Venue(country: $country, address: $address, lng: $lng, city: $city, name: $name, state: $state, lat: $lat)';
  }

  Venue copyWith(
      {String? country,
      String? address,
      double? lng,
      String? city,
      String? name,
      String? state,
      double? lat,
      String? otherAddress,
      String? placeId}) {
    return Venue(
        country: country ?? this.country,
        address: address ?? this.address,
        lng: lng ?? this.lng,
        city: city ?? this.city,
        name: name ?? this.name,
        state: state ?? this.state,
        lat: lat ?? this.lat,
        countryIso: countryIso,
        placeId: placeId ?? this.placeId,
        otherAddress: otherAddress ?? this.otherAddress);
  }

// LatLng position() => LatLng(lat.abs(), lng);

  String getAddress() => name.isEmpty ? address : '$name | $address';

  String getName() {
    if (address.isEmpty) return '';
    if (address.toLowerCase() == 'current location') return 'you';
    return address;
  }

  @override
  VenueApi mapToApi() => VenueApi(
      country: country,
      address: address,
      lng: lng,
      city: city,
      name: name,
      state: state,
      lat: lat,
      countryIso: countryIso,
      otherAddress: otherAddress,
      placeId: placeId);
}
