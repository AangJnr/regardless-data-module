import '../user.dart';
import '../venue.dart';
import 'community_settings.dart';
import 'member.dart';

class Community {
  final String name;
  final String description;
  final String ownerUid;
  final CommunitySettings communitySettings;
  final int membersCount;
  final int commentsCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isArchived;

  final List<String> tags;
  final String uid;
  final int eventsCount;
  final List<Member> members;
  final Venue? venue;
  final AUser organizer;
  const Community(
      {this.name = '',
      this.description = '',
      this.ownerUid = '',
      this.communitySettings = const CommunitySettings(),
      this.membersCount = 0,
      this.createdAt,
      this.updatedAt,
      this.tags = const [],
      this.isArchived = false,
      this.commentsCount = 0,
      this.eventsCount = 0,
      this.uid = '',
       this.members = const [],
      this.organizer = const AUser(),
      this.venue});

  @override
  String toString() {
    return 'CommunityApi(name: $name, description: $description, ownerUid: $ownerUid, communitySettings: $communitySettings)';
  }

  String getMembersCountText() {
    return membersCount == 0
        ? 'No members'
        : membersCount > 9
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
    return  name  ;
  }

  Community copyWith(
      {String? name,
      String? description,
      String? ownerUid,
      CommunitySettings? communitySettings,
      int? membersCount,
      int? commentsCount,
      bool? isArchived,
      List<String>? tags,
      String? uid,
      int? eventsCount,
      List<Member>? members}) {
    return Community(
        name: name ?? this.name,
        description: description ?? this.description,
        ownerUid: ownerUid ?? this.ownerUid,
        communitySettings: communitySettings ?? this.communitySettings,
        membersCount: membersCount ?? this.membersCount,
        commentsCount: commentsCount ?? this.commentsCount,
        tags: tags ?? this.tags,
        isArchived: isArchived ?? this.isArchived,
        uid: uid ?? this.uid,
        eventsCount: eventsCount ?? this.eventsCount,
        members: members ?? this.members);
  }
}
