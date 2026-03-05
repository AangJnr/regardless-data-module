import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:regardless_data_module/domain/model/team/team_invite.dart';
import '../collaborator/collaborator_role.dart';

part 'collaborator_invite.mapper.dart';

@MappableClass()
class CollaboratorInvite with CollaboratorInviteMappable {
  final String uid;
  final String email;
  final String name;
  final String userName;
  final CollaboratorRole collaboratorRole; // NEW: Admin | Manager | Staff
  final List<String> permissions; // NEW: ["manage_schedule:view", ...]
  final String invitedByUid;
  final DateTime? invitedAt;
  final InviteStatus status; // pending | accepted | completed | expired
  const CollaboratorInvite({
    this.uid = '',
    this.email = '',
    this.userName = '',
    this.name = 'Team Name',
    this.collaboratorRole = CollaboratorRole.staff,
    this.permissions = const [],
    this.invitedByUid = '',
    this.invitedAt,
    this.status = InviteStatus.pending,
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
