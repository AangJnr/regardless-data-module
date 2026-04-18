 import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/team/team_invite.dart';

class InviteAndTeam {
  final TeamInvite invite;
  final Team team;

  InviteAndTeam({required this.invite, required this.team});


  factory InviteAndTeam.fromMap(Map<String, dynamic> map) {
    return InviteAndTeam(
      invite: TeamInviteMapper.fromMap(map['invite']),
      team: TeamMapper.fromMap(map['team']),
    );
  }
}