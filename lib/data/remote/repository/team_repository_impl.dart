import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/media.dart';
import 'package:regardless_data_module/domain/model/event.dart';
import 'package:regardless_data_module/domain/model/new_user.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_finalize_payload.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_init.dart';
import 'package:regardless_data_module/domain/model/team/Invite_and_team.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/team/team_and_join_requests.dart';
import 'package:regardless_data_module/domain/model/team/team_invite.dart';
import 'package:regardless_data_module/domain/model/team/team_join_link.dart';
import 'package:regardless_data_module/domain/model/team/team_join_request.dart';
import 'package:regardless_data_module/domain/model/team/team_member.dart';
import 'package:regardless_data_module/domain/model/team/team_with_role.dart';
import 'package:regardless_data_module/domain/repositories/team_repository.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/services/cache_service.dart';
import '../../../domain/model/sports/sports_category.dart';
import '../../../domain/model/user.dart';
import '../../model/paginated_response.dart';
import 'base_repository.dart';

class TeamRepositoryImpl with BaseRepository implements TeamRepository {
  static const String _myTeamsCacheKey = 'my_teams';
  static const String _sportsCategoriesCacheKey = 'sports_categories';

  @override
  void invalidateTeamCaches() {
    module<CacheService>().invalidate();
  }

  @override
  Future<Result<Team, Exception>> editTeam(
    Team team, {
    XFile? logo,
    XFile? headerImage,
  }) async {
    final res = await processMultiPartRequest(
      () => apiService.addTeam(team, logo: logo, headerImage: headerImage),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Team, Exception>> createTeamAccount(
    Team team,
    NewUser user, {
    XFile? logo,
    XFile? headerImage,
  }) async {
    final res = await processMultiPartRequest(
      () => apiService.createTeamAccount(
        team,
        user,
        logo: logo,
        headerImage: headerImage,
      ),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Team, Exception>> addTeam(
    Team team, {
    XFile? logo,
    XFile? headerImage,
  }) async {
    final res = await processMultiPartRequest(
      () => apiService.addTeam(team, logo: logo, headerImage: headerImage),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamWithRole>, Exception>> getMyTeams({
    PaginationRequest? request,
  }) async {
    final cache = module<CacheService>();
    final cacheKey = '$_myTeamsCacheKey:${request?.limit ?? "all"}';

    final teams = await cache.execute(() async {
      final res = await processRequest(
        () => apiService.getMyTeams(request: request),
      );
      if (res.isSuccess()) {
        final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
        final items = (p.data ?? []).map((item) {
          final data = Map<String, dynamic>.from(item as Map);
          final role = data.remove('role')?.toString() ?? 'player';
          return TeamWithRole(team: TeamMapper.fromMap(data), role: role);
        }).toList();
        return Pagination(data: items, hasNext: p.hasNext, last: p.last);
      }
      throw Exception(
        res.tryGetError()?.toString() ?? 'Unable to fetch my teams',
      );
    }, cacheKey);

    if (teams.data.isEmpty && teams.hasNext == false) {
      cache.clear(cacheKey);
    }

    return Success(teams);
  }

  @override
  Future<Result<List<Team>, Exception>> getTeamSummaries(
    List<String> teamUids,
  ) async {
    final cache = module<CacheService>();
    final cacheKey = 'team_summaries:${teamUids.join(',')}';

    try {
      final teams = await cache.execute(() async {
        final res = await processRequest(
          () => apiService.getTeamSummaries(teamUids),
        );
        if (res.isSuccess()) {
          final page = PaginatedResponse.fromMap(res.tryGetSuccess()!);
          return (page.data ?? [])
              .map((item) => TeamMapper.fromMap(item))
              .toList();
        }
        throw Exception(
          res.tryGetError()?.toString() ?? 'Unable to fetch team summaries',
        );
      }, cacheKey);

      if (teams.isEmpty) {
        cache.clear(cacheKey);
      }

      return Success(teams);
    } catch (e) {
      return Error(Exception(e));
    }
  }

  @override
  Future<Result<Pagination<Team>, Exception>> getUsersTeams(
    String ownerUid, {
    PaginationRequest? request,
  }) async {
    final cache = module<CacheService>();
    final cacheKey = 'user_teams:$ownerUid:${request?.limit ?? "all"}';

    final teams = await cache.execute(() async {
      final res = await processRequest(
        () => apiService.getUsersTeams(ownerUid, request: request),
      );
      if (res.isSuccess()) {
        final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
        final items = (p.data ?? []).map((e) => TeamMapper.fromMap(e)).toList();
        return Pagination(data: items, hasNext: p.hasNext, last: p.last);
      }
      throw Exception(
        res.tryGetError()?.toString() ?? 'Unable to fetch user teams',
      );
    }, cacheKey);

    if (teams.data.isEmpty && teams.hasNext == false) {
      cache.clear(cacheKey);
    }

    return Success(teams);
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
  Future<Result<Team, Exception>> updateTeamStartingPlayers(
    String teamUid,
    List<String> playerUids,
  ) async {
    final res = await processRequest(
      () => apiService.updateTeamStartingPlayers(teamUid, playerUids),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<InviteAndTeam, Exception>> getTeamInvite(
    String token,
    String teamUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTeamInvite(token, teamUid),
    );
    if (res.isSuccess()) {
      final e = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(InviteAndTeam.fromMap(e));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteTeam(String uid) async {
    final res = await processRequest(() => apiService.deleteTeam(uid));
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamMember>, Exception>> getTeamMembers(
    String uid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getTeamMembers(uid, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TeamMemberMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TeamMember, Exception>> updateTeamMemberPlayerProfile(
    String teamUid,
    String memberUid,
    Map<String, dynamic> profile,
  ) async {
    final res = await processRequest(
      () =>
          apiService.updateTeamMemberPlayerProfile(teamUid, memberUid, profile),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamMemberMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TeamJoinLink, Exception>> createTeamJoinLink(
    String teamUid, {
    int expiresInDays = 7,
  }) async {
    final res = await processRequest(
      () =>
          apiService.createTeamJoinLink(teamUid, expiresInDays: expiresInDays),
    );
    if (res.isSuccess()) {
      return Success(
        TeamJoinLink.fromMap(res.tryGetSuccess()! as Map<String, dynamic>),
      );
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<TeamJoinLink>, Exception>> getTeamJoinLinks(
    String teamUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTeamJoinLinks(teamUid),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is List) {
        return Success(
          data
              .whereType<Map>()
              .map(
                (item) => TeamJoinLink.fromMap(Map<String, dynamic>.from(item)),
              )
              .toList(),
        );
      }
      return const Success(<TeamJoinLink>[]);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> revokeTeamJoinLink(
    String teamUid,
    String linkUid,
  ) async {
    final res = await processRequest(
      () => apiService.revokeTeamJoinLink(teamUid, linkUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> requestToJoinTeamByLink(
    String linkUid,
  ) async {
    final res = await processRequest(
      () => apiService.requestToJoinTeamByLink(linkUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> removeTeamMember(
    String uid,
    String memberUid,
  ) async {
    final res = await processRequest(
      () => apiService.removeTeamMember(uid, memberUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> requestToJoinTeam(
    String ownerUid,
    String uid,
  ) async {
    final res = await processRequest(
      () => apiService.requestToJoinTeam(ownerUid, uid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> inviteUserToTeam(
    List<AUser> users,
    String uid,
  ) async {
    final res = await processRequest(
      () => apiService.inviteUserToTeam(users, uid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> approveRequestToJoinTeam({
    required String ownerUid,
    required String uid,
    required String requesterUid,
    String? role,
  }) async {
    final res = await processRequest(
      () => apiService.approveRequestToJoinTeam(
        ownerUid: ownerUid,
        uid: uid,
        requesterUid: requesterUid,
        role: role,
      ),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamJoinRequest>, Exception>> getTeamJoinRequests(
    String uid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getTeamJoinRequests(uid, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TeamJoinRequestMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamAndJoinRequests>, Exception>>
  getAllTeamsJoinRequests({PaginationRequest? request}) async {
    final res = await processRequest(
      () => apiService.getAllTeamsJoinRequests(request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TeamAndJoinRequestsMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> inviteMemberByEmail(
    String uid, {
    required String email,
    String? name,
    String? role,
  }) async {
    final res = await processRequest(
      () => apiService.inviteMemberByEmail(
        uid,
        email: email,
        name: name,
        role: role,
      ),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> invitePlayersByEmail(
    String teamUid, {
    required List<String> emails,
  }) async {
    final res = await processRequest(
      () => apiService.invitePlayersByEmail(teamUid, emails: emails),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TeamInvite, Exception>> acceptInvite({
    required String token,
    required String teamUid,
  }) async {
    final res = await processRequest(
      () => apiService.acceptTeamInvite(token, teamUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      final e = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TeamInviteMapper.fromMap(e));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> finalizeInvite({
    required String token,
    required String teamUid,
  }) async {
    final res = await processRequest(
      () => apiService.finalizeTeamInvite(token, teamUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> linkTeamWithEvent({
    required String ownerUid,
    required String teamUid,
    required String eventUid,
  }) async {
    final res = await processRequest(
      () => apiService.linkTeamWithEvent(ownerUid, teamUid, eventUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> unlinkTeamWithEvent({
    required String ownerUid,
    required String teamUid,
    required String eventUid,
  }) async {
    final res = await processRequest(
      () => apiService.unlinkTeamWithEvent(ownerUid, teamUid, eventUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> addTeamManager(
    String teamUid,
    String managerUid,
  ) async {
    final res = await processRequest(
      () => apiService.addTeamManager(teamUid, managerUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> removeTeamManager(
    String teamUid,
    String managerUid,
  ) async {
    final res = await processRequest(
      () => apiService.removeTeamManager(teamUid, managerUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  // ... existing code ...

  @override
  Future<Result<List<SportsCategory>, Exception>> getSportsCategories() async {
    final cache = module<CacheService>();

    Future<List<SportsCategory>> fetch() async {
      final response = await processRequest(
        () => apiService.getSportsCategories(),
      );
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

    final categories = await cache.execute(fetch, _sportsCategoriesCacheKey);

    if (categories.isEmpty) {
      cache.clear(_sportsCategoriesCacheKey);
    }

    return Success(categories);
  }

  @override
  Future<Result<bool, Exception>> deleteInvitation(
    String uid,
    String inviteeUid,
  ) async {
    final res = await processRequest(
      () => apiService.deleteTeamInvite(uid, inviteeUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TeamInvite>, Exception>> getTeamInvitees(
    String uid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getTeamInvitees(uid, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TeamInviteMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> declineRequestToJoin(
    String requesterUid,
    String teamUid,
  ) async {
    final res = await processRequest(
      () => apiService.declineTeamJoinRequest(requesterUid, teamUid),
    );
    if (res.isSuccess()) {
      invalidateTeamCaches();
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Media>, Exception>> getTeamMedia(
    String uid, {
    PaginationRequest? request,
  }) async {
    var data = await processRequest(() => apiService.getTeamMedia(uid));

    if (data.isSuccess()) {
      final paginationResponse = PaginatedResponse.fromMap(
        data.tryGetSuccess()!,
      );
      try {
        final parsed = paginationResponse.data
            ?.mapIndexed((i, e) => MediaMapper.fromMap(e))
            .toList();
        return Success(
          Pagination<Media>(
            data: parsed ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last,
          ),
        );
      } catch (e) {
        getLogger('TeamRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteTeamMedia(
    String uid,
    List<String> uids,
  ) async {
    final res = await processRequest(
      () => apiService.deleteTeamMedia(uid, uids),
    );
    if (res.isSuccess()) return const Success(true);
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Team>, Exception>> searchTeams(
    String teamUid, {
    PaginationRequest? request,
  }) async {
    // ignore: deprecated_member_use_from_same_package
    var data = await processRequest(
      () => apiService.searchTeams(teamUid, request: request),
    );
    if (data.isSuccess()) {
      final paginationResponse = PaginatedResponse.fromMap(
        data.tryGetSuccess()!,
      );
      try {
        final parsed = paginationResponse.data
            ?.map((e) => TeamMapper.fromMap(e))
            .toList();
        return Success(
          Pagination<Team>(
            data: parsed ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last,
          ),
        );
      } catch (e) {
        getLogger('TeamRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<List<Media>, Exception>> uploadTeamMedia(
    String uid,
    List<XFile> files,
  ) async {
    final results = await processMultiPartRequest(
      () => apiService.uploadTeamMedia(uid, files),
    );
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => MediaMapper.fromMap(e as Map<String, dynamic>))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<DirectMediaUploadInit>, Exception>> initTeamMedia(
    String uid,
    List<XFile> files,
  ) async {
    final results = await processRequest(
      () => apiService.initTeamMedia(uid, files),
    );
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => DirectMediaUploadInitMapper.fromMap(e))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<Media>, Exception>> finalizeTeamMedia(
    String uid,
    List<DirectMediaUploadFinalizePayload> uploads,
  ) async {
    final results = await processRequest(
      () => apiService.finalizeTeamMedia(uid, uploads),
    );
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => MediaMapper.fromMap(e as Map<String, dynamic>))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Event>, Exception>> getTeamActivities({
    required String uid,
    required String ownerUid,
    PaginationRequest? request,
  }) async {
    var response = await processRequest(
      () => apiService.getTeamActivities(
        uid: uid,
        ownerUid: ownerUid,
        request: request,
      ),
    );
    if (response.isSuccess()) {
      final paginationResponse = PaginatedResponse.fromMap(
        response.tryGetSuccess()!,
      );
      try {
        final data = paginationResponse.data
            ?.map((e) => EventMapper.fromMap(e))
            .toList();
        return Success(
          Pagination<Event>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last,
          ),
        );
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Event>());
  }
}
