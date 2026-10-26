import 'package:dart_mappable/dart_mappable.dart';

part 'tournament_season.mapper.dart';

@MappableEnum()
enum TournamentSeasonStatus { draft, active, completed, cancelled }

@MappableEnum()
enum SeasonGenerationStatus {
  notStarted,
  generating,
  regenerating,
  complete,
  failed,
}

@MappableClass()
class TournamentSeason with TournamentSeasonMappable {
  final String uid;
  final String tournamentUid;
  final String name;
  final TournamentSeasonStatus status;
  final SeasonGenerationStatus generationStatus;
  final List<String> participantTeamUids;
  final List<Map<String, dynamic>> generationWarnings;
  final List<Map<String, dynamic>> categoryWarnings;
  final Map<String, dynamic>? categoryRulesSnapshot;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final DateTime? updatedAt;

  const TournamentSeason({
    this.uid = '',
    this.tournamentUid = '',
    this.name = '',
    this.status = TournamentSeasonStatus.draft,
    this.generationStatus = SeasonGenerationStatus.notStarted,
    this.participantTeamUids = const [],
    this.generationWarnings = const [],
    this.categoryWarnings = const [],
    this.categoryRulesSnapshot,
    this.startedAt,
    this.completedAt,
    this.updatedAt,
  });

  static const fromMap = TournamentSeasonMapper.fromMap;
  static const fromJson = TournamentSeasonMapper.fromJson;

  @override
  String toString() => '$name · ${status.toValue()}';

  bool get hasWarnings =>
      generationWarnings.isNotEmpty || categoryWarnings.isNotEmpty;

  String get allWarnings {
    final sb = StringBuffer('');
    if (generationWarnings.isNotEmpty) {
      sb.write(
        '${generationWarnings.length} players are active in another competition.',
      );
    }
    if (categoryWarnings.isNotEmpty) {
      sb.write('${categoryWarnings.length} teams use another sports category.');
    }
    return sb.toString();
  }
}
