import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_match.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_standing.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_season.dart';

abstract class TournamentRepository {
  Future<Result<Tournament, Exception>> createTournament(
    Tournament tournament, {
    XFile? logo,
    XFile? cover,
  });

  Future<Result<Tournament, Exception>> updateTournament(
    Tournament tournament, {
    XFile? logo,
    XFile? cover,
    Map<String, dynamic>? categoryRulesSnapshot,
  });

  Future<Result<Pagination<Tournament>, Exception>> getTournaments(
    String ownerUid, {
    PaginationRequest? request,
  });

  Future<Result<Pagination<Tournament>, Exception>> getPublicTournaments(
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

  /// Fetch active teams belonging to any of the requested sports categories.
  Future<Result<List<Team>, Exception>> getTeamsBySportsCategories(
    List<String> sportsCategoryUids,
  );

  Future<Result<Pagination<Team>, Exception>> getTeamsBySportsCategory(
    String sportsCategoryUid, {
    PaginationRequest? request,
  });

  /// Get tournament standings for a specific season
  Future<Result<List<TournamentStanding>, Exception>> getTournamentStandings(
    String tournamentUid,
    String seasonUid,
  );

  Future<Result<Map<String, dynamic>, Exception>> getTournamentStatistics(
    String tournamentUid,
    String seasonUid,
  );

  /// Get matches for a tournament/season
  Future<Result<Pagination<TournamentMatch>, Exception>> getTournamentMatches(
    String tournamentUid,
    String seasonUid, {
    PaginationRequest? request,
  });

  Future<Result<List<TournamentMatch>, Exception>> getTournamentBracketMatches(
    String tournamentUid,
    String seasonUid,
  );

  Future<Result<List<TournamentSeason>, Exception>> getTournamentSeasons(
    String tournamentUid,
  );

  Future<Result<Map<String, dynamic>, Exception>> getCategoryRules(
    String categoryUid,
  );

  Future<Result<TournamentSeason, Exception>> createSeason(
    String tournamentUid,
    Map<String, dynamic> values,
  );

  Future<Result<TournamentSeason, Exception>> updateSeason(
    String tournamentUid,
    String seasonUid,
    Map<String, dynamic> values,
  );

  Future<Result<Map<String, dynamic>, Exception>> startSeason(
    String tournamentUid,
    String seasonUid,
  );

  Future<Result<Map<String, dynamic>, Exception>> regenerateSeasonFixtures(
    String tournamentUid,
    String seasonUid,
  );

  Future<Result<TournamentSeason, Exception>> completeSeason(
    String tournamentUid,
    String seasonUid,
  );

  Future<Result<TournamentMatch, Exception>> recordMatch(
    String tournamentUid,
    String matchUid,
    Map<String, dynamic> values,
  );
}
