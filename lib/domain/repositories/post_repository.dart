import 'package:multiple_result/multiple_result.dart';
import '../../data/model/paginated_response.dart';
import '../model/pagination.dart';
import '../model/post/post.dart';

abstract class PostRepository {
  Future<Result<Pagination<Post>, Exception>> getPosts(
      PaginationRequest request);
  Future<bool> likePost(String uid);
  Future<bool> unlikePost(String uid);
}
