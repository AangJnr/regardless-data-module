class Location {
  final String address;
  final double latitude;
  final double longitude;

  const Location(
      {this.address = '', this.latitude = 0.0, this.longitude = -0.0});

  @override
  String toString() {
    return 'Location(address: $address, latitude: $latitude, longitude: $longitude)';
  }

  Location copyWith({
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return Location(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
