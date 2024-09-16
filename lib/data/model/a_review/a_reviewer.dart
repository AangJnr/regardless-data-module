import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/review/reviewer.dart';

class AReviewer implements DomainMapper<Reviewer> {
  final String? userUid;
  final String? name;
  final String? profilePictureUrl;

  const AReviewer({this.userUid, this.name, this.profilePictureUrl});

  @override
  String toString() {
    return 'Reviewer(userId: $userUid, name: $name, profilePictureUrl: $profilePictureUrl)';
  }

  factory AReviewer.fromMap(Map<String, dynamic> data) => AReviewer(
        userUid: data['user_uid'] as String?,
        name: data['name'] as String?,
        profilePictureUrl: data['profile_picture_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user_uid': userUid,
        'name': name,
        'profile_picture_url': profilePictureUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Reviewer].
  factory AReviewer.fromJson(String data) {
    return AReviewer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Reviewer] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Reviewer mapToDomain() {
    return Reviewer(
      userUid: userUid ?? '',
      name: name ?? '',
      profilePictureUrl: profilePictureUrl ?? '',
    );
  }
}
