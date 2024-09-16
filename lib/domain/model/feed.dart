import 'package:intl/intl.dart';
import '../../data/model/feed_api.dart';
import '../../domain/domain_mapper.dart';

import 'category.dart';
import 'event.dart';
import 'hash_image.dart';
import 'price.dart';
import 'venue.dart';

class Feed implements DataMapper<FeedApi> {
  final String address;
  final bool isArchived;
  final String description;
  final DateTime? createdAt;
  final String uid;
  final String localTimestamp;
  final String categoryUid;
  final Category category;
  final DateTime? updatedAt;
  final List<HashImage> imageUrls;
  final String title;
  final String ownerUid;
  final bool isSponsored;
  final String ownerUserName;
  final String ownerProfileImageUrl;
  final List<String> tags;
  final int timestamp;
  final double distance;
  final String communityUid;
  final bool isFromFeed;
  final String recurrenceUid;
  final bool isRepeating;
  const Feed(
      {this.address = '',
      this.description = '',
      this.createdAt,
      this.uid = '',
      this.isArchived = false,
      this.title = '',
      this.timestamp = 0,
      this.category = const Category(),
      this.localTimestamp = '',
      this.categoryUid = '',
      this.updatedAt,
      this.imageUrls = const [],
      this.tags = const [],
      this.ownerUid = '',
      this.ownerUserName = '',
      this.ownerProfileImageUrl = '',
      this.isSponsored = false,
      this.communityUid = '',
      this.recurrenceUid = '',
      this.isRepeating = false,
      this.distance = 0.0,
      this.isFromFeed = true});

  HashImage getImage() => imageUrls.firstOrNull ?? const HashImage();

  Feed copyWith(
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
      bool? isRepeating,
      List<HashImage>? imageUrls,
      String? contactPhone,
      String? ownerUid,
      String? ownerName,
      String? address,
      String? title,
      String? ownerProfilePhotoUrl,
      bool? isSponsored,
      Price? selectedPrice,
      List<String>? tags,
      String? communityUid,
      bool? isFromFeed}) {
    return Feed(
        isArchived: isArchived ?? this.isArchived,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        uid: uid ?? this.uid,
        localTimestamp: localTimestamp ?? this.localTimestamp,
        timestamp: timestamp ?? this.timestamp,
        categoryUid: categoryUid ?? this.categoryUid,
        updatedAt: updatedAt ?? this.updatedAt,
        imageUrls: imageUrls ?? this.imageUrls,
        address: title ?? this.address,
        title: title ?? this.title,
        ownerUid: ownerUid ?? this.ownerUid,
        isSponsored: isSponsored ?? this.isSponsored,
        tags: tags ?? this.tags,
        isRepeating: isRepeating ?? this.isRepeating,
        recurrenceUid: recurrenceUuid ?? recurrenceUid,
        communityUid: communityUid ?? this.communityUid,
        isFromFeed: isFromFeed ?? this.isFromFeed);
  }

  String formatDistance() {
    if (distance >= 1000) {
      return '${(distance / 1000).toStringAsFixed(1)}K km';
    } else {
      return '${distance.toStringAsFixed(2)} km';
    }
  }

  String getCategoryName() => category.name;

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
      //'Mar 25 • 4:30pm'
      return DateFormat('MMM dd • h:mm a').format(getDate());
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

  @override
  FeedApi mapToApi() => FeedApi(
      isArchived: isArchived,
      description: description,
      createdAt: createdAt,
      uid: uid,
      timestamp: timestamp,
      localTimestamp: localTimestamp,
      categoryUid: categoryUid,
      category: category.mapToApi(),
      updatedAt: updatedAt,
      imageUrls: imageUrls.map((e) => e.mapToApi()).toList(),
      title: title,
      ownerUid: ownerUid,
      isSponsored: isSponsored,
      tags: tags,
      ownerUserName: ownerUserName,
      ownerProfileImageUrl: ownerProfileImageUrl,
      distance: distance,
      communityUid: communityUid,
      isRepeating: isRepeating,
      recurrenceUid: recurrenceUid);

  factory Feed.fromEventItem(Event feed) {
    return Feed(
        isArchived: feed.isArchived,
        description: feed.description,
        createdAt: feed.createdAt,
        uid: feed.uid,
        localTimestamp: feed.localTimestamp,
        categoryUid: feed.categoryUid,
        category: feed.category,
        updatedAt: feed.updatedAt,
        imageUrls: feed.imageUrls,
        title: feed.name,
        ownerUid: feed.ownerUid,
        ownerUserName: feed.ownerUserName,
        ownerProfileImageUrl: feed.ownerProfileImageUrl,
        timestamp: feed.timestamp,
        distance: feed.distance,
        communityUid: feed.communityUid,
        isFromFeed: feed.isFromFeed,
        isRepeating: feed.isRepeating,
        recurrenceUid: feed.recurrenceUuid);
  }
}
