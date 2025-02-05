import 'dart:convert';

import 'package:regardless_data_module/domain/domain_mapper.dart';
import 'package:regardless_data_module/domain/model/community/community_settings.dart';

import '../../../domain/model/community/community.dart';
import '../../../domain/model/user.dart';
import '../user_response/user_response.dart';
import '../venue_api.dart';
import 'community_settings_api.dart';
import 'member_api.dart';

class CommunityApi implements DomainMapper<Community> {
  final String? name;
  final String? description;
  final String? ownerUid;
  final CommunitySettingsApi? communitySettings;
  final int? membersCount;
  final int? commentsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isArchived;
  final List<String>? tags;
  final String? uid;
  final int? eventsCount;
  final List<MemberApi>? members;
  final VenueApi? venue;
  final UserResponse? organizer;
  final double? distance;
  const CommunityApi(
      {this.name,
      this.description,
      this.ownerUid,
      this.communitySettings,
      this.membersCount,
      this.createdAt,
      this.updatedAt,
      this.isArchived,
      this.tags,
      this.members,
      this.commentsCount,this.distance,
      this.eventsCount,
      this.venue,
      this.organizer,
      this.uid});

  @override
  String toString() {
    return 'CommunityApi(name: $name, description: $description, ownerUid: $ownerUid, communitySettings: $communitySettings)';
  }

  factory CommunityApi.fromMap(Map<String, dynamic> data) => CommunityApi(
      name: data['name'] as String?,
      description: data['description'] as String?,
      ownerUid: data['ownerUid'] as String?,
      membersCount: data['membersCount'] as int?,
      commentsCount: data['commentsCount'] as int?,
      eventsCount: data['eventsCount'] as int?,
      uid: data['uid'] as String?,
      distance:double.tryParse(data['distance'] ?? '0.0') ,
      communitySettings: data['communitySettings'] == null
          ? null
          : CommunitySettingsApi.fromMap(
              data['communitySettings'] as Map<String, dynamic>),
      members: data['members'] == null
          ? null
          : (data['members'] as List<dynamic>)
              .map((e) => MemberApi.fromMap(e as Map<String, dynamic>))
              .toList(),
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      tags: data['tags'] == null
          ? []
          : (data['tags'] as List<dynamic>).map((e) => e.toString()).toList(),
      isArchived: data['isArchived'] as bool?,
      venue: data['venue'] == null ? null : VenueApi.fromMap(data['venue']),
      organizer: data['organizer'] == null
          ? null
          : UserResponse.fromMap(data['organizer']));

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'description': description,
        'ownerUid': ownerUid,
        'communitySettings': communitySettings?.toMap(),
        //'membersCount': membersCount,
        //'commentsCount': commentsCount,
        //'isArchived': isArchived,
        'tags': tags,
        'venue': venue?.toMap(),
        'organizer': organizer?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommunityApi].
  factory CommunityApi.fromJson(String data) {
    return CommunityApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommunityApi] to a JSON string.
  String toJson() => json.encode(toMap());

  CommunityApi copyWith(
      {String? name,
      String? description,
      String? ownerUid,
      CommunitySettingsApi? communitySettings,
      int? membersCount,
      int? commentsCount,double? distance,
      List<String>? tags}) {
    return CommunityApi(
        name: name ?? this.name,
        description: description ?? this.description,
        ownerUid: ownerUid ?? this.ownerUid,
        communitySettings: communitySettings ?? this.communitySettings,
        membersCount: membersCount ?? this.membersCount,
        commentsCount: commentsCount ?? this.commentsCount,
        distance: distance ?? this.distance ,
        tags: tags ?? this.tags);
  }

  @override
  Community mapToDomain() {
    return Community(
        uid: uid ?? '',
        eventsCount: eventsCount ?? 0,
        name: name ?? 'No name',
        description: description ?? '',
        ownerUid: ownerUid ?? '',
        communitySettings:
            communitySettings?.mapToDomain() ?? const CommunitySettings(),
        membersCount: membersCount ?? 0,
        commentsCount: commentsCount ?? 0,
        createdAt: createdAt,
        updatedAt: updatedAt,distance: distance ?? 0.0,
        tags: tags ?? const [],
        isArchived: isArchived ?? false,
        venue: venue?.mapToDomain(),
        organizer: organizer?.mapToDomain() ?? const AUser(),
        members: members?.map((e) => e.mapToDomain()).toList() ?? const []);
  }
}
