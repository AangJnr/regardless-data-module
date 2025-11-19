import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/media.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/team/team_invite.dart';
import 'package:regardless_data_module/domain/model/team/team_join_request.dart';
import 'package:regardless_data_module/domain/model/team/team_member.dart';
import 'package:regardless_data_module/domain/repositories/team_repository.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/services/cache_service.dart';
import '../../../domain/model/sports/sports_category.dart';
import '../../../domain/model/user.dart';
import '../../model/paginated_response.dart';
 import 'base_repository.dart';

class TeamRepositoryImpl with BaseRepository implements TeamRepository {
  @override
  Future<Result<Team, Exception>> addTeam(
    Team team, {
    XFile? logo,
    XFile? headerImage,
  }) async {
    final res = await processMultiPartRequest(
        () => apiService.addTeam(team, logo: logo, headerImage: headerImage));
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Team>, Exception>> getUsersTeams(String ownerUid,
      {PaginationRequest? request}) async {
    final res = await processRequest(
        () => apiService.getUsersTeams(ownerUid, request: request));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? []).map((e) => TeamMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Team, Exception>> getTeam(String ownerUid, String uid) async {
    final res = await processRequest(() => apiService.getTeam(ownerUid, uid));
    if (res.isSuccess()) {
      final e = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(e));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteTeam(String uid) async {
    final res = await processRequest(() => apiService.deleteTeam(uid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamMember>, Exception>> getTeamMembers(String uid,
      {PaginationRequest? request}) async {
    final res = await processRequest(
        () => apiService.getTeamMembers(uid, request: request));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items =
          (p.data ?? []).map((e) => TeamMemberMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> removeTeamMember(
      String uid, String memberUid) async {
    final res =
        await processRequest(() => apiService.removeTeamMember(uid, memberUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> requestToJoinTeam(
      String ownerUid, String uid) async {
    final res =
        await processRequest(() => apiService.requestToJoinTeam(ownerUid, uid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> inviteUserToTeam(
      List<AUser> users, String uid) async {
    final res = await processRequest(
        () => apiService.inviteUserToTeam(users, uid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> approveRequestToJoinTeam(
      {required String ownerUid,
      required String uid,
      required String requesterUid,
      String? role}) async {
    final res = await processRequest(() => apiService.approveRequestToJoinTeam(
        ownerUid: ownerUid, uid: uid, requesterUid: requesterUid, role: role));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamJoinRequest>, Exception>> getTeamJoinRequests(
      String uid,
      {PaginationRequest? request}) async {
    final res = await processRequest(
        () => apiService.getTeamJoinRequests(uid, request: request));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items =
          (p.data ?? []).map((e) => TeamJoinRequestMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> inviteMemberByEmail(String uid,
      {required String email, String? name, String? role}) async {
    final res = await processRequest(() => apiService.inviteMemberByEmail(uid,
        email: email, name: name, role: role));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> invitePlayersByEmail(String teamUid,
      {required List<String> emails}) async {
    final res = await processRequest(
        () => apiService.invitePlayersByEmail(teamUid, emails: emails));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TeamInvite, Exception>> acceptInvite(
      {required String token, required String teamUid}) async {
    final res =
        await processRequest(() => apiService.acceptTeamInvite(token, teamUid));
    if (res.isSuccess()) {
      final e = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamInviteMapper.fromMap(e));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> finalizeInvite(
      {required String token, required String teamUid}) async {
    final res = await processRequest(
        () => apiService.finalizeTeamInvite(token, teamUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> linkTeamWithEvent(
      {required String ownerUid,
      required String teamUid,
      required String eventUid}) async {
    final res = await processRequest(
        () => apiService.linkTeamWithEvent(ownerUid, teamUid, eventUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> unlinkTeamWithEvent(
      {required String ownerUid,
      required String teamUid,
      required String eventUid}) async {
    final res = await processRequest(
        () => apiService.unlinkTeamWithEvent(ownerUid, teamUid, eventUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> addTeamManager(
      String teamUid, String managerUid) async {
    final res = await processRequest(
        () => apiService.addTeamManager(teamUid, managerUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> removeTeamManager(
      String teamUid, String managerUid) async {
    final res = await processRequest(
        () => apiService.removeTeamManager(teamUid, managerUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  // ... existing code ...

  @override
  Future<Result<List<SportsCategory>, Exception>> getSportsCategories() async {
    final cache = module<CacheService>();

    Future<List<SportsCategory>> fetch() async {
      final response =
          await processRequest(() => apiService.getSportsCategories());
      if (response.isSuccess()) {
        try {
          final data = (response.tryGetSuccess()! as List<dynamic>)
              .map((e) => SportsCategoryMapper.fromMap(e))
              .toList();
          return data;
        } catch (e) {
          return [];
        }
      } else {
        return [];
      }
    }

    final categories = await cache.execute(fetch, "sports_categories");

    if (categories.isEmpty) {
      cache.clear('sports_categories');
    }

    return Success(categories);
  }

  @override
  Future<Result<bool, Exception>> deleteInvitation(
      String uid, String inviteeUid) async {
    final res = await processRequest(
        () => apiService.deleteTeamInvite(uid, inviteeUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamInvite>, Exception>> getTeamInvitees(String uid,
      {PaginationRequest? request}) async {
    final res = await processRequest(
        () => apiService.getTeamInvitees(uid, request: request));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items =
          (p.data ?? []).map((e) => TeamInviteMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> declineRequestToJoin(
      String requesterUid, String teamUid) async {
    final res = await processRequest(
        () => apiService.declineTeamJoinRequest(requesterUid, teamUid));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Media>, Exception>> getTeamMedia(String uid,
      {PaginationRequest? request}) async {
    var data = await processRequest(() => apiService.getTeamMedia(uid));

    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final parsed = paginationResponse.data
            ?.mapIndexed((i, e) => MediaMapper.fromMap(e) )
            .toList();
        return Success(Pagination<Media>(
            data: parsed ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('TeamRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteTeamMedia(
      String uid, List<String> uids) async {
    final res =
        await processRequest(() => apiService.deleteTeamMedia(uid, uids));
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Team>, Exception>> searchTeams(String teamUid,
      {PaginationRequest? request}) async {
    // ignore: deprecated_member_use_from_same_package
    var data = await processRequest(
        () => apiService.searchTeams(teamUid, request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final parsed =
            paginationResponse.data?.map((e) => TeamMapper.fromMap(e)).toList();
        return Success(Pagination<Team>(
            data: parsed ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('TeamRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<List<Media>, Exception>> uploadTeamMedia(
      String uid, List<XFile> files) async {
    final results = await processMultiPartRequest(
        () => apiService.uploadTeamMedia(uid, files));
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => MediaMapper.fromMap(e as Map<String, dynamic>))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }
}
