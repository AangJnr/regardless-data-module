class Comment {
  final String userUid;
  final String userName;
  final String comment;
  final String uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Comment({
    this.userUid = '',
    this.userName = '',
    this.comment = '',
    this.uid = '',
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'CommentApi(userUid: $userUid, userName: $userName, comment: $comment, uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
