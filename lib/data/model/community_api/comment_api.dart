import 'dart:convert';

import 'package:regardless_data_module/domain/domain_mapper.dart';

import '../../../domain/model/community/comment.dart';

class CommentApi implements DomainMapper<Comment> {
  final String? userUid;
  final String? userName;
  final String? comment;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CommentApi({
    this.userUid,
    this.userName,
    this.comment,
    this.uid,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'CommentApi(userUid: $userUid, userName: $userName, comment: $comment, uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory CommentApi.fromMap(Map<String, dynamic> data) => CommentApi(
        userUid: data['userUid'] as String?,
        userName: data['userName'] as String?,
        comment: data['comment'] as String?,
        uid: data['uid'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'userUid': userUid,
        'userName': userName,
        'comment': comment,
        // 'uid': uid,
        // 'createdAt': createdAt?.toIso8601String(),
        // 'updatedAt': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommentApi].
  factory CommentApi.fromJson(String data) {
    return CommentApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommentApi] to a JSON string.
  String toJson() => json.encode(toMap());

  CommentApi copyWith({
    String? userUid,
    String? userName,
    String? comment,
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommentApi(
      userUid: userUid ?? this.userUid,
      userName: userName ?? this.userName,
      comment: comment ?? this.comment,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Comment mapToDomain() {
    return Comment(
      userUid: userUid ?? '',
      userName: userName ?? '',
      comment: comment ?? '',
      uid: uid ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
