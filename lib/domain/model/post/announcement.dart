import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'package:regardless_data_module/app/config/extensions.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';

import 'owner.dart';

part 'announcement.mapper.dart';

@MappableClass()
class Announcement with AnnouncementMappable {
  final String uid;
  final String description;
  final List<HashImage> imageUrls;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Owner owner;
  final int timestamp;
  final int likesCount;
  final int commentsCount;
  const Announcement({
    this.uid = '',
    this.description = '',
    this.imageUrls = const [],
    this.createdAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.updatedAt,
    this.owner = const Owner(),
    this.timestamp = 0,
  });
  @override
  String toString() {
    return 'Announcement(uid: $uid, description: $description, imageUrls: $imageUrls, createdAt: $createdAt, updatedAt: $updatedAt, owner: $owner, timestamp: $timestamp)';
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
