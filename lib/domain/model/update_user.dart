import 'package:dart_mappable/dart_mappable.dart';

part 'update_user.mapper.dart';

@MappableClass()
class UpdateUser with UpdateUserMappable {
  final String uid;

  final String email;
  final String fullName;
  final String phone;
  final String bio;
  final String picture;

  const UpdateUser({
   required this.uid,
    this.email = '',
    this.fullName = 'Regardless User',
    this.phone = '',
    this.picture = '',
    this.bio = '',
  });
}
