import 'dart:convert';

import '../../domain/domain_mapper.dart';
import '../../../domain/model/venue.dart';

class VenueApi implements DomainMapper<Venue> {
  final String? country;
  final String? address;
  final dynamic lng;
  final String? city;
  final String? name;
  final String? state;
  final dynamic lat;
  final String? otherAddress;
  final String? countryIso;
  final String? placeId;

  const VenueApi(
      {this.country,
      this.address,
      this.lng,
      this.city,
      this.name,
      this.state,
      this.lat,
      this.placeId,
      this.countryIso,
      this.otherAddress});

  @override
  String toString() {
    return 'Venue(country: $country, address: $address, lng: $lng, city: $city, name: $name, state: $state, lat: $lat)';
  }

  factory VenueApi.fromMap(Map<String, dynamic> data) => VenueApi(
      country: data['country'] as String?,
      address: data['address'] as String?,
      lng: data['lng'] as dynamic,
      city: data['city'] as String?,
      name: data['name'] as String?,
      state: data['state'] as String?,
      lat: data['lat'] as dynamic,
      countryIso: data['countryIso'] as String?,
      placeId: data['placeId'] as String?,
      otherAddress: data['otherAddress'] as String?);

  Map<String, dynamic> toMap() => {
        'country': country,
        'address': address,
        'lng': lng,
        'city': city,
        'name': name,
        'state': state,
        'lat': lat,
        'placeId': placeId,
        'countryIso': countryIso,
        'otherAddress': otherAddress
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VenueApi].
  factory VenueApi.fromJson(String data) {
    return VenueApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VenueApi] to a JSON string.
  String toJson() => json.encode(toMap());

  VenueApi copyWith(
      {String? country,
      String? address,
      dynamic lng,
      String? city,
      String? name,
      String? state,
      dynamic lat,
      String? otherAddress,
      String? countryIso}) {
    return VenueApi(
        country: country ?? this.country,
        address: address ?? this.address,
        lng: lng ?? this.lng,
        city: city ?? this.city,
        name: name ?? this.name,
        state: state ?? this.state,
        lat: lat ?? this.lat,
        countryIso: countryIso,
        otherAddress: otherAddress ?? this.otherAddress);
  }

  @override
  Venue mapToDomain() => Venue(
      country: country ?? '',
      address: address ?? '',
      lng: lng ?? -0.0,
      city: city ?? '',
      name: name ?? '',
      state: state ?? '',
      lat: lat ?? 0.0,
      otherAddress: otherAddress ?? '');
}
