import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import '../media.dart';
import '../model/pagination.dart';
import '../../data/model/paginated_response.dart';
import '../model/sports/sports_category.dart';
import '../model/team/team.dart';
import '../model/team/team_invite.dart';
import '../model/team/team_join_request.dart';
import '../model/team/team_member.dart';
import '../model/user.dart';

abstract class TeamRepository {
  Future<Result<Team, Exception>> addTeam(
    Team team, {
    XFile? logo,
    XFile? headerImage,
  });
  Future<Result<Pagination<Team>, Exception>> getUsersTeams(String ownerUid,
      {PaginationRequest? request});
  Future<Result<Team, Exception>> getTeam(String ownerUid, String uid);
  Future<Result<bool, Exception>> deleteTeam(String uid);

  Future<Result<Pagination<TeamMember>, Exception>> getTeamMembers(String uid,
      {PaginationRequest? request});
  Future<Result<bool, Exception>> removeTeamMember(
      String uid, String memberUid);

  Future<Result<bool, Exception>> requestToJoinTeam(
      String ownerUid, String uid);
  Future<Result<bool, Exception>> inviteUserToTeam(
       List<AUser> users, String uid);
  Future<Result<bool, Exception>> approveRequestToJoinTeam(
      {required String ownerUid,
      required String uid,
      required String requesterUid,
      String? role});
  Future<Result<Pagination<TeamJoinRequest>, Exception>> getTeamJoinRequests(
      String uid,
      {PaginationRequest? request});

  Future<Result<bool, Exception>> inviteMemberByEmail(String uid,
      {required String email, String? name, String? role});

  Future<Result<bool, Exception>> invitePlayersByEmail(String teamUid,
      {required List<String> emails});
  Future<Result<TeamInvite, Exception>> acceptInvite(
      {required String token, required String teamUid});
  Future<Result<bool, Exception>> finalizeInvite(
      {required String token, required String teamUid});

  Future<Result<bool, Exception>> linkTeamWithEvent(
      {required String ownerUid,
      required String teamUid,
      required String eventUid});
  Future<Result<bool, Exception>> unlinkTeamWithEvent(
      {required String ownerUid,
      required String teamUid,
      required String eventUid});

  Future<Result<bool, Exception>> addTeamManager(
      String teamUid, String managerUid);
  Future<Result<bool, Exception>> removeTeamManager(
      String teamUid, String managerUid);
  Future<Result<List<SportsCategory>, Exception>> getSportsCategories();

  Future<Result<Pagination<TeamInvite>, Exception>> getTeamInvitees(String uid,
      {PaginationRequest? request});
  Future<Result<bool, Exception>> deleteInvitation(
      String uid, String inviteeUid);
  Future<Result<bool, Exception>> declineRequestToJoin(
      String requesterUid, String teamUid);
  Future<Result<Pagination<Media>, Exception>> getTeamMedia(String uid,
      {PaginationRequest? request});
  Future<Result<List<Media>, Exception>> uploadTeamMedia(
      String uid, List<XFile> files);

  Future<Result<bool, Exception>> deleteTeamMedia(
      String uid, List<String> uids);
  Future<Result<Pagination<Team>, Exception>> searchTeams(String teamUid,
      {PaginationRequest? request});
}
