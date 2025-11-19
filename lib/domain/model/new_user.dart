import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:regardless_data_module/domain/model/user.dart';

part 'new_user.mapper.dart';

@MappableClass()
class NewUser with NewUserMappable {
  final String email;
  final String fullName;
  final String phone;
  final Gender gender;
  final String defaultProfileUid;
  final bool isProvider;
  final String picture;
  final String userName;
  final List<String> privateCommunities;
  final List<String> publicCommunities;
  final String? categoryUid;
  const NewUser({
    this.email = '',
    this.fullName = 'Regardless User',
    this.phone = '',
    this.picture = '',
    this.userName = '',
    this.categoryUid,
    this.isProvider = false,
    this.defaultProfileUid = '',
    this.gender = Gender.Unsure,
    this.privateCommunities = const [],
    this.publicCommunities = const [],
  });

  factory NewUser.fromUser(User user) => NewUser(
      email: user.email ?? "",
      phone: user.phoneNumber ?? "",
      picture: user.photoURL ?? '',
      userName: user.displayName?.isEmpty == true
          ? (user.email?.split('@').firstOrNull ?? '')
          : user.displayName ?? '');
}
