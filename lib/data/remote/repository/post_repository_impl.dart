import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/post/announcement.dart';
import '../../../app/app.logger.dart';
import '../../../domain/model/post/post.dart';
import '../../../domain/repositories/post_repository.dart';
import 'base_repository.dart';

class PostRepositoryImpl with BaseRepository implements PostRepository {
  @override
  Future<Result<Pagination<Post>, Exception>> getPosts(
      PaginationRequest request) async {
    var data =
        await processRequest(() => apiService.getPosts(request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final data =
            paginationResponse.data?.map((e) => PostMapper.fromMap(e)).toList();
        return Success(Pagination<Post>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('PostRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Post>());
  }

  @override
  Future<bool> likePost(String uid) async {
    var data = await processRequest(() => apiService.likePost(uid));
    return data.isSuccess();
  }

  @override
  Future<bool> unlikePost(String uid) async {
    var data = await processRequest(() => apiService.unlikePost(uid));
    return data.isSuccess();
  }

  @override
  Future<Result<Pagination<Announcement>, Exception>> getUserAnnouncementPosts(
      PaginationRequest request) async {
    var data = await processRequest(
        () => apiService.getUserAnnouncementPosts(request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AnnouncementMapper.fromMap(e))
            .toList();
        return Success(Pagination<Announcement>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('PostRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Announcement>());
  }

  @override
  Future<Result<Pagination<Announcement>, Exception>>
      getPublicAnnouncementPosts(PaginationRequest request) async {
    var data = await processRequest(
        () => apiService.getPublicAnnouncements(request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AnnouncementMapper.fromMap(e))
            .toList();
        return Success(Pagination<Announcement>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('PostRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Announcement>());
  }

  @override
  Future<Result<Announcement, Exception>> addAnnouncementPost(
      Announcement postData) async {
    var data = await processRequest(
        () => apiService.addAnnouncementPost(postData.toMap()));
    if (data.isSuccess()) {
      return Success(AnnouncementMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(Exception('Failed to add announcement'));
  }

  @override
  Future<bool> deleteAnnouncementPost(String uid) async {
    var data =
        await processRequest(() => apiService.deleteAnnouncementPost(uid));
    return data.isSuccess();
  }

  @override
  Future<Result<Announcement, Exception>> editAnnouncementPost(
      Announcement postData) async {
    var data = await processRequest(
        () => apiService.editAnnouncementPost(postData.toMap()));
    if (data.isSuccess()) {
      return Success(AnnouncementMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(Exception('Failed to edit announcement'));
  }
}
