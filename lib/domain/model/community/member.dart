import 'package:intl/intl.dart';

import '../user.dart';

class Member {
  final String uid;
  final String userName;
  final Profile profile;
  final DateTime? joinedAt;
  final DateTime? requestedAt;
  final DateTime? confirmedAt;

  const Member({
    this.uid = '',
    this.userName = '',
    this.profile = const Profile(),
    this.joinedAt,
    this.requestedAt,this.confirmedAt
  });

  @override
  String toString() {
    return 'Member(uid: $uid, userName: $userName, profile: $profile, joinedAt: $joinedAt)';
  }

  String getDisplayedDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (joinedAt == null) return "";
      return "Joined @ ${DateFormat('MMM dd, yy').format(joinedAt!)}";
    } catch (e) {
      return "--";
    }
  }

  String getConfirmedAtDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (confirmedAt == null) return "";
      return "Confirmed @ ${DateFormat('MMM dd, yy').format(confirmedAt!)}";
    } catch (e) {
      return "--";
    }
  }

  String getRequestedAtDisplayedDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (requestedAt == null) return "";
      return "Requested @ ${DateFormat('MMM dd, yy').format(requestedAt!)}";
    } catch (e) {
      return "--";
    }
  }
}
