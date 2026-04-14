import 'package:regardless_data_module/domain/model/venue.dart';

/// User subscription for notifications when new activities match location + categories.
class ActivityAlert {
  final String uid;
  final String profileUid;
  final Venue? venue;
  final num maxDistanceMeters;
  final List<String> categoryUids;
  final DateTime? createdAt;
  final String? summaryLine;
  final String? subText;
  const ActivityAlert(
      {this.uid = '',
      this.profileUid = '',
      this.venue,
      this.subText,
      this.maxDistanceMeters = 50000,
      this.categoryUids = const [],
      this.createdAt,
      this.summaryLine});

  factory ActivityAlert.fromMap(Map<String, dynamic> map) {
    return ActivityAlert(
      uid: map['uid'] as String? ?? '',
      profileUid: map['profileUid'] as String? ?? '',
      summaryLine: map['summaryLine'] as String?,
      subText: map['subText'] as String?,
      maxDistanceMeters: (map['maxDistanceMeters'] as num?) ?? 50000,
      categoryUids: List<String>.from(
        (map['categoryUids'] as List?)?.map((e) => '$e') ?? const [],
      ),
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.tryParse(map['createdAt'] as String),
    );
  }

  /// Request body for POST /user/me/activity-alerts
  Map<String, dynamic> toCreateBody() => {
        'venue': venue?.toMap(),
        'maxDistance': maxDistanceMeters,
        'categoryUids': categoryUids,
      };

  String formatDistance() {
    return 'Within ${(maxDistanceMeters / 1000).toStringAsFixed(0)} km';
  }
}
