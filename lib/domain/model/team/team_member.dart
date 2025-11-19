import 'package:dart_mappable/dart_mappable.dart';

part 'team_member.mapper.dart';

@MappableEnum()
enum TeamMemberStatus { active, removed }

@MappableClass()
class TeamMember with TeamMemberMappable {
  final String uid;
  final String? email; // for guest
  final String userName;
  final String fullName; // for guest
  final String? profilePicture;
  final String role; // player | manager | owner
  final DateTime? joinedAt;
  final TeamMemberStatus status; // active | removed
  const TeamMember({
    this.uid = '',
    this.email,
    this.userName = '',
    this.profilePicture,
    this.role = 'player',
    this.fullName = '',
    this.joinedAt,
    this.status = TeamMemberStatus.active,
  });
}
