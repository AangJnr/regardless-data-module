import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:regardless_data_module/data/model/attendee_api.dart';

import '../../domain/domain_mapper.dart';
import '../../domain/model/category.dart';
import '../../domain/model/event.dart';
import '../../domain/model/venue.dart';
import 'category_api.dart';
import 'hash_image.dart';
import 'price_api.dart';
import 'venue_api.dart';

class EventApi implements DomainMapper<Event> {
  final VenueApi? venue;
  final String? archiveReason;
  final int? durationHour;
  final bool? isVerified;
  final int? ticketsCancelled;
  final bool? isArchived;
  final String? timezone;
  final String? updateReason;
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
  final int? durationMin;
  final int? timestamp;
  final DateTime? updatedAt;
  final int? ticketsPurchased;
  final String? contactEmail;
  final int? availableTickets;
  final int? viewsCount;
  final String? eventType;
  final bool? isRepeating;
  final List<HashImageApi>? imageUrls;
  final String? name;
  final String? contactPhone;
  final String? ownerUid;
  final bool? isSponsored;
  final String? ownerUserName;
  final String? ownerProfileImageUrl;
  final List<String>? tags;
  final String? communityUid;
  final List<AttendeeApi>? attendees;
  final int? attendeesCount;

  const EventApi(
      {this.venue,
      this.archiveReason,
      this.durationHour,
      this.isVerified,
      this.ticketsCancelled,
      this.isArchived,
      this.timezone,
      this.updateReason,
      this.tags,
      this.verifiedAt,
      this.description,
      this.recurrenceUuid,
      this.recurrence,
      this.recurrenceLabel,
      this.createdAt,
      this.uid,
      this.category,
      this.localTimestamp,
      this.categoryUid,
      this.onlineEventUrl,
      this.prices,
      this.durationMin,
      this.timestamp,
      this.updatedAt,
      this.ticketsPurchased,
      this.contactEmail,
      this.availableTickets,
      this.viewsCount,
      this.eventType,
      this.isRepeating,
      this.imageUrls,
      this.name,
      this.contactPhone,
      this.ownerUid,
      this.ownerProfileImageUrl,
      this.ownerUserName,
      this.isSponsored,
      this.communityUid,
      this.attendees,
      this.attendeesCount});

  @override
  String toString() {
    return 'EventApi(venue: $venue, archiveReason: $archiveReason, durationHour: $durationHour, isVerified: $isVerified, ticketsCancelled: $ticketsCancelled, isArchived: $isArchived, timezone: $timezone, updateReason: $updateReason, verifiedAt: $verifiedAt, description: $description, recurrenceUuid: $recurrenceUuid, createdAt: $createdAt, uid: $uid, localTimestamp: $localTimestamp, categoryUid: $categoryUid, onlineEventUrl: $onlineEventUrl, prices: $prices, durationMin: $durationMin, timestamp: $timestamp, updatedAt: $updatedAt, ticketsPurchased: $ticketsPurchased, contactEmail: $contactEmail, availableTickets: $availableTickets, viewsCount: $viewsCount, eventType: $eventType, isRepeating: $isRepeating, imageUrls: $imageUrls, name: $name, contactPhone: $contactPhone, ownerUid: $ownerUid, isSponsored: $isSponsored)';
  }

  factory EventApi.fromMap(Map<String, dynamic> data) {
    final List<PriceApi> priceList = (data['prices'] == null)
        ? []
        : (data['prices'] as List<dynamic>)
            .map((e) => PriceApi.fromMap(e as Map<String, dynamic>))
            .toList();

    return EventApi(
      venue: data['venue'] == null
          ? null
          : VenueApi.fromMap(data['venue'] as Map<String, dynamic>),
      archiveReason: data['archiveReason'] as String?,
      durationHour: data['durationHour'] as int?,
      isVerified: data['isVerified'] as bool?,
      ticketsCancelled: data['ticketsCancelled'] as int?,
      isArchived: data['isArchived'] as bool?,
      timezone: data['timezone'] as String?,
      updateReason: data['updateReason'] as String?,
      verifiedAt: data['verifiedAt'] as String?,
      description: data['description'] as String?,
      recurrenceUuid: data['recurrenceUid'] as dynamic,
      recurrence: data['recurrence'] as dynamic,
      recurrenceLabel: data['recurrenceLabel'] as dynamic,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      category: data['category'] == null
          ? null
          : CategoryApi.fromMap(data['category']),
      uid: data['uid'] as String?,
      localTimestamp: data['localTimestamp'] as String?,
      categoryUid: data['categoryUid'] as String?,
      onlineEventUrl: data['onlineEventUrl'] as String?,
      prices: priceList,
      durationMin: data['durationMin'] as int?,
      timestamp: data['timestamp'] as int?,
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      ticketsPurchased: data['ticketsPurchased'] as int?,
      contactEmail: data['contactEmail'] as String?,
      availableTickets: data['availableTickets'] as int?,
      viewsCount: data['viewsCount'] as int?,
      eventType: data['eventType'] as String?,
      isRepeating: data['isRepeating'] as bool?,
      imageUrls: data['imageUrls'] == null
          ? []
          : (data['imageUrls'] as List<dynamic>)
              .map((e) => HashImageApi.fromMap(e as Map<String, dynamic>))
              .toList(),
      name: data['name'] as String?,
      contactPhone: data['contactPhone'] as String?,
      isSponsored: data['isSponsored'] as bool?,
      ownerUid: data['ownerUid'] as String?,
      ownerUserName: data['ownerUsername'] as String?,
      ownerProfileImageUrl: data['ownerImageUrl'] as String?,
      tags: data['tags'] == null
          ? []
          : (data['tags'] as List<dynamic>).map((e) => e.toString()).toList(),
      communityUid: data['communityUid'] as String?,
      attendeesCount: data['attendeesCount'] as int?,
      attendees: data['attendees'] == null
          ? []
          : (data['attendees'] as List<dynamic>)
              .map((e) => AttendeeApi.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
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
        'recurrenceUid': recurrenceUuid, 'recurrence': recurrence,
        'recurrenceLabel': recurrenceLabel,

        'category': category?.toMap(),
        // 'createdAt': createdAt?.toIso8601String(),
        'uid': uid,
        'localTimestamp': localTimestamp,
        'categoryUid': categoryUid,
        'onlineEventUrl': onlineEventUrl,
        'prices': prices?.map((e) => e.toMap()).toList(),
        'durationMin': durationMin,
        'timestamp': timestamp,
        // 'updatedAt': updatedAt?.toIso8601String(),
        'ticketsPurchased': ticketsPurchased,
        'contactEmail': contactEmail,
        'availableTickets': availableTickets,
        'viewsCount': viewsCount,
        'eventType': eventType,
        'isRepeating': isRepeating,
        'imageUrls': imageUrls?.map((e) => e.toMap()).toList(),
        'name': name,
        'contactPhone': contactPhone,
        'ownerUid': ownerUid,
        'isSponsored': isSponsored, 'ownerImageUrl': ownerProfileImageUrl,
        'ownerUsername': ownerUserName,
        'communityUid': communityUid,
        'attendees': attendees?.map((e) => e.toMap()).toList(),
        'attendeesCount': attendeesCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EventApi].
  factory EventApi.fromJson(String data) {
    return EventApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EventApi] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Event mapToDomain() => Event(
      venue: venue?.mapToDomain() ?? const Venue(),
      archiveReason: archiveReason ?? '',
      durationHour: durationHour ?? 0,
      isVerified: isVerified ?? false,
      ticketsCancelled: ticketsCancelled ?? 0,
      isArchived: isArchived ?? false,
      timezone: timezone ?? '',
      updateReason: updateReason ?? '',
      verifiedAt: verifiedAt ?? '',
      description: description ?? '',
      recurrenceUuid: recurrenceUuid ?? '',
      recurrence: recurrence ?? '',
      recurrenceLabel: recurrenceLabel ?? '',
      createdAt: createdAt,
      uid: uid ?? '',
      localTimestamp: localTimestamp ?? '',
      categoryUid: categoryUid ?? '',
      onlineEventUrl: onlineEventUrl ?? '',
      prices: prices?.map((e) => e.mapToDomain()).toList() ?? const [],
      durationMin: durationMin ?? 0,
      timestamp: timestamp ?? 0,
      category: category?.mapToDomain() ?? const Category(),
      updatedAt: updatedAt,
      ticketsPurchased: ticketsPurchased ?? 0,
      contactEmail: contactEmail ?? '',
      availableTickets: availableTickets ?? 0,
      viewsCount: viewsCount ?? 0,
      eventType: EventType.values.firstWhereOrNull(
              (element) => element.name == eventType?.trim()) ??
          EventType.Nan,
      isRepeating: isRepeating ?? false,
      imageUrls: imageUrls?.map((e) => e.mapToDomain()).toList() ?? const [],
      name: name ?? '',
      contactPhone: contactPhone ?? '',
      ownerUid: ownerUid ?? '',
      ownerProfileImageUrl: ownerProfileImageUrl ?? '',
      ownerUserName: ownerUserName ?? '',
      isSponsored: isSponsored ?? false,
      communityUid: communityUid ?? '',
      attendeesCount: attendeesCount ?? 0,
      attendees: attendees?.map((e) => e.mapToDomain()).toList() ?? []);
}
