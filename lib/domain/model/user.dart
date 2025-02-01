import 'package:firebase_auth/firebase_auth.dart';

import '../../app/config/enums.dart';
import '../../data/model/user_response/user_response.dart';
import '../domain_mapper.dart';
import 'category.dart';

class AUser implements DataMapper<UserResponse> {
  final String uid;
  final String email;
  final String phone;
  final Profile profile;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userName;
  final bool userNameAlreadyUpdated;

  const AUser(
      {this.uid = '',
      this.email = '',
      this.phone = '',
      this.createdAt,
      this.updatedAt,
      this.profile = const Profile(),
      this.userName = '',
      this.userNameAlreadyUpdated = false});

  @override
  String toString() {
    return 'User(id: $uid email: $email, phone: $phone)';
  }

  bool profileCompleted() {
    return profile.fullName.isNotEmpty && phone.isNotEmpty;
  }

  bool isProvider() {
    return profile.categoryUid.isNotEmpty;
  }

  String getUserName() {
    if (userName.trim().isEmpty || userName.trim() == 'null') {
      return 'Regardless User';
    }
    return userName;
  }

  AUser copyWith(
      {String? uid,
      String? email,
      dynamic phone,
      dynamic userProfileImage,
      DateTime? createdAt,
      DateTime? updatedAt,
      Profile? profile,
      String? userName,
      bool? userNameAlreadyUpdated}) {
    return AUser(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profile: profile ?? this.profile,
        userName: userName ?? this.userName,
        userNameAlreadyUpdated:
            userNameAlreadyUpdated ?? this.userNameAlreadyUpdated);
  }

  factory AUser.fromUser(User user) => AUser(
      uid: user.uid,
      email: user.email ?? "",
      phone: user.phoneNumber ?? "",
      userName: user.displayName?.isEmpty == true
          ? (user.email?.split('@').firstOrNull ?? '')
          : user.displayName ?? '',
      userNameAlreadyUpdated: false,
      profile: Profile(userProfileImage: user.photoURL ?? ''));

  @override
  UserResponse mapToApi() => UserResponse(
      id: uid,
      email: email,
      phone: phone,
      profile: profile.mapToApi(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      userName: userName,
      userNameAlreadyUpdated: userNameAlreadyUpdated);
}

class Profile implements DataMapper<ProfileResponse> {
  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String userProfileImage;
  final Gender gender;
  final String bio;
  final String? assetUrl;
  final String categoryUid;
  final Category category;
  final int unreadNotificationCount;
  final double rating;
  final int reviewsCount;
  final List<String> favoratesUids;
  final List<String> joinedCommunityUids;
  const Profile(
      {this.id = '',
      this.firstName = 'Guest',
      this.lastName = '',
      this.userName = '',
      this.userProfileImage = '',
      this.gender = Gender.Male,
      this.bio = '',
      this.categoryUid = '',
      this.category = const Category(),
      this.unreadNotificationCount = 0,
      this.reviewsCount = 0,
      this.rating = 0.0,
      this.favoratesUids = const [],
      this.joinedCommunityUids = const [],
      this.assetUrl});

  String get fullName => '$firstName $lastName'.trim();

  @override
  String toString() {
    return 'Profile(id: $id, fname: $firstName, lname: $lastName, country: $userName,)';
  }

  Profile copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? userName,
      String? userProfileImage,
      String? assetUrl,
      Gender? gender,
      String? categoryUid,
      Category? category,
      int? unreadNotificationCount,
      int? reviewsCount,
      double? rating,
      String? bio,
      List<String>? favoratesUids,
      List<String>? joinedCommunityUids}) {
    return Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userName: userName ?? this.userName,
        userProfileImage: userProfileImage ?? this.userProfileImage,
        gender: gender ?? this.gender,
        categoryUid: categoryUid ?? this.categoryUid,
        bio: bio ?? this.bio,
        assetUrl: assetUrl ?? this.assetUrl,
        category: category ?? this.category,
        rating: rating ?? this.rating,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        unreadNotificationCount:
            unreadNotificationCount ?? this.unreadNotificationCount,
        favoratesUids: favoratesUids ?? this.favoratesUids,
        joinedCommunityUids: joinedCommunityUids ?? this.joinedCommunityUids);
  }

  @override
  ProfileResponse mapToApi() => ProfileResponse(
      id: id,
      firstName: firstName,
      lastName: lastName,
      userProfileImage: userProfileImage,
      gender: gender,
      bio: bio,
      categoryUid: categoryUid,
      category: category.mapToApi(),
      rating: rating,
      reviewsCount: reviewsCount,
      unreadNotificationCount: unreadNotificationCount,
      favoratesUids: favoratesUids,
      joinedCommunityUids: joinedCommunityUids);
}

