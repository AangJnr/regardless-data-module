import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/community_api/comment_api.dart';

import '../../data/model/community_api/community_api.dart';
import '../../data/model/paginated_response.dart';
import '../model/community/comment.dart';
import '../model/community/community.dart';
import '../model/community/member.dart';
import '../model/pagination.dart';

abstract class CommunityRepository {
  Future<Result<Community, Exception>> addCommunity(CommunityApi e);
  Future<Result<Community, Exception>> getCommunity(
      String ownerUid, String uid);
  Future<Result<bool, Exception>> deleteCommunity(String uid);
  Future<Result<Comment, Exception>> addAComment(
      String uid, CommentApi comment);
  Future<Result<bool, Exception>> deleteComment(
      String communityUid, String uid);
  Future<Result<Member, Exception>> joinCommunity(String uid,
      {bool isRequest = false});
  Future<Result<bool, Exception>> leaveCommunity(String uid);
  Future<Result<Member, Exception>> approveRequestToJoinCommunity(
      String uid, Member member);
  Future<Result<Pagination<Community>, Exception>> getUserJoinedCommunities();
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
}
