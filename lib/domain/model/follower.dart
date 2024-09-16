import '../../data/model/user_follower.dart';

class Follower {
  final String uid;
  final String profileUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userName;

  const Follower({
    this.uid = '',
    this.createdAt,
    this.updatedAt,
    this.profileUrl = '',
    this.userName = '',
  });

  @override
  String toString() {
    return 'Profile(id: $uid, fname:  )';
  }

  FollowerResponse toApi() => FollowerResponse(
      uid: uid,
      profileUrl: profileUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userName: userName);
}
