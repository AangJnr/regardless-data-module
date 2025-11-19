import 'package:dart_mappable/dart_mappable.dart';

import 'category.dart';

part 'user.mapper.dart';

@MappableEnum()
// ignore: constant_identifier_names
enum Gender {
  Male,
  Female,
  NonBinary,
  Unsure,
  RatherNotSay,
}

@MappableClass()
class AUser with AUserMappable {
  final String uid;
  final String authUid;
  final String email;
  final String fullName;
  final String phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Gender gender;
  final bool isProvider;
  final String picture;
  final String bio;
  final String categoryUid;
  final Category? category;
  final int unreadNotificationCount;
  final double rating;
  final int reviewsCount;
  final bool isVerified;
  final List<String> favoratesUids;
  final List<String> likedPostUids;
  final List<String> joinedCommunityUids;
  final bool userNameAlreadyUpdated;
  final String userName;

  const AUser({
    this.uid = '',
    this.email = '',
    this.fullName = '',
    this.phone = '',
    this.createdAt,
    this.updatedAt,
    this.isProvider = false,
    this.gender = Gender.Unsure,
    this.picture = '',
    this.bio = '',
    this.userName = '',
    this.authUid = '',
    this.isVerified = false,
    this.categoryUid = '',
    this.userNameAlreadyUpdated = false,
    this.category,
    this.unreadNotificationCount = 0,
    this.reviewsCount = 0,
    this.rating = 5.0,
    this.likedPostUids = const [],
    this.favoratesUids = const [],
    this.joinedCommunityUids = const [],
  });

  @override
  String toString() {
    return 'User(id: $uid email: $email)';
  }

  bool profileCompleted() {
    return true;
  }
}
