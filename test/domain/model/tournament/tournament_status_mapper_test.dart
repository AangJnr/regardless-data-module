import 'package:flutter_test/flutter_test.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_match.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament_season.dart';

void main() {
  group('Tournament timezone mapper', () {
    test('round-trips an explicitly selected timezone', () {
      final tournament = Tournament(timezone: 'America/Toronto');
      final decoded = Tournament.fromMap(tournament.toMap());

      expect(decoded.timezone, 'America/Toronto');
    });

    test('defaults older tournament payloads to UTC', () {
      expect(Tournament.fromMap({}).timezone, 'Etc/UTC');
    });
  });

  group('TournamentMatch status mapper', () {
    test('round-trips API status values', () {
      for (final status in MatchStatus.values) {
        final match = TournamentMatch(status: status);
        final decoded = TournamentMatch.fromMap(match.toMap());

        expect(decoded.status, status);
        expect(match.toMap()['status'], status.toValue());
      }
    });

    test('round-trips API stage values', () {
      for (final stage in MatchStage.values) {
        final match = TournamentMatch(stage: stage);
        final decoded = TournamentMatch.fromMap(match.toMap());

        expect(decoded.stage, stage);
        expect(match.toMap()['stage'], stage.toValue());
      }
    });

    test('round-trips a cancellation reason', () {
      final match = TournamentMatch(
        status: MatchStatus.cancelled,
        cancellationReason: 'Venue unavailable',
      );
      final decoded = TournamentMatch.fromMap(match.toMap());

      expect(decoded.cancellationReason, 'Venue unavailable');
    });
  });

  group('TournamentSeason status mappers', () {
    test('round-trips season status values', () {
      for (final status in TournamentSeasonStatus.values) {
        final season = TournamentSeason(status: status);
        final decoded = TournamentSeason.fromMap(season.toMap());

        expect(decoded.status, status);
        expect(season.toMap()['status'], status.toValue());
      }
    });

    test('round-trips generation status values', () {
      for (final status in SeasonGenerationStatus.values) {
        final season = TournamentSeason(generationStatus: status);
        final decoded = TournamentSeason.fromMap(season.toMap());

        expect(decoded.generationStatus, status);
        expect(season.toMap()['generationStatus'], status.toValue());
      }
    });
  });
}
