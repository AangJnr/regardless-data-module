import 'dart:convert';

import 'package:regardless_data_module/domain/domain_mapper.dart';

import '../../../domain/model/community/member.dart';
import '../../../domain/model/user.dart';
import 'user_response/user_response.dart';

class AttendeeApi implements DomainMapper<Member> {
  final String? uid;
  final String? userName;
  final ProfileResponse? profile;
  final DateTime? joinedAt;
  final DateTime? confirmedAt;

  const AttendeeApi({this.uid, this.userName, this.profile, this.joinedAt, this.confirmedAt});

  @override
  String toString() {
    return 'Member(uid: $uid, userName: $userName, profile: $profile, joinedAt: $joinedAt)';
  }

  factory AttendeeApi.fromMap(Map<String, dynamic> data) => AttendeeApi(
        uid: data['uid'] as String?,
        userName: data['userName'] as String?,
        profile: data['profile'] == null
            ? null
            : ProfileResponse.fromMap(data['profile'] as Map<String, dynamic>),
        joinedAt: data['joinedAt'] == null
            ? null
            : DateTime.parse(data['joinedAt'] as String),
             confirmedAt: data['confirmedAt'] == null
            ? null
            : DateTime.parse(data['confirmedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'userName': userName,
        'profile': profile?.toMap(),
        'joinedAt': joinedAt?.toIso8601String(),
            'confirmedAt': confirmedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MemberApi].
  factory AttendeeApi.fromJson(String data) {
    return AttendeeApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MemberApi] to a JSON string.
  String toJson() => json.encode(toMap());

  AttendeeApi copyWith({
    String? uid,
    String? userName,
    ProfileResponse? profile,
    DateTime? joinedAt,    DateTime? confirmedAt,

  }) {
    return AttendeeApi(
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      profile: profile ?? this.profile,
      joinedAt: joinedAt ?? this.joinedAt,      confirmedAt: confirmedAt ?? this.confirmedAt,

    );
  }

  @override
  Member mapToDomain() {
    return Member(
      uid: uid ?? '',
      userName: userName ?? '',
      profile: profile?.mapToDomain() ?? const Profile(),
      joinedAt: joinedAt, confirmedAt:confirmedAt
    );
  }
}
