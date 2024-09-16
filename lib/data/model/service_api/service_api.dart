import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/service/service.dart';
import '../../../domain/model/venue.dart';
import '../price_api.dart';
import '../user_response/user_response.dart';
import '../venue_api.dart';
import 'time_slot_api.dart';

class ServiceApi implements DomainMapper<Service> {
  final DateTime? createdAt;
  final String? uid;
  final List<String>? keywords;
  final List<PriceApi>? prices;
  final String? name;
  final String? description;
  final List<TimeSlotApi>? timeSlots;
  final VenueApi? location;
  final String? ownerUid;
  final DateTime? updatedAt;
  final String? categoryUid;
  final bool? isActive;
  final UserResponse? provider;

  const ServiceApi(
      {this.createdAt,
      this.uid,
      this.keywords,
      this.prices,
      this.name,
      this.description,
      this.timeSlots,
      this.location,
      this.ownerUid,
      this.updatedAt,
      this.isActive,
      this.categoryUid,
      this.provider});

  @override
  String toString() {
    return 'ServiceApi(createdAt: $createdAt, uid: $uid, keywords: $keywords, price: $prices, name: $name, description: $description, timeSlots: $timeSlots, location: $location, ownerUid: $ownerUid, updatedAt: $updatedAt)';
  }

  factory ServiceApi.fromMap(Map<String, dynamic> data) => ServiceApi(
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      uid: data['uid'] as String?,
      keywords: data['keywords'] == null
          ? null
          : (data['keywords'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      prices: (data['prices'] as List<dynamic>?)
          ?.map((e) => PriceApi.fromMap(e as Map<String, dynamic>))
          .toList(),
      name: data['name'] as String?,
      categoryUid: data['categoryUid'] as String?,
      description: data['description'] as String?,
      timeSlots: (data['timeSlots'] as List<dynamic>?)
          ?.map((e) => TimeSlotApi.fromMap(e as Map<String, dynamic>))
          .toList(),
      location: data['location'] == null
          ? null
          : VenueApi.fromMap(data['location'] as Map<String, dynamic>),
      ownerUid: data['ownerUid'] as String?,
      isActive: data['isActive'] as bool?,
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      provider: data['provider'] == null
          ? null
          : UserResponse.fromMap(data['provider']));

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt?.toIso8601String(),
        'uid': uid,
        'keywords': keywords,
        'prices': prices?.map((e) => e.toMap()).toList(),
        'name': name,
        'description': description,
        'timeSlots': timeSlots?.map((e) => e.toMap()).toList(),
        'location': location?.toMap(),
        'ownerUid': ownerUid,
        'updatedAt': updatedAt?.toIso8601String(),
        'categoryUid': categoryUid,
        'isActive': isActive
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceApi].
  factory ServiceApi.fromJson(String data) {
    return ServiceApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceApi] to a JSON string.
  String toJson() => json.encode(toMap());

  ServiceApi copyWith(
      {DateTime? createdAt,
      String? uid,
      List<String>? keywords,
      PriceApi? price,
      String? name,
      String? description,
      List<TimeSlotApi>? timeSlots,
      VenueApi? location,
      String? ownerUid,
      DateTime? updatedAt,
      String? categoryUid}) {
    return ServiceApi(
        createdAt: createdAt ?? this.createdAt,
        uid: uid ?? this.uid,
        keywords: keywords ?? this.keywords,
        prices: prices ?? const [],
        name: name ?? this.name,
        description: description ?? this.description,
        timeSlots: timeSlots ?? this.timeSlots,
        location: location ?? this.location,
        ownerUid: ownerUid ?? this.ownerUid,
        updatedAt: updatedAt ?? this.updatedAt,
        categoryUid: categoryUid ?? this.categoryUid);
  }

  @override
  Service mapToDomain() => Service(
      createdAt: createdAt,
      uid: uid ?? '',
      keywords: keywords ?? const [],
      prices: prices?.map((e) => e.mapToDomain()).toList() ?? const [],
      name: name ?? '',
      description: description ?? '',
      timeSlots: timeSlots?.map((e) => e.mapToDomain()).toList() ?? const [],
      location: location?.mapToDomain() ?? const Venue(),
      ownerUid: ownerUid ?? '',
      updatedAt: updatedAt,
      categoryUid: categoryUid ?? '',
      isActive: isActive ?? false,
      provider: provider?.mapToDomain());
}
