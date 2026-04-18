import 'dart:convert';

class PendingInvite {
  final String token;
  final String teamUid;
  PendingInvite({required this.token, required this.teamUid});

  String toJson() {
    return jsonEncode({'token': token, 'teamUid': teamUid});
  }

  @override
  String toString() {
    return toJson();
  }

  static PendingInvite? fromJson(dynamic json) {
    if (json == null) return null;
    try {
      final map = json is String ? jsonDecode(json) : json;
      return PendingInvite(
        token: map['token'],
        teamUid: map['teamUid'],
      );
    } catch (e) {
      print(e);
      return null;
    }
  }
}
