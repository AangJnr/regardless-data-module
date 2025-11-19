import 'package:multiple_result/multiple_result.dart';

import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../model/community/comment.dart';
import '../model/community/community.dart';
import '../model/community/member.dart';
import '../model/pagination.dart';
import '../model/review/review.dart';

abstract class CommunityRepository {
  Future<Result<Community, Exception>> addCommunity(Community e);
  Future<Result<Community, Exception>> getCommunity({
    required String uid,
    required String ownerUid,
  });
  Future<Result<bool, Exception>> deleteCommunity({required String uid});
  Future<Result<Comment, Exception>> addAComment(String uid, Comment comment);
  Future<Result<bool, Exception>> deleteComment(
      String communityUid, String uid);
  Future<Result<Member, Exception>> joinCommunity({
    bool isRequest = false,
    required Community community,
  });
  Future<Result<bool, Exception>> leaveCommunity(String uid);
    Future<Result<bool, Exception>> removeCommunityMember({required String uid, required String memberUid});
  Future<Result<Member, Exception>> approveRequestToJoinCommunity(
      {required Community community, required Member member});
  Future<Result<Pagination<Community>, Exception>> getUserJoinedCommunities(
      {required String userUid, PaginationRequest? request});
  Future<Result<Pagination<Community>, Exception>> getUserCommunities(
      String ownerUid,
      {PaginationRequest? request});
  Future<Result<Pagination<Comment>, Exception>> getCommunityComments(
      String uid,
      {PaginationRequest? request});
  Future<Result<Pagination<Member>, Exception>> getCommunityMembers(String uid,
      {PaginationRequest? request});
  Future<Result<Pagination<Member>, Exception>> getCommunityMemberRequests(
      String uid,
      {PaginationRequest? request});
  Future<Result<Pagination<Review>, Exception>> getCommunityReviews(
      {PaginationRequest? request, String uid = ''});
  Future<Result<Review, Exception>> addReview(
      {required Review review, String uid = ''});
  Future<Result<List<Community>, Exception>> searchNearByCommunity(
      SearchEventParams params);
  Future<Result<List<Community>, Exception>> searchCommunity(
      SearchEventParams params);
}
