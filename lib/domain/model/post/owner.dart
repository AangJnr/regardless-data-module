import 'package:dart_mappable/dart_mappable.dart';

part 'owner.mapper.dart';

@MappableClass()
class Owner with OwnerMappable {
  final String uid;
  final String userName;
  final String imageUrl;
  final bool isVerified;
  const Owner(
      {this.uid = "",
      this.userName = "",
      this.imageUrl = "",
      this.isVerified = false});

  @override
  String toString() {
    return 'Owner(uid: $uid, username: $userName, imageUrl: $imageUrl)';
  }
}
