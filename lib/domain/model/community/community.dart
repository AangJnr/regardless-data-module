import 'package:dart_mappable/dart_mappable.dart';

import '../hash_image.dart';
import '../user.dart';
import '../venue.dart';
import 'community_settings.dart';
import 'member.dart';

part 'community.mapper.dart';

@MappableClass()
class Community with CommunityMappable {
  final String name;
  final String description;
  final String ownerUid;
  final CommunitySettings communitySettings;
  final int membersCount;
  final int commentsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isArchived;
  final double distance;
  final List<String> tags;
  final String uid;
  final int eventsCount;
  final List<Member> members;
  final Venue? venue;
  final AUser organizer;
  final List<HashImage> imageUrls;
  final List<String>? imageBase64Data;
  final DateTime? joinedAt;

  const Community(
      {this.name = '',
      this.description = '',
      this.ownerUid = '',
      this.communitySettings = const CommunitySettings(),
      this.membersCount = 0,
      this.createdAt,
      this.updatedAt,
      this.joinedAt,
      this.tags = const [],
      this.imageUrls = const [],
      this.isArchived = false,
      this.commentsCount = 0,
      this.eventsCount = 0,
      this.uid = '',
      this.distance = 0.0,
      this.members = const [],
      this.organizer = const AUser(),
      this.venue,
      this.imageBase64Data});

  @override
  String toString() {
    return 'CommunityApi( uid: $uid, name: $name, description: $description, ownerUid: $ownerUid, communitySettings: $communitySettings)';
  }

  String getMembersCountText() {
    return membersCount == 0
        ? 'No members'
        : membersCount > 1
            ? "$membersCount members"
            : "$membersCount member";
  }

  String eventsCountText() {
    return eventsCount == 0
        ? ''
        : eventsCount > 9
            ? "• $eventsCount events"
            : "• $eventsCount event";
  }

  String getName() {
    return name;
  }
}
