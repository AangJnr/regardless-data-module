import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/collaborator/collaborator_permission.dart';
import 'package:regardless_data_module/domain/model/service/time_slot.dart';
import 'package:regardless_data_module/extensions/extensions.dart';

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
  final String bio;
  final String categoryUid;
  final Category? category;
  final List<Category>? subCategories;
  final int unreadNotificationCount;
  final double rating;
  final int reviewsCount;
  final bool isVerified;
  final List<String> favoratesUids;
  final List<String> likedPostUids;
  final List<String> subCategoryUids;
  final List<String> joinedCommunityUids;
  final bool userNameAlreadyUpdated;
  final String userName;
  final List<TimeSlot> schedule;

  const AUser({
    this.uid = '',
    this.email = '',
    this.fullName = '',
    this.phone = '',
    this.createdAt,
    this.updatedAt,
    this.isProvider = false,
    this.gender = Gender.Unsure,
    this.bio = '',
    this.userName = '',
    this.authUid = '',
    this.isVerified = false,
    this.categoryUid = '',
    this.userNameAlreadyUpdated = false,
    this.category,
    this.subCategories,
    this.unreadNotificationCount = 0,
    this.reviewsCount = 0,
    this.rating = 5.0,
    this.likedPostUids = const [],
    this.favoratesUids = const [],
    this.subCategoryUids = const [],
    this.joinedCommunityUids = const [],
    this.schedule = const [],
  });

  @override
  String toString() {
    return 'User(id: $uid email: $email)';
  }

  String get profileUrl => uid.profileUidToProfileUrl;

  bool profileCompleted() {
    return true;
  }

  bool get isAnonymous => email.endsWith('@anonymous.com');

  bool get isSportsTeamAccount => categoryUid.contains(RegExp('team'));
  bool get isLeagueManagerAccount => categoryUid.contains(RegExp('league'));
  bool get isGymAccount => categoryUid.contains(RegExp('gym|facility'));
  bool get isFitnessWellnessAccount =>
      categoryUid.contains(RegExp('fitness|wellness'));
}
