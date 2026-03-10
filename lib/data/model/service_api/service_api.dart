import 'dart:convert';

import 'package:regardless_data_module/domain/model/user.dart';

import '../price_api.dart';
import '../venue_api.dart';
import 'time_slot_api.dart';

class CreateService {
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
  final AUser? provider;
  final int? subscriptionDurationDays;

  const CreateService({
    this.createdAt,
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
    this.provider,
    this.subscriptionDurationDays,
  });

  @override
  String toString() {
    return 'ServiceApi(createdAt: $createdAt, uid: $uid, keywords: $keywords, price: $prices, name: $name, description: $description, timeSlots: $timeSlots, location: $location, ownerUid: $ownerUid, updatedAt: $updatedAt)';
  }

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
        'isActive': isActive,
        'subscriptionDurationDays': subscriptionDurationDays,
      };

  /// `dart:convert`
  ///
  /// Converts [CreateService] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateService copyWith({
    DateTime? createdAt,
    String? uid,
    List<String>? keywords,
    List<PriceApi>? prices,
    String? name,
    String? description,
    List<TimeSlotApi>? timeSlots,
    VenueApi? location,
    String? ownerUid,
    DateTime? updatedAt,
    bool? isActive,
    String? categoryUid,
    AUser? provider,
    int? subscriptionDurationDays,
  }) {
    return CreateService(
      createdAt: createdAt ?? this.createdAt,
      uid: uid ?? this.uid,
      keywords: keywords ?? this.keywords,
      prices: prices ?? this.prices,
      name: name ?? this.name,
      description: description ?? this.description,
      timeSlots: timeSlots ?? this.timeSlots,
      location: location ?? this.location,
      ownerUid: ownerUid ?? this.ownerUid,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      categoryUid: categoryUid ?? this.categoryUid,
      provider: provider ?? this.provider,
      subscriptionDurationDays:
          subscriptionDurationDays ?? this.subscriptionDurationDays,
    );
  }
}
