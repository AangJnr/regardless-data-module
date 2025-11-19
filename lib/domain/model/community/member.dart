import 'package:intl/intl.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/user.dart';

part 'member.mapper.dart';

@MappableClass()
class Member with MemberMappable {
  final String uid;
  final String userName;
  final AUser profile;
  final DateTime? joinedAt;
  final DateTime? requestedAt;
  final DateTime? confirmedAt;

  const Member(
      {this.uid = '',
      this.userName = '',
      this.profile = const AUser(),
      this.joinedAt,
      this.requestedAt,
      this.confirmedAt});

  @override
  String toString() {
    return 'Member(uid: $uid, userName: $userName, profile: $profile, joinedAt: $joinedAt)';
  }

  String getDisplayedDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (joinedAt == null) return "";
      return "Joined @ ${DateFormat('MMM dd yy • h:mm').format(joinedAt!)}";
    } catch (e) {
      return "--";
    }
  }

  String getConfirmedAtDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (confirmedAt == null) return "";
      return "Confirmed @ ${DateFormat('MMM dd yy • h:mm').format(confirmedAt!)}";
    } catch (e) {
      return "--";
    }
  }

  String getRequestedAtDisplayedDateTime() {
    try {
      //'Mar 25 • 4:30pm'
      if (requestedAt == null) return "";
      return "Requested @ ${DateFormat('MMM dd yy • h:mm').format(requestedAt!)}";
    } catch (e) {
      return "--";
    }
  }
}
