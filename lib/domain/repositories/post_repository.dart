import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/post/announcement.dart';
import '../../data/model/paginated_response.dart';
import '../model/pagination.dart';
import '../model/post/post.dart';

abstract class PostRepository {
  Future<Result<Pagination<Post>, Exception>> getPosts(
      PaginationRequest request);
  Future<bool> likePost(String uid);
  Future<bool> unlikePost(String uid);
  Future<Result<Pagination<Announcement>, Exception>> getUserAnnouncementPosts(
      PaginationRequest request);
  Future<Result<Announcement, Exception>> addAnnouncementPost(
      Announcement postData);
  Future<Result<Announcement, Exception>> editAnnouncementPost(
      Announcement postData);
  Future<Result<Pagination<Announcement>, Exception>>
      getPublicAnnouncementPosts(PaginationRequest request);
  Future<bool> deleteAnnouncementPost(String uid);
}
