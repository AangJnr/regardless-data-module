import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import 'package:regardless_data_module/extensions/extensions.dart';

import '../hash_image.dart';
part 'comment.mapper.dart';

@MappableClass()
class Comment with CommentMappable {
  final String userUid;
  final String userName;
  final String comment;
  final String uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<HashImage> imageUrls;
 
  const Comment({
    this.userUid = '',
    this.userName = '',
    this.comment = '',
    this.uid = '',
    this.createdAt,
    this.updatedAt,
    this.imageUrls = const [],
  });

   String get picture => userUid.profileUidToProfileUrl;

  @override
  String toString() {
    return 'CommentApi(userUid: $userUid, userName: $userName, comment: $comment, uid: $uid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
    String getParsedDate() {
    if (createdAt == null) return '';
    try {
      return DateFormat('dd/MM/yyyy').format(createdAt!).toString();
    } catch (e) {
      return '';
    }
  }
}
