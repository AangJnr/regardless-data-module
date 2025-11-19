import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'category.dart';
import 'event.dart';
import 'hash_image.dart';
import 'venue.dart';

part 'feed.mapper.dart';

@MappableClass()
class Feed with FeedMappable {
  final Venue venue;
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
      {this.venue = const Venue(),
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
        recurrenceUid: feed.recurrenceUid);
  }
}
