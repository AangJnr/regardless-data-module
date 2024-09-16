import 'dart:convert';

import 'package:regardless_data_module/app/config/extensions.dart';

import '../../../app/config/enums.dart';
import '../../../domain/domain_mapper.dart';
import '../../../domain/model/category.dart';
import '../../../domain/model/user.dart';
import '../category_api.dart';

class UserResponse implements DomainMapper<AUser> {
  final String? id;
  final String? email;
  final String? phone;
  final ProfileResponse? profile;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userName;
  final bool? userNameAlreadyUpdated;

  const UserResponse({
    this.id,
    this.email,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.profile,
    this.userName,
    this.userNameAlreadyUpdated,
  });

  @override
  String toString() {
    return 'Profile(id: $id, fname:   email: $email, phone: $phone)';
  }

  factory UserResponse.fromMap(Map<String, dynamic> data) => UserResponse(
        id: data['uid'] as String?,
        email: data['email'] as String?,
        phone: data['phoneNumber'] as String?,
        profile: data['profile'] == null
            ? null
            : ProfileResponse.fromMap(data['profile']),
        userName: data['userName'] as String?,
        userNameAlreadyUpdated: data['userNameAlreadyUpdated'] as bool?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'uid': id,
        'email': email,
        'phoneNumber': phone,
        'userName': userName,
        'profile': profile?.toMap(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'userNameAlreadyUpdated': userNameAlreadyUpdated
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory UserResponse.fromJson(String data) {
    return UserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  AUser mapToDomain() => AUser(
      uid: id ?? '',
      email: email ?? '',
      phone: phone ?? '',
      profile: profile?.mapToDomain() ?? const Profile(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      userName: userName ?? "",
      userNameAlreadyUpdated: userNameAlreadyUpdated ?? false);
}

class ProfileResponse implements DomainMapper<Profile> {
  String? id;
  String? firstName;
  String? lastName;
  String? userProfileImage;
  Gender? gender;
  String? bio;
  String? categoryUid;
  CategoryApi? category;
  int? unreadNotificationCount;
  num? rating;
  num? reviewsCount;
  List<dynamic>? favoratesUids;
  List<dynamic>? joinedCommunityUids;

  ProfileResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.userProfileImage,
      this.gender,
      this.bio,
      this.category,
      this.rating,
      this.reviewsCount,
      this.joinedCommunityUids,
      this.favoratesUids,
      this.unreadNotificationCount,
      this.categoryUid});

  @override
  String toString() {
    return 'Profile(id: $id, fname: $firstName, lname: $lastName,  )';
  }

  factory ProfileResponse.fromMap(Map<String, dynamic> data) {
    return ProfileResponse(
        id: data['uid'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        userProfileImage: data['picture'] as String?,
        gender: (data['gender'] as String?)?.apiToGender(),
        bio: data['bio'] as String?,
        categoryUid: data['categoryUid'] as String?,
        unreadNotificationCount: data['unreadNotificationCount'] as int?,
        rating: data['rating'] as num?,
        reviewsCount: data['reviewsCount'] as num?,
        favoratesUids: data['favoratesUids'] == null
            ? []
            : data['favoratesUids'] as List<dynamic>?,
        joinedCommunityUids: data['joinedCommunityUids'] == null
            ? []
            : data['joinedCommunityUids'] as List<dynamic>?,
        category: data['category'] == null
            ? null
            : CategoryApi.fromMap(data['category']));
  }

  Map<String, dynamic> toMap() => {
        'uid': id,
        'firstName': firstName,
        'lastName': lastName,
        'picture': userProfileImage,
        'bio': bio,
        'categoryUid': categoryUid,
        'category': category?.toMap(),
        'unreadNotificationCount': unreadNotificationCount,
        'rating': rating,
        'reviewsCount': reviewsCount,
        'favoratesUids': favoratesUids,
        'joinedCommunityUids': joinedCommunityUids,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory ProfileResponse.fromJson(String data) {
    return ProfileResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Profile mapToDomain() => Profile(
        id: id ?? '',
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        bio: bio ?? '',
        categoryUid: categoryUid ?? '',
        userProfileImage: userProfileImage ?? '',
        gender: gender ?? Gender.Male,
        unreadNotificationCount: unreadNotificationCount ?? 0,
        rating: rating?.toDouble() ?? 0.0,
        reviewsCount: reviewsCount?.toInt() ?? 0,
        category: category?.mapToDomain() ?? const Category(),
        joinedCommunityUids:
            joinedCommunityUids?.map((e) => e.toString()).toList() ?? const [],
        favoratesUids:
            favoratesUids?.map((e) => e.toString()).toList() ?? const [],
      );
}
