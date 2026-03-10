import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_match.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_standing.dart';

abstract class TournamentRepository {
  Future<Result<Tournament, Exception>> createTournament(
    Tournament tournament, {
    File? logo,
    File? cover,
  });

  Future<Result<Tournament, Exception>> updateTournament(
    Tournament tournament, {
    File? logo,
    File? cover,
  });

  Future<Result<Pagination<Tournament>, Exception>> getTournaments(
    String ownerUid, {
    PaginationRequest? request,
  });

  Future<Result<Tournament, Exception>> getTournament(String uid);

  Future<Result<bool, Exception>> deleteTournament(String uid);

  /// Search for Teams to add as participants
  /// This reuses the logic of searching team entities but tailored for tournament addition
  Future<Result<Pagination<Team>, Exception>> searchTeams(
    String query, {
    PaginationRequest? request,
  });

  /// Get tournament standings for a specific season
  Future<Result<List<TournamentStanding>, Exception>> getTournamentStandings(
    String tournamentUid,
    String seasonUid,
  );

  /// Get matches for a tournament/season
  Future<Result<Pagination<TournamentMatch>, Exception>> getTournamentMatches(
    String tournamentUid,
    String seasonUid, {
    PaginationRequest? request,
  });
}
