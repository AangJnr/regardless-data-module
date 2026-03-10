class TournamentMatch {
  final String uid;
  final String tournamentUid;
  final String seasonUid;
  final String homeTeamUid;
  final String awayTeamUid;
  final int homeScore;
  final int awayScore;
  final int? round;
  final DateTime? date;
  final String status;

  const TournamentMatch({
    this.uid = '',
    this.tournamentUid = '',
    this.seasonUid = '',
    this.homeTeamUid = '',
    this.awayTeamUid = '',
    this.homeScore = 0,
    this.awayScore = 0,
    this.round,
    this.date,
    this.status = 'completed',
  });

  factory TournamentMatch.fromMap(Map<String, dynamic> map) {
    return TournamentMatch(
      uid: map['uid'] as String? ?? '',
      tournamentUid: map['tournamentUid'] as String? ?? '',
      seasonUid: map['seasonUid'] as String? ?? '',
      homeTeamUid: map['homeTeamUid'] as String? ?? '',
      awayTeamUid: map['awayTeamUid'] as String? ?? '',
      homeScore: (map['homeScore'] as num?)?.toInt() ?? 0,
      awayScore: (map['awayScore'] as num?)?.toInt() ?? 0,
      round: (map['round'] as num?)?.toInt(),
      date: map['date'] != null
          ? DateTime.tryParse(map['date'].toString())
          : null,
      status: map['status'] as String? ?? 'completed',
    );
  }
}
