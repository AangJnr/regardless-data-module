import 'dart:convert';

import '../../domain/domain_mapper.dart';

import '../../../domain/model/category.dart';
import '../../domain/model/feed.dart';
import '../../domain/model/venue.dart';
import 'hash_image.dart';
import 'venue_api.dart';

class FeedApi implements DomainMapper<Feed> {
  final VenueApi? venue;
  final bool? isArchived;
  final String? description;
  final DateTime? createdAt;
  final String? uid;
  final int? timestamp;
  final String? localTimestamp;
  final String? categoryUid;
  final Category? category;
  final DateTime? updatedAt;
  final List<HashImageApi>? imageUrls;
  final String? title;
  final String? ownerUid;
  final bool? isSponsored;
  final String? ownerUserName;
  final String? ownerProfileImageUrl;
  final List<String>? tags;
  final dynamic distance;
  final String? communityUid;
  final bool? isRepeating;
  final String? recurrenceUid;

  const FeedApi(
      {this.title,
      this.isArchived,
      this.description,
      this.timestamp,
      this.createdAt,
      this.uid,
      this.category,
      this.venue,
      this.localTimestamp,
      this.categoryUid,
      this.updatedAt,
      this.imageUrls,
      this.ownerUid,
      this.isSponsored,
      this.ownerProfileImageUrl,
      this.ownerUserName,
      this.distance,
      this.isRepeating,
      this.recurrenceUid,
      this.tags,
      this.communityUid});

  factory FeedApi.fromMap(Map<String, dynamic> data) => FeedApi(
      title: data['name'] as String?,
      timestamp: data['timestamp'] as int?,
      description: data['description'] as String?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      category: data['category'] == null
          ? null
          : CategoryMapper.fromMap((data['category'])),
      venue: data['venue'] == null ? null : VenueApi.fromMap((data['venue'])),
      uid: data['uid'] as String?,
      localTimestamp: data['localTimestamp'] as String?,
      categoryUid: data['categoryUid'] as String?,
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      imageUrls: (data['imageUrls'] as List<dynamic>?)
          ?.map((e) => HashImageApi.fromMap(e as Map<String, dynamic>))
          .toList(),
      ownerUid: data['ownerUid'] as String?,
      ownerUserName: data['ownerUsername'] as String?,
      ownerProfileImageUrl: data['ownerImageUrl'] as String?,
      tags: (data['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      isSponsored: data['isSponsored'] as bool?,
      isRepeating: data['isRepeating'] as bool?,
      recurrenceUid: data['recurrenceUid'] as String?,
      distance: data['distance'] as dynamic,
      communityUid: data['communityUid'] as String?);

  Map<String, dynamic> toMap() => {
        'isArchived': isArchived,
        'description': description,
        'category': [category?.toMap()],
        'uid': uid,
        'timestamp': timestamp,
        'localTimestamp': localTimestamp,
        'categoryUid': categoryUid,
        'imageUrls': imageUrls?.map((e) => e.toMap()).toList(),
        'title': title,
        'ownerUid': ownerUid,
        'isSponsored': isSponsored,
        'ownerImageUrl': ownerProfileImageUrl,
        'ownerUsername': ownerUserName,
        'tags': tags,
        'distance': distance,
        'communityUid': communityUid,
        'recurrenceUid': recurrenceUid,
        'isRepeating': isRepeating,
        'venue': venue?.toMap()
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FeedApi].
  factory FeedApi.fromJson(String data) {
    return FeedApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FeedApi] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Feed mapToDomain() => Feed(
      isArchived: isArchived ?? false,
      description: description ?? '',
      createdAt: createdAt,
      uid: uid ?? '',
      venue: venue?.mapToDomain() ?? const Venue(),
      timestamp: timestamp ?? 0,
      localTimestamp: localTimestamp ?? '',
      categoryUid: categoryUid ?? '',
      category: category ?? const Category(),
      updatedAt: updatedAt,
      imageUrls: imageUrls?.map((e) => e.mapToDomain()).toList() ?? const [],
      title: title ?? '',
      ownerUid: ownerUid ?? '',
      isSponsored: isSponsored ?? false,
      ownerProfileImageUrl: ownerProfileImageUrl ?? '',
      ownerUserName: ownerUserName ?? '',
      isRepeating: isRepeating ?? false,
      recurrenceUid: recurrenceUid ?? '',
      tags: tags ?? [],
      distance: double.tryParse(distance ?? '0.0') ?? 0.0,
      communityUid: communityUid ?? '');
}
