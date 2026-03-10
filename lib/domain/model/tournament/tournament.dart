import 'package:dart_mappable/dart_mappable.dart';

part 'tournament.mapper.dart';

@MappableEnum()
enum TournamentStatus {
  draft,
  active,
  completed,
  archived,
}

@MappableEnum()
enum TournamentFormat {
  league,
  knockout,
  groupKnockout,
}

@MappableEnum()
enum RankingSystem {
  points,
  winRate,
}

@MappableClass()
class Tournament with TournamentMappable {
  final String uid;
  final String ownerUid;
  final String name;
  final String description;
  final String? logoUrl;
  final String? coverUrl;
  final TournamentStatus status;
  final TournamentFormat format;
  final RankingSystem rankingSystem;

  // Scoring Configuration
  final int winPoints;
  final int drawPoints;
  final int lossPoints;

  // Match Configuration
  final int roundRobinCount; // legs (1 or 2)
  final int minTeams;
  final int maxTeams;

  final List<String> participantTeamUids;
  final String? currentSeasonUid;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Tournament({
    this.uid = '',
    this.ownerUid = '',
    this.name = '',
    this.description = '',
    this.logoUrl,
    this.coverUrl,
    this.status = TournamentStatus.draft,
    this.format = TournamentFormat.league,
    this.rankingSystem = RankingSystem.points,
    this.winPoints = 3,
    this.drawPoints = 1,
    this.lossPoints = 0,
    this.roundRobinCount = 1,
    this.minTeams = 2,
    this.maxTeams = 20,
    this.participantTeamUids = const [],
    this.currentSeasonUid,
    this.createdAt,
    this.updatedAt,
  });

  static const fromMap = TournamentMapper.fromMap;
  static const fromJson = TournamentMapper.fromJson;
}
