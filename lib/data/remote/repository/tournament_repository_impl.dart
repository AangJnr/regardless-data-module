import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/data/remote/repository/base_repository.dart';

import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_match.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_standing.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_season.dart';
import 'package:regardless_data_module/domain/repositories/tournament_repository.dart';

class TournamentRepositoryImpl
    with BaseRepository
    implements TournamentRepository {
  @override
  Future<Result<Tournament, Exception>> createTournament(
    Tournament tournament, {
    XFile? logo,
    XFile? cover,
  }) async {
    final res = await processMultiPartRequest(
      () => apiService.createTournament(tournament, logo: logo, cover: cover),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TournamentMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Tournament, Exception>> updateTournament(
    Tournament tournament, {
    XFile? logo,
    XFile? cover,
    Map<String, dynamic>? categoryRulesSnapshot,
  }) async {
    final res = await processMultiPartRequest(
      () => apiService.updateTournament(
        tournament,
        logo: logo,
        cover: cover,
        categoryRulesSnapshot: categoryRulesSnapshot,
      ),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TournamentMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Tournament>, Exception>> getTournaments(
    String ownerUid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getTournaments(ownerUid, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TournamentMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Tournament>, Exception>> getPublicTournaments(
    String ownerUid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getPublicTournaments(ownerUid, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? [])
          .map((e) => TournamentMapper.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Tournament, Exception>> getTournament(String uid) async {
    final res = await processRequest(() => apiService.getTournament(uid));
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TournamentMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteTournament(String uid) async {
    final res = await processRequest(() => apiService.deleteTournament(uid));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Team>, Exception>> searchTeams(
    String query, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.searchTeams(query, request: request),
    );
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? []).map((e) => TeamMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<Team>, Exception>> getTeamsBySportsCategories(
    List<String> sportsCategoryUids,
  ) async {
    final res = await processRequest(
      () => apiService.getTeamsBySportsCategories(sportsCategoryUids),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is! List) {
        return Error(
          FormatException(
            'Expected a list of teams for the requested sports categories.',
          ),
        );
      }
      try {
        final teams = data.map((item) {
          if (item is! Map<String, dynamic>) {
            throw const FormatException('Invalid team response.');
          }
          return TeamMapper.fromMap(item);
        }).toList();
        return Success(teams);
      } on Exception catch (error) {
        return Error(error);
      }
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Team>, Exception>> getTeamsBySportsCategory(
    String sportsCategoryUid, {
    PaginationRequest? request,
  }) async {
    final res = await processRequest(
      () => apiService.getTeamsBySportsCategory(
        sportsCategoryUid,
        request: request,
      ),
    );
    if (res.isSuccess()) {
      final page = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final teams = (page.data ?? [])
          .map((item) => TeamMapper.fromMap(item))
          .toList();
      return Success(
        Pagination(data: teams, hasNext: page.hasNext, last: page.last),
      );
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<TournamentStanding>, Exception>> getTournamentStandings(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTournamentStandings(
        tournamentUid,
        seasonUid: seasonUid,
      ),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is List) {
        final standings = data
            .whereType<Map<String, dynamic>>()
            .map(TournamentStanding.fromMap)
            .toList();
        return Success(standings);
      } else if (data is Map<String, dynamic> &&
          data['data'] is List<dynamic>) {
        final standings = (data['data'] as List<dynamic>)
            .whereType<Map<String, dynamic>>()
            .map(TournamentStanding.fromMap)
            .toList();
        return Success(standings);
      }
      return const Success(<TournamentStanding>[]);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Map<String, dynamic>, Exception>> getTournamentStatistics(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTournamentStatistics(
        tournamentUid,
        seasonUid: seasonUid,
      ),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is Map<String, dynamic>) return Success(data);
      return Error(Exception('Invalid tournament statistics response'));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<TournamentMatch>, Exception>> getTournamentMatches(
    String tournamentUid,
    String seasonUid, {
    PaginationRequest? request,
  }) async {
    //For malual test only. I will remove this later.
    final res = await processRequest(
      () => apiService.getTournamentMatches(
        tournamentUid,
        seasonUid: seasonUid,
        request: request,
      ),
    );
    if (res.isSuccess()) {
      final raw = res.tryGetSuccess()!;

      final p = PaginatedResponse.fromMap(raw);
      final items = (p.data ?? [])
          .map((e) => TournamentMatch.fromMap(e))
          .toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<TournamentMatch>, Exception>> getTournamentBracketMatches(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTournamentBracketMatches(
        tournamentUid,
        seasonUid: seasonUid,
      ),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is List) {
        return Success(
          data
              .whereType<Map<String, dynamic>>()
              .map(TournamentMatch.fromMap)
              .toList(),
        );
      }
      return Error(Exception('Invalid tournament bracket response'));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<TournamentSeason>, Exception>> getTournamentSeasons(
    String tournamentUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTournamentSeasons(tournamentUid),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is List) {
        return Success(
          data
              .whereType<Map<String, dynamic>>()
              .map(TournamentSeason.fromMap)
              .toList(),
        );
      }
      return const Success(<TournamentSeason>[]);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Map<String, dynamic>, Exception>> getCategoryRules(
    String categoryUid,
  ) async {
    final res = await processRequest(
      () => apiService.getTournamentCategoryRules(categoryUid),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is Map<String, dynamic>) return Success(data);
      return Error(Exception('Invalid category rules response'));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TournamentSeason, Exception>> createSeason(
    String tournamentUid,
    Map<String, dynamic> values,
  ) async {
    final res = await processRequest(
      () => apiService.createTournamentSeason(tournamentUid, values),
    );
    if (res.isSuccess()) {
      return Success(
        TournamentSeason.fromMap(res.tryGetSuccess() as Map<String, dynamic>),
      );
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TournamentSeason, Exception>> updateSeason(
    String tournamentUid,
    String seasonUid,
    Map<String, dynamic> values,
  ) async {
    final res = await processRequest(
      () => apiService.updateTournamentSeason(tournamentUid, seasonUid, values),
    );
    if (res.isSuccess()) {
      return Success(
        TournamentSeason.fromMap(res.tryGetSuccess() as Map<String, dynamic>),
      );
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Map<String, dynamic>, Exception>> startSeason(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.startTournamentSeason(tournamentUid, seasonUid),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is Map<String, dynamic>) return Success(data);
      return Error(Exception('Invalid season start response'));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Map<String, dynamic>, Exception>> regenerateSeasonFixtures(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.regenerateTournamentSeasonFixtures(
        tournamentUid,
        seasonUid,
      ),
    );
    if (res.isSuccess()) {
      final data = res.tryGetSuccess();
      if (data is Map<String, dynamic>) return Success(data);
      return Error(Exception('Invalid fixture regeneration response'));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TournamentSeason, Exception>> completeSeason(
    String tournamentUid,
    String seasonUid,
  ) async {
    final res = await processRequest(
      () => apiService.completeTournamentSeason(tournamentUid, seasonUid),
    );
    if (res.isSuccess()) {
      return Success(
        TournamentSeason.fromMap(res.tryGetSuccess() as Map<String, dynamic>),
      );
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<TournamentMatch, Exception>> recordMatch(
    String tournamentUid,
    String matchUid,
    Map<String, dynamic> values,
  ) async {
    final res = await processRequest(
      () => apiService.recordTournamentMatch(tournamentUid, matchUid, values),
    );
    if (res.isSuccess()) {
      return Success(
        TournamentMatch.fromMap(res.tryGetSuccess() as Map<String, dynamic>),
      );
    }
    return Error(res.tryGetError()!);
  }
}
