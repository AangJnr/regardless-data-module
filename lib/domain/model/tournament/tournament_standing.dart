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
  final double winRate;
  final int scoreFor;
  final int scoreAgainst;
  final int scoreDifference;

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
    this.winRate = 0,
    this.scoreFor = 0,
    this.scoreAgainst = 0,
    this.scoreDifference = 0,
  });

  factory TournamentStanding.fromMap(Map<String, dynamic> map) {
    return TournamentStanding(
      teamUid: map['teamUid'] as String? ?? '',
      played: (map['played'] as num?)?.toInt() ?? 0,
      won: (map['won'] as num?)?.toInt() ?? 0,
      drawn: (map['drawn'] as num?)?.toInt() ?? 0,
      lost: (map['lost'] as num?)?.toInt() ?? 0,
      goalsFor:
          (map['goalsFor'] as num?)?.toInt() ??
          (map['scoreFor'] as num?)?.toInt() ??
          0,
      goalsAgainst:
          (map['goalsAgainst'] as num?)?.toInt() ??
          (map['scoreAgainst'] as num?)?.toInt() ??
          0,
      goalDiff:
          (map['goalDiff'] as num?)?.toInt() ??
          (map['scoreDifference'] as num?)?.toInt() ??
          0,
      points: (map['points'] as num?)?.toInt() ?? 0,
      winRate: (map['winRate'] as num?)?.toDouble() ?? 0,
      scoreFor:
          (map['scoreFor'] as num?)?.toInt() ??
          (map['goalsFor'] as num?)?.toInt() ??
          0,
      scoreAgainst:
          (map['scoreAgainst'] as num?)?.toInt() ??
          (map['goalsAgainst'] as num?)?.toInt() ??
          0,
      scoreDifference:
          (map['scoreDifference'] as num?)?.toInt() ??
          (map['goalDiff'] as num?)?.toInt() ??
          0,
    );
  }
}
