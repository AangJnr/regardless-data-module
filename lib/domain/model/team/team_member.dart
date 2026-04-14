import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:regardless_data_module/domain/model/team/team_invite.dart';
import 'package:regardless_data_module/extensions/extensions.dart';
 
part 'team_member.mapper.dart';

@MappableEnum()
enum TeamMemberStatus { active, removed }

@MappableClass()
class TeamMember with TeamMemberMappable {
  final String uid;
  final String? email; // for guest
  final String userName;
  final String fullName; // for guest
  final TeamRole role; // player | manager | owner
  final List<String> permissions; // NEW: ["manage_schedule:view", ...]
  final DateTime? joinedAt;
  final TeamMemberStatus status; // active | removed
  const TeamMember({
    this.uid = '',
    this.email,
    this.userName = '',
    this.role = TeamRole.player,
    this.permissions = const [],
    this.fullName = '',
    this.joinedAt,
    this.status = TeamMemberStatus.active,
  });

  String get profilePicture => uid.profileUidToProfileUrl;

  String dateAdded() {
    try {
      if (joinedAt == null) return '';
      return DateFormat('dd/MM/yy').format(joinedAt!);
    } catch (e) {
      return '$joinedAt';
    }
  }
}
