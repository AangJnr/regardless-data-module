import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'package:regardless_data_module/app/config/extensions.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';

import '../community/community.dart';
import '../price.dart';
import '../venue.dart';
import 'owner.dart';

part 'post.mapper.dart';

@MappableClass()
class Post with PostMappable {
  final String uid;
  final String eventUid;
  final String recurrenceUid;
  final String description;
  final Venue venue;
  final List<HashImage> imageUrls;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isVerified;
  final List<Price> prices;
  final int availableTickets;
  final Owner owner;
  final String localTimestamp;
  final String name;
  final int timestamp;
  final String communityUid;
  final Community? community;
  final int likesCount;
  final int commentsCount;
  const Post(
      {this.uid = '',
      this.eventUid = '',
      this.recurrenceUid = '',
      this.description = '',
      this.venue = const Venue(),
      this.imageUrls = const [],
      this.createdAt,
      this.likesCount = 0,
      this.commentsCount = 0,
      this.updatedAt,
      this.isVerified = false,
      this.prices = const [],
      this.availableTickets = 0,
      this.owner = const Owner(),
      this.localTimestamp = '',
      this.name = '',
      this.timestamp = 0,
      this.communityUid = '',
      this.community});
  @override
  String toString() {
    return 'Post(uid: $uid, eventUid: $eventUid, recurrenceUid: $recurrenceUid, description: $description, venue: $venue, imageUrls: $imageUrls, createdAt: $createdAt, updatedAt: $updatedAt, isVerified: $isVerified, prices: $prices, availableTickets: $availableTickets, owner: $owner, localTimestamp: $localTimestamp, name: $name, timestamp: $timestamp, communityUid: $communityUid)';
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

  String formatMonthDay() {
    try {
      final date = getDate();
      if (date.isToday()) {
        return "Today";
      }

      if (date.isThisWeek()) {
        return 'This Week';
      }
      if (date.isWithinThisMonth()) {
        return 'This Month';
      }

      return DateFormat.MMMM().format(date).toString();
    } catch (e) {
      return '';
    }
  }

  String getLikes() {
    if (likesCount == 0) return '';
    return likesCount.toString();
  }

  String getComments() {
    if (commentsCount == 0) return '';
    return commentsCount.toString();
  }
}
