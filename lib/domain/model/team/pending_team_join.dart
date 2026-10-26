import 'dart:convert';

class PendingTeamJoin {
  final String ownerUid;
  final String teamUid;
  final String? linkUid;

  const PendingTeamJoin({this.ownerUid = '', this.teamUid = '', this.linkUid});

  const PendingTeamJoin.byLink(this.linkUid) : ownerUid = '', teamUid = '';

  String toJson() => jsonEncode({
    'ownerUid': ownerUid,
    'teamUid': teamUid,
    'linkUid': linkUid,
  });

  @override
  String toString() => toJson();

  static PendingTeamJoin? fromJson(dynamic json) {
    if (json == null) return null;
    try {
      final map = json is String ? jsonDecode(json) : json;
      final ownerUid = map['ownerUid'] as String?;
      final teamUid = map['teamUid'] as String?;
      final linkUid = map['linkUid'] as String?;
      if (linkUid != null && linkUid.isNotEmpty) {
        return PendingTeamJoin.byLink(linkUid);
      }
      if (ownerUid == null ||
          ownerUid.isEmpty ||
          teamUid == null ||
          teamUid.isEmpty) {
        return null;
      }
      return PendingTeamJoin(ownerUid: ownerUid, teamUid: teamUid);
    } catch (_) {
      return null;
    }
  }
}
