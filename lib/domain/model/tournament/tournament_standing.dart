class TournamentStanding {
  final String teamUid;
  final int played;
  final int won;
  final int drawn;
  final int lost;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDiff;
  final int points;

  const TournamentStanding({
    required this.teamUid,
    required this.played,
    required this.won,
    required this.drawn,
    required this.lost,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDiff,
    required this.points,
  });

  factory TournamentStanding.fromMap(Map<String, dynamic> map) {
    return TournamentStanding(
      teamUid: map['teamUid'] as String? ?? '',
      played: (map['played'] as num?)?.toInt() ?? 0,
      won: (map['won'] as num?)?.toInt() ?? 0,
      drawn: (map['drawn'] as num?)?.toInt() ?? 0,
      lost: (map['lost'] as num?)?.toInt() ?? 0,
      goalsFor: (map['goalsFor'] as num?)?.toInt() ?? 0,
      goalsAgainst: (map['goalsAgainst'] as num?)?.toInt() ?? 0,
      goalDiff: (map['goalDiff'] as num?)?.toInt() ?? 0,
      points: (map['points'] as num?)?.toInt() ?? 0,
    );
  }
}
