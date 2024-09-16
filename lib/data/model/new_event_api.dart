import 'dart:convert';

import 'category_api.dart';
import 'hash_image.dart';
import 'price_api.dart';
import 'venue_api.dart';

class NewEventRequest {
  final VenueApi? venue;
  String? archiveReason;
  final int durationHour;
  final bool isVerified;
  final int ticketsCancelled;
  final bool isArchived;
  final String? timezone;
  String? updateReason;
  final String? verifiedAt;
  final String? description;
  final String? recurrenceUuid;
  final String? recurrence;
  final String? recurrenceLabel;

  final DateTime? createdAt;
  final String? uid;
  final String? localTimestamp;
  final String? categoryUid;
  final CategoryApi? category;
  final String? onlineEventUrl;
  final List<PriceApi>? prices;
  final int durationMin;
  final int? timestamp;
  final DateTime? updatedAt;
  final int ticketsPurchased;
  final String? contactEmail;
  final int availableTickets;
  final int viewsCount;
  final String? eventType;
  final bool isRepeating;
  final List<HashImageApi>? imageUrls;
  final String? name;
  final String? contactPhone;
  final String? ownerUid;
  final String? ownerUsername;
  final String? ownerImageUrl;
  final bool isSponsored;
  final List<String>? imageBase64Data;
  final String? communityUid;

  NewEventRequest({
    this.venue,
    this.archiveReason,
    this.durationHour = 0,
    this.isVerified = false,
    this.ticketsCancelled = 0,
    this.isArchived = false,
    this.timezone,
    this.updateReason,
    this.verifiedAt,
    this.description,
    this.recurrenceUuid,
    this.recurrenceLabel,
    this.createdAt,
    this.uid,
    this.category,
    this.recurrence,
    this.localTimestamp,
    this.categoryUid,
    this.onlineEventUrl,
    this.prices,
    this.durationMin = 0,
    this.timestamp,
    this.imageBase64Data,
    this.updatedAt,
    this.ticketsPurchased = 0,
    this.contactEmail,
    this.availableTickets = 0,
    this.viewsCount = 0,
    this.eventType,
    this.isRepeating = false,
    this.imageUrls,
    this.name,
    this.contactPhone,
    this.ownerUid,
    this.ownerImageUrl,
    this.ownerUsername,
    this.communityUid,
    this.isSponsored = false,
  });

  Map<String, dynamic> toMap() {
    final data = {
      'venue': venue?.toMap(),
      'archiveReason': archiveReason,
      'durationHour': durationHour,
      'isVerified': isVerified,
      'ticketsCancelled': ticketsCancelled,
      'isArchived': isArchived,
      'timezone': timezone,
      'updateReason': updateReason,
      'verifiedAt': verifiedAt,
      'description': description,
      'recurrenceUid': recurrenceUuid,
      'recurrenceLabel': recurrenceLabel,
      'category': category?.toMap(),
      'localTimestamp': localTimestamp,
      'categoryUid': categoryUid,
      'onlineEventUrl': onlineEventUrl,
      'prices': prices?.map((e) => e.toMap()).toList(),
      'durationMin': durationMin,
      'timestamp': timestamp,
      'ticketsPurchased': ticketsPurchased,
      'contactEmail': contactEmail,
      'availableTickets': availableTickets,
      'viewsCount': viewsCount,
      'eventType': eventType,
      'isRepeating': isRepeating,
      'recurrence': recurrence,
      'imageUrls': imageUrls?.map((e) => e.toMap()).toList(),
      'name': name,
      'contactPhone': contactPhone,
      'ownerUid': ownerUid,
      'ownerUsername': ownerUsername,
      'ownerImageUrl': ownerImageUrl,
      'isSponsored': isSponsored,
      'imageData': imageBase64Data,
      'communityUid': communityUid,
    };
    if (uid?.isNotEmpty == true) {
      data['uid'] = uid;
    }

    return data;
  }

  /// `dart:convert`
  ///
  /// Converts [EventApi] to a JSON string.
  String toJson() => json.encode(toMap());
}
