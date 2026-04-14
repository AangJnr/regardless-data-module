import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/venue.dart';

part 'update_user.mapper.dart';

@MappableClass()
class UpdateUser with UpdateUserMappable {
  final String uid;
  final String fullName;
  final String phone;
  final String bio;
  final String picture;
  final Venue? businessLocation;
  const UpdateUser(
      {required this.uid,
      this.fullName = 'Regardless User',
      this.phone = '',
      this.picture = '',
      this.bio = '',
      this.businessLocation});
}
