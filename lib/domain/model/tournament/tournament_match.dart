import 'package:dart_mappable/dart_mappable.dart';

part 'tournament_match.mapper.dart';

@MappableEnum()
enum MatchStatus { scheduled, completed, postponed, cancelled, bye }

@MappableEnum()
enum MatchStage { league, group, knockout }

@MappableClass()
class TournamentMatch with TournamentMatchMappable {
  final String uid;
  final String tournamentUid;
  final String seasonUid;
  final String homeTeamUid;
  final String awayTeamUid;
  final int? homeScore;
  final int? awayScore;
  final int? round;
  final int? matchNumber;
  final DateTime? date;
  final MatchStatus status;
  final MatchStage stage;
  final String? groupUid;
  final String? winnerTeamUid;
  final String? cancellationReason;

  const TournamentMatch({
    this.uid = '',
    this.tournamentUid = '',
    this.seasonUid = '',
    this.homeTeamUid = '',
    this.awayTeamUid = '',
    this.homeScore,
    this.awayScore,
    this.round,
    this.matchNumber,
    this.date,
    this.status = MatchStatus.scheduled,
    this.stage = MatchStage.league,
    this.groupUid,
    this.winnerTeamUid,
    this.cancellationReason,
  });

  static const fromMap = TournamentMatchMapper.fromMap;
  static const fromJson = TournamentMatchMapper.fromJson;
}
