import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/data/remote/repository/base_repository.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_match.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_standing.dart';
import 'package:regardless_data_module/domain/repositories/tournament_repository.dart';

class TournamentRepositoryImpl
    with BaseRepository
    implements TournamentRepository {
  @override
  Future<Result<Tournament, Exception>> createTournament(Tournament tournament,
      {File? logo, File? cover}) async {
    final res = await processMultiPartRequest(() => apiService.createTournament(
          tournament,
          logo: logo != null ? XFile(logo.path) : null,
          cover: cover != null ? XFile(cover.path) : null,
        ));
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TournamentMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Tournament, Exception>> updateTournament(Tournament tournament,
      {File? logo, File? cover}) async {
    final res = await processMultiPartRequest(() => apiService.updateTournament(
          tournament,
          logo: logo != null ? XFile(logo.path) : null,
          cover: cover != null ? XFile(cover.path) : null,
        ));
    if (res.isSuccess()) {
      final data = res.tryGetSuccess()! as Map<String, dynamic>;
      return Success(TournamentMapper.fromMap(data));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Tournament>, Exception>> getTournaments(
      String ownerUid,
      {PaginationRequest? request}) async {
    final res = await processRequest(() => apiService.getTournaments(
          ownerUid,
          request: request,
        ));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items =
          (p.data ?? []).map((e) => TournamentMapper.fromMap(e)).toList();
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
  Future<Result<Pagination<Team>, Exception>> searchTeams(String query,
      {PaginationRequest? request}) async {
    final res = await processRequest(
        () => apiService.searchTeams(query, request: request));
    if (res.isSuccess()) {
      final p = PaginatedResponse.fromMap(res.tryGetSuccess()!);
      final items = (p.data ?? []).map((e) => TeamMapper.fromMap(e)).toList();
      return Success(Pagination(data: items, hasNext: p.hasNext, last: p.last));
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<List<TournamentStanding>, Exception>> getTournamentStandings(
      String tournamentUid, String seasonUid) async {
    final res = await processRequest(
      () => apiService.getTournamentStandings(tournamentUid,
          seasonUid: seasonUid),
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
  Future<Result<Pagination<TournamentMatch>, Exception>> getTournamentMatches(
      String tournamentUid, String seasonUid,
      {PaginationRequest? request}) async {
    final res = await processRequest(
      () => apiService.getTournamentMatches(tournamentUid,
          seasonUid: seasonUid, request: request),
    );
    if (res.isSuccess()) {
      final raw = res.tryGetSuccess();
      if (raw is Map<String, dynamic> && raw['data'] is List<dynamic>) {
        final p = PaginatedResponse.fromMap(raw);
        final items =
            (p.data ?? []).map((e) => TournamentMatch.fromMap(e)).toList();
        return Success(Pagination(
          data: items,
          hasNext: p.hasNext,
          last: p.last,
        ));
      }
      // Fallback for simple list responses without pagination
      if (raw is List) {
        final items = raw
            .whereType<Map<String, dynamic>>()
            .map(TournamentMatch.fromMap)
            .toList();
        return Success(Pagination(data: items, hasNext: false, last: null));
      }
    }
    return Error(res.tryGetError()!);
  }
}
