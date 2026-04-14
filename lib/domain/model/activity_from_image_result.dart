import 'package:regardless_data_module/domain/model/price.dart';

class ActivityFromImageResult {
  final String? name;
  final List<String> descriptions;
  final String? startDateTime;
  final String? venueText;
  final String? venueName;
  final String? phone;
  final String? email;
  final double? latitude;
  final double? longitude;
  final String? priceNotes;
  final Price? price;
  const ActivityFromImageResult(
      {this.name,
      this.descriptions = const [],
      this.startDateTime,
      this.venueText,
      this.venueName,
      this.phone,
      this.email,
      this.latitude,
      this.longitude,
      this.priceNotes,
      this.price});

  factory ActivityFromImageResult.fromMap(Map<String, dynamic> m) {
    double? toDouble(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v);
      return null;
    }

    return ActivityFromImageResult(
        name: m['name'] as String?,
        descriptions: (m['descriptions'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        startDateTime: m['startDateTime'] as String?,
        venueText: m['venueText'] as String?,
        venueName: m['venueName'] as String?,
        phone: m['phone'] as String?,
        email: m['email'] as String?,
        latitude: toDouble(m['latitude']),
        longitude: toDouble(m['longitude']),
        priceNotes: m['priceNotes'] as String?,
        price: m['price'] != null ? PriceMapper.fromMap(m['price']) : null);
  }
@override
  String toString() {
    return 'ActivityFromImageResult(name: $name, descriptions: $descriptions, startDateTime: $startDateTime, venueText: $venueText, venueName: $venueName, phone: $phone, email: $email, latitude: $latitude, longitude: $longitude, priceNotes: $priceNotes, price: $price)';
  }
}
