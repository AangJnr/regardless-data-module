import 'dart:convert';

import 'package:regardless_data_module/domain/domain_mapper.dart';

import '../../../domain/model/community/member.dart';
import '../../../domain/model/user.dart';
import '../user_response/user_response.dart';

class MemberApi implements DomainMapper<Member> {
  final String? uid;
  final String? userName;
  final ProfileResponse? profile;
  final DateTime? joinedAt;
  final DateTime? requestedAt;
  final DateTime? confirmedAt;

  const MemberApi(
      {this.uid,
      this.userName,
      this.profile,
      this.joinedAt,
      this.requestedAt,
      this.confirmedAt});

  @override
  String toString() {
    return 'Member(uid: $uid, userName: $userName, profile: $profile, joinedAt: $joinedAt)';
  }

  factory MemberApi.fromMap(Map<String, dynamic> data) => MemberApi(
        uid: data['uid'] as String?,
        userName: data['userName'] as String?,
        profile: data['profile'] == null
            ? null
            : ProfileResponse.fromMap(data['profile'] as Map<String, dynamic>),
        joinedAt: data['joinedAt'] == null
            ? null
            : DateTime.parse(data['joinedAt'] as String),
        requestedAt: data['requestedAt'] == null
            ? null
            : DateTime.parse(data['requestedAt'] as String),
        confirmedAt: data['confirmedAt'] == null
            ? null
            : DateTime.parse(data['confirmedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'userName': userName,
        'profile': profile?.toMap(),
        'joinedAt': joinedAt?.toIso8601String(),
        'requestedAt': requestedAt?.toIso8601String(),
        'confirmedAt': confirmedAt?.toIso8601String()
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MemberApi].
  factory MemberApi.fromJson(String data) {
    return MemberApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MemberApi] to a JSON string.
  String toJson() => json.encode(toMap());

  MemberApi copyWith({
    String? uid,
    String? userName,
    ProfileResponse? profile,
    DateTime? joinedAt,
    DateTime? requestedAt,
    DateTime? confirmedAt,
  }) {
    return MemberApi(
        uid: uid ?? this.uid,
        userName: userName ?? this.userName,
        profile: profile ?? this.profile,
        joinedAt: joinedAt ?? this.joinedAt,
        requestedAt: requestedAt ?? this.requestedAt,
        confirmedAt: confirmedAt ?? this.confirmedAt);
  }

  @override
  Member mapToDomain() {
    return Member(
        uid: uid ?? '',
        userName: userName ?? '',
        profile: profile?.mapToDomain() ?? const Profile(),
        joinedAt: joinedAt,
        requestedAt: requestedAt,
        confirmedAt: confirmedAt);
  }
}
