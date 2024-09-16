import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/user.dart';
import '../../domain/model/follower.dart';

class FollowerResponse implements DomainMapper<Follower> {
  final String? uid;
  final String? profileUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userName;

  const FollowerResponse(
      {this.uid,
      this.createdAt,
      this.updatedAt,
      this.profileUrl,
      this.userName});

  @override
  String toString() {
    return 'Profile(id: $uid, fname:  )';
  }

  factory FollowerResponse.fromMap(Map<String, dynamic> data) =>
      FollowerResponse(
        uid: data['uid'] as String?,
        profileUrl: data['profileUrl'] as String?,
        userName: data['userName'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'userName': userName,
        'profileUrl': profileUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory FollowerResponse.fromJson(String data) {
    return FollowerResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Follower mapToDomain() => Follower(
      uid: uid ?? '',
      profileUrl: profileUrl ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
      userName: userName ?? "");
}
