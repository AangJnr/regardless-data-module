// ignore_for_file: empty_catches

import 'package:multiple_result/multiple_result.dart';

import 'package:regardless_data_module/data/model/community_api/comment_api.dart';

import 'package:regardless_data_module/data/model/community_api/community_api.dart';

import 'package:regardless_data_module/domain/model/community/comment.dart';

import 'package:regardless_data_module/domain/model/community/community.dart';

import 'package:regardless_data_module/domain/model/community/member.dart';

import 'package:regardless_data_module/domain/model/pagination.dart';

import '../../../domain/repositories/community_repository.dart';
import '../../model/community_api/member_api.dart';
import '../../model/paginated_response.dart';
import 'base_repository.dart';

class CommunityRepositoryImpl
    with BaseRepository
    implements CommunityRepository {
  @override
  Future<Result<Comment, Exception>> addAComment(
      String uid, CommentApi comment) async {
    var data = await processRequest(() => apiService.addAComment(uid, comment));
    if (data.isSuccess()) {
      return Success(CommentApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Community, Exception>> addCommunity(CommunityApi e) async {
    var data = await processRequest(() => apiService.addCommunity(e));
    if (data.isSuccess()) {
      return Success(CommunityApi.fromMap(data.tryGetSuccess()!).mapToDomain());
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
  Future<Result<bool, Exception>> deleteCommunity(String uid) async {
    var data = await processRequest(() => apiService.deleteCommunity(uid));
    if (data.isSuccess()) {
      return Success(data.isSuccess());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Community, Exception>> getCommunity(
      String ownerUid, String uid) async {
    var data =
        await processRequest(() => apiService.getCommunity(ownerUid, uid));
    if (data.isSuccess()) {
      return Success(CommunityApi.fromMap(data.tryGetSuccess()!).mapToDomain());
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
            ?.map((e) => CommentApi.fromMap(e).mapToDomain())
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
            ?.map((e) => MemberApi.fromMap(e).mapToDomain())
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
            ?.map((e) => CommunityApi.fromMap(e).mapToDomain())
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
  Future<Result<Pagination<Community>, Exception>>
      getUserJoinedCommunities() async {
    var response =
        await processRequest(() => apiService.getUserJoinedCommunities());
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => CommunityApi.fromMap(e).mapToDomain())
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
  Future<Result<Member, Exception>> joinCommunity(String uid,
      {bool isRequest = false}) async {
    var data = await processRequest(() => isRequest
        ? apiService.requestToJoin(uid,
            userUid: sessionManager.getUserProfile().uid)
        : apiService.joinCommunity(uid));
    if (data.isSuccess()) {
      return Success(MemberApi.fromMap(data.tryGetSuccess()!).mapToDomain());
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
  Future<Result<Member, Exception>> approveRequestToJoinCommunity(
      String uid, Member member) async {
    var data = await processRequest(
        () => apiService.approveRequestToJoinCommunity(uid, member));
    if (data.isSuccess()) {
      return Success(MemberApi.fromMap(data.tryGetSuccess()!).mapToDomain());
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
            ?.map((e) => MemberApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Member>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {}
    }
     return Error(response.tryGetError()!);
  }
}
