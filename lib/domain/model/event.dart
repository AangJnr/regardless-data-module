// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:regardless_data_module/data/model/attendee_api.dart';
import 'package:regardless_data_module/domain/model/community/member.dart';

import '../../data/model/event_api.dart';
import '../domain_mapper.dart';
import 'category.dart';
import 'feed.dart';
import 'hash_image.dart';
import 'price.dart';
import 'venue.dart';

enum EventType { InPerson, Online, Nan }

class Event implements DataMapper<EventApi> {
  final Venue venue;
  final String archiveReason;
  final int durationHour;
  final bool isVerified;
  final int ticketsCancelled;
  final bool isArchived;
  final String timezone;
  final String updateReason;
  final String recurrenceLabel;
  final String verifiedAt;
  final String description;
  final String recurrenceUuid;
  final String recurrence;
  final DateTime? createdAt;
  final String uid;
  final Category category;
  final String localTimestamp;
  final String categoryUid;
  final String onlineEventUrl;
  final List<Price> prices;
  final int durationMin;
  final int timestamp;
  final DateTime? updatedAt;
  final int ticketsPurchased;
  final String contactEmail;
  final int availableTickets;
  final int viewsCount;
  final EventType eventType;
  final bool isRepeating;
  final List<HashImage> imageUrls;
  final String name;
  final String contactPhone;
  final String ownerUid;
  final bool isSponsored;
  final Price? selectedPrice;
  final String ownerUserName;
  final String ownerProfileImageUrl;
  final double distance;
  final String communityUid;
  final List<Member> attendees;
  final int attendeesCount;
  final bool isFromFeed;
  const Event(
      {this.venue = const Venue(),
      this.archiveReason = '',
      this.durationHour = 0,
      this.isVerified = false,
      this.ticketsCancelled = 0,
      this.isArchived = false,
      this.timezone = '',
      this.updateReason = '',
      this.verifiedAt = '',
      this.description = '',
      this.recurrenceUuid = '',
      this.recurrenceLabel = '',
      this.recurrence = '',
      this.createdAt,
      this.uid = '',
      this.category = const Category(),
      this.localTimestamp = '',
      this.categoryUid = '',
      this.onlineEventUrl = '',
      this.prices = const [],
      this.durationMin = 0,
      this.timestamp = 0,
      this.updatedAt,
      this.ticketsPurchased = 0,
      this.contactEmail = '',
      this.availableTickets = 0,
      this.viewsCount = 0,
      this.eventType = EventType.InPerson,
      this.isRepeating = false,
      this.imageUrls = const [],
      this.name = '',
      this.contactPhone = '',
      this.ownerUid = '',
      this.selectedPrice,
      this.ownerUserName = '',
      this.ownerProfileImageUrl = '',
      this.isSponsored = false,
      this.communityUid = '',
      this.distance = 0.0,
      this.attendees = const [],
      this.attendeesCount = 0,
      this.isFromFeed = false});

  @override
  String toString() {
    return 'EventApi(venue: $venue, archiveReason: $archiveReason, durationHour: $durationHour, isVerified: $isVerified, ticketsCancelled: $ticketsCancelled, isArchived: $isArchived, timezone: $timezone, updateReason: $updateReason, verifiedAt: $verifiedAt, description: $description, recurrenceUuid: $recurrenceUuid, createdAt: $createdAt, uid: $uid, localTimestamp: $localTimestamp, categoryUid: $categoryUid, onlineEventUrl: $onlineEventUrl, prices: $prices, durationMin: $durationMin, timestamp: $timestamp, updatedAt: $updatedAt, ticketsPurchased: $ticketsPurchased, contactEmail: $contactEmail, availableTickets: $availableTickets, viewsCount: $viewsCount, eventType: $eventType, isRepeating: $isRepeating, imageUrls: $imageUrls, name: $name, contactPhone: $contactPhone, ownerUid: $ownerUid, isSponsored: $isSponsored)';
  }

  HashImage getImage() => imageUrls.firstOrNull ?? const HashImage();

  String getRecurrenceLabel() {
    if (recurrenceLabel.isEmpty) return 'This is a repeating event.';
    return 'Repeats $recurrenceLabel';
  }

  Event copyWith(
      {Venue? venue,
      String? archiveReason,
      int? durationHour,
      bool? isVerified,
      int? ticketsCancelled,
      bool? isArchived,
      String? timezone,
      String? updateReason,
      String? verifiedAt,
      String? description,
      String? recurrenceUuid,
      DateTime? createdAt,
      String? uid,
      String? localTimestamp,
      String? categoryUid,
      String? onlineEventUrl,
      List<Price>? prices,
      int? durationMin,
      int? timestamp,
      DateTime? updatedAt,
      int? ticketsPurchased,
      String? contactEmail,
      int? availableTickets,
      int? viewsCount,
      EventType? eventType,
      bool? isRepeating,
      List<HashImage>? imageUrls,
      String? name,
      String? contactPhone,
      String? ownerUid,
      bool? isSponsored,
      Price? selectedPrice,
      String? communityUid,
      String? recurrence,
      String? recurrenceLabel,
      bool? isFromFeed}) {
    return Event(
        venue: venue ?? this.venue,
        archiveReason: archiveReason ?? this.archiveReason,
        durationHour: durationHour ?? this.durationHour,
        isVerified: isVerified ?? this.isVerified,
        ticketsCancelled: ticketsCancelled ?? this.ticketsCancelled,
        isArchived: isArchived ?? this.isArchived,
        timezone: timezone ?? this.timezone,
        updateReason: updateReason ?? this.updateReason,
        verifiedAt: verifiedAt ?? this.verifiedAt,
        description: description ?? this.description,
        recurrenceUuid: recurrenceUuid ?? this.recurrenceUuid,
        recurrence: recurrence ?? this.recurrence,
        recurrenceLabel: recurrenceLabel ?? this.recurrenceLabel,
        createdAt: createdAt ?? this.createdAt,
        uid: uid ?? this.uid,
        localTimestamp: localTimestamp ?? this.localTimestamp,
        categoryUid: categoryUid ?? this.categoryUid,
        onlineEventUrl: onlineEventUrl ?? this.onlineEventUrl,
        prices: prices ?? this.prices,
        durationMin: durationMin ?? this.durationMin,
        timestamp: timestamp ?? this.timestamp,
        updatedAt: updatedAt ?? this.updatedAt,
        ticketsPurchased: ticketsPurchased ?? this.ticketsPurchased,
        contactEmail: contactEmail ?? this.contactEmail,
        availableTickets: availableTickets ?? this.availableTickets,
        viewsCount: viewsCount ?? this.viewsCount,
        eventType: eventType ?? this.eventType,
        isRepeating: isRepeating ?? this.isRepeating,
        imageUrls: imageUrls ?? this.imageUrls,
        name: name ?? this.name,
        contactPhone: contactPhone ?? this.contactPhone,
        ownerUid: ownerUid ?? this.ownerUid,
        isSponsored: isSponsored ?? this.isSponsored,
        selectedPrice: selectedPrice ?? this.selectedPrice,
        communityUid: communityUid ?? this.communityUid,
        isFromFeed: isFromFeed ?? this.isFromFeed);
  }

  String getCategoryName() => category.name.isNotEmpty ? category.name : 'N/a';

  String getDisplayedDate({bool showFullDate = false}) {
    final dateFormat = DateFormat("dd-mm-yyyy");
    try {
      if (dateFormat.format(DateTime.now()) == dateFormat.format(getDate())) {
        return "Today";
      }
      if (showFullDate) {
        return DateFormat('MMM dd, yyyy').format(getDate());
      }
      return DateFormat('d MMM, yy').format(getDate());
    } catch (e) {
      return "--";
    }
  }

  String getDisplayedDateTime() {
    try {
      return DateFormat('MMM dd, yyyy • h:mm a').format(getDate());
    } catch (e) {
      return "--";
    }
  }

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  String formatOnlyTime() {
    try {
      return DateFormat('h:mm a').format(getDate());
    } catch (e) {
      return "--";
    }
  }

  bool isInThePast() {
    return isArchived || getDate().isBefore(DateTime.now());
  }

  int getRemainingTickets() => availableTickets - attendeesCount;

  String formatDistance() {
    if (distance >= 1000) {
      return '${(distance / 1000).toStringAsFixed(0)}K km';
    } else {
      return '${distance.toStringAsFixed(0)} km';
    }
  }

  String getAddress() => venue.getAddress();

  @override
  EventApi mapToApi() => EventApi(
      venue: venue.mapToApi(),
      archiveReason: archiveReason,
      durationHour: durationHour,
      isVerified: isVerified,
      ticketsCancelled: ticketsCancelled,
      isArchived: isArchived,
      timezone: timezone,
      updateReason: updateReason,
      verifiedAt: verifiedAt,
      description: description,
      recurrenceUuid: recurrenceUuid,
      recurrence: recurrence,
      createdAt: createdAt,
      uid: uid,
      recurrenceLabel: recurrenceLabel,
      localTimestamp: localTimestamp,
      categoryUid: categoryUid,
      onlineEventUrl: onlineEventUrl,
      prices: prices.map((e) => e.mapToApi()).toList(),
      durationMin: durationMin,
      timestamp: timestamp,
      category: category.mapToApi(),
      updatedAt: updatedAt,
      ticketsPurchased: ticketsPurchased,
      contactEmail: contactEmail,
      availableTickets: availableTickets,
      viewsCount: viewsCount,
      eventType: eventType.name,
      isRepeating: isRepeating,
      imageUrls: imageUrls.map((e) => e.mapToApi()).toList(),
      name: name,
      contactPhone: contactPhone,
      ownerUid: ownerUid,
      isSponsored: isSponsored,
      ownerUserName: ownerUserName,
      ownerProfileImageUrl: ownerProfileImageUrl,
      communityUid: communityUid,
      attendees: attendees
          .map((e) => AttendeeApi(
              uid: e.uid, profile: e.profile.mapToApi(), userName: e.userName))
          .toList(),
      attendeesCount: attendeesCount);

  factory Event.fromFeedItem(Feed feed) {
    return Event(
        venue: Venue(address: feed.address),
        isArchived: feed.isArchived,
        timezone: '',
        description: feed.description,
        createdAt: feed.createdAt,
        uid: feed.uid,
        localTimestamp: feed.localTimestamp,
        categoryUid: feed.categoryUid,
        category: feed.category,
        updatedAt: feed.updatedAt,
        imageUrls: feed.imageUrls,
        name: feed.title,
        ownerUid: feed.ownerUid,
        ownerUserName: feed.ownerUserName,
        ownerProfileImageUrl: feed.ownerProfileImageUrl,
        timestamp: feed.timestamp,
        distance: feed.distance,
        communityUid: feed.communityUid,
        isFromFeed: feed.isFromFeed,
        isRepeating: feed.isRepeating,
        recurrenceUuid: feed.recurrenceUid);
  }
}
