// ignore_for_file: empty_catches

import 'package:multiple_result/multiple_result.dart';

import 'package:regardless_data_module/domain/model/community/comment.dart';

import 'package:regardless_data_module/domain/model/community/community.dart';

import 'package:regardless_data_module/domain/model/community/member.dart';

import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/review/review.dart';

import '../../../domain/repositories/community_repository.dart';
import '../../model/paginated_response.dart';
import '../../model/search_filter.dart';
import 'base_repository.dart';

class CommunityRepositoryImpl
    with BaseRepository
    implements CommunityRepository {
  @override
  Future<Result<Comment, Exception>> addAComment(
      String uid, Comment comment) async {
    var data = await processRequest(() => apiService.addAComment(uid, comment));
    if (data.isSuccess()) {
      return Success(CommentMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Community, Exception>> addCommunity(Community e) async {
    var data = await processRequest(() => apiService.addCommunity(e));
    if (data.isSuccess()) {
      return Success(CommunityMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteComment(
      String communityUid, String uid) async {
    var data =
        await processRequest(() => apiService.deleteComment(communityUid, uid));
    if (data.isSuccess()) {
      return const Success(true);
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteCommunity({required String uid}) async {
    var data = await processRequest(() => apiService.deleteCommunity(uid: uid));
    if (data.isSuccess()) {
      return Success(data.isSuccess());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Community, Exception>> getCommunity({
    required String uid,
    required String ownerUid,
  }) async {
    var data =
        await processRequest(() => apiService.getCommunity(ownerUid, uid));
    if (data.isSuccess()) {
      return Success(CommunityMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Comment>, Exception>> getCommunityComments(
      String uid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getCommunityComments(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => CommentMapper.fromMap(e))
            .toList();
        return Success(Pagination<Comment>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
    return const Success(Pagination<Comment>());
  }

  @override
  Future<Result<Pagination<Member>, Exception>> getCommunityMembers(String uid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getCommunityMembers(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => MemberMapper.fromMap(e))
            .toList();
        return Success(Pagination<Member>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Community>, Exception>> getUserCommunities(
      String ownerUid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getUserCommunities(ownerUid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => CommunityMapper.fromMap(e))
            .toList();
        return Success(Pagination<Community>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
    return const Success(Pagination<Community>());
  }

  @override
  Future<Result<Pagination<Community>, Exception>> getUserJoinedCommunities(
      {required String userUid, PaginationRequest? request}) async {
    var response = await processRequest(() => apiService
        .getUserJoinedCommunities(userUid: userUid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => CommunityMapper.fromMap(e))
            .toList();
        return Success(Pagination<Community>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
    return const Success(Pagination<Community>());
  }

  @override
  Future<Result<Member, Exception>> joinCommunity({
    bool isRequest = false,
    required Community community,
  }) async {
    var data = await processRequest(() => isRequest
        ? apiService.requestToJoin(
            uid: community.uid,
            ownerUid: community.ownerUid,
            userUid: sessionManager.getUserProfile().uid)
        : apiService.joinCommunity(
            uid: community.uid, ownerUid: community.ownerUid));
    if (data.isSuccess()) {
      return Success(MemberMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> leaveCommunity(String uid) async {
    var data = await processRequest(() => apiService.leaveCommunity(uid));
    if (data.isSuccess()) {
      return const Success(true);
    }
    return Error(data.tryGetError()!);
  }
  @override
  Future<Result<bool, Exception>> removeCommunityMember({required String uid, required String memberUid})  async {
    var data = await processRequest(() => apiService.removeCommunityMember(uid: uid, memberUid: memberUid));
    if (data.isSuccess()) {
      return const Success(true);
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Member, Exception>> approveRequestToJoinCommunity(
      {required Community community, required Member member}) async {
    var data = await processRequest(() =>
        apiService.approveRequestToJoinCommunity(
            uid: community.uid, ownerUid: community.ownerUid, member: member));
    if (data.isSuccess()) {
      return Success(MemberMapper.fromMap(data.tryGetSuccess()!));
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Member>, Exception>> getCommunityMemberRequests(
      String uid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getCommunityMemberRequests(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => MemberMapper.fromMap(e))
            .toList();
        return Success(Pagination<Member>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Review>, Exception>> getCommunityReviews(
      {PaginationRequest? request, String uid = ''}) async {
    try {
      bool hasNext = false;
      List<Review> allData = [];
      var data = await processRequest(
          () => apiService.getCommunityReviews(request: request, uid: uid));
      if (data.isSuccess()) {
        final paginatedResults =
            PaginatedResponse.fromMap(data.tryGetSuccess()!);

        if (paginatedResults.data != null) {
          try {
            allData.addAll(
                paginatedResults.data!.map((e) => ReviewMapper.fromMap(e)));
          } catch (e) {
            //
          }
          hasNext = paginatedResults.hasNext;
        }
      }
      return Future.value(
          Success(Pagination<Review>(data: allData, hasNext: hasNext)));
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<Review, Exception>> addReview(
      {required Review review, String uid = ''}) async {
    var response = await processRequest(
        () => apiService.addCommunityReview(review: review, uid: uid));
    if (response.isSuccess()) {
      return Success(ReviewMapper.fromMap(response.tryGetSuccess()!));
    }

    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<List<Community>, Exception>> searchNearByCommunity(
      SearchEventParams params) async {
    var data =
        await processRequest(() => apiService.searchNearbyCommunities(params));
    if (data.isSuccess()) {
      final results = (data.tryGetSuccess()! as List<dynamic>)
          .map((data) => CommunityMapper.fromMap(data))
          .toList();
      return Success(results);
    }
    return Success([]);
  }

  @override
  Future<Result<List<Community>, Exception>> searchCommunity(
      SearchEventParams params) async {
    var data = await processRequest(
        () => apiService.searchCommunitiesViaQuery(params));
    if (data.isSuccess()) {
      final results = (data.tryGetSuccess()! as List<dynamic>)
          .map((data) => CommunityMapper.fromMap(data))
          .toList();
      return Success(results);
    }
    return Success([]);
  }
}
