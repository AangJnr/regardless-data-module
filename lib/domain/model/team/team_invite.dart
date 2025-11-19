import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart' show DateFormat;

part 'team_invite.mapper.dart';

@MappableEnum()
enum TeamRole { player, manager, coach, owner }

@MappableEnum()
enum TeamInviteStatus { pending, accepted, completed, expired }

@MappableClass()
class TeamInvite with TeamInviteMappable {
  final String uid;
  final String email;
  final String name;
  final String userName;
  final TeamRole role; // player | manager
  final String invitedByUid;
  final DateTime? invitedAt;
  final TeamInviteStatus status; // pending | accepted | completed | expired
  const TeamInvite({
    this.uid = '',
    this.email = '',
    this.userName = '',
    this.name = 'Team Name',
    this.role = TeamRole.player,
    this.invitedByUid = '',
    this.invitedAt,
    this.status = TeamInviteStatus.pending,
  });

  String getInvitedAt() {
    try {
      //'Mar 25 • 4:30pm'
      if (invitedAt == null) return "";
      return "Invited @ ${DateFormat('MMM dd yy • h:mm').format(invitedAt!)}";
    } catch (e) {
      return "--";
    }
  }
}
