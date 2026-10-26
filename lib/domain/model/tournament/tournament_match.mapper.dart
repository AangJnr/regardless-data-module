// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tournament_match.dart';

class MatchStatusMapper extends EnumMapper<MatchStatus> {
  MatchStatusMapper._();

  static MatchStatusMapper? _instance;
  static MatchStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchStatusMapper._());
    }
    return _instance!;
  }

  static MatchStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MatchStatus decode(dynamic value) {
    switch (value) {
      case r'scheduled':
        return MatchStatus.scheduled;
      case r'completed':
        return MatchStatus.completed;
      case r'postponed':
        return MatchStatus.postponed;
      case r'cancelled':
        return MatchStatus.cancelled;
      case r'bye':
        return MatchStatus.bye;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MatchStatus self) {
    switch (self) {
      case MatchStatus.scheduled:
        return r'scheduled';
      case MatchStatus.completed:
        return r'completed';
      case MatchStatus.postponed:
        return r'postponed';
      case MatchStatus.cancelled:
        return r'cancelled';
      case MatchStatus.bye:
        return r'bye';
    }
  }
}

extension MatchStatusMapperExtension on MatchStatus {
  String toValue() {
    MatchStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MatchStatus>(this) as String;
  }
}

class MatchStageMapper extends EnumMapper<MatchStage> {
  MatchStageMapper._();

  static MatchStageMapper? _instance;
  static MatchStageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchStageMapper._());
    }
    return _instance!;
  }

  static MatchStage fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MatchStage decode(dynamic value) {
    switch (value) {
      case r'league':
        return MatchStage.league;
      case r'group':
        return MatchStage.group;
      case r'knockout':
        return MatchStage.knockout;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MatchStage self) {
    switch (self) {
      case MatchStage.league:
        return r'league';
      case MatchStage.group:
        return r'group';
      case MatchStage.knockout:
        return r'knockout';
    }
  }
}

extension MatchStageMapperExtension on MatchStage {
  String toValue() {
    MatchStageMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MatchStage>(this) as String;
  }
}

class TournamentMatchMapper extends ClassMapperBase<TournamentMatch> {
  TournamentMatchMapper._();

  static TournamentMatchMapper? _instance;
  static TournamentMatchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentMatchMapper._());
      MatchStatusMapper.ensureInitialized();
      MatchStageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TournamentMatch';

  static String _$uid(TournamentMatch v) => v.uid;
  static const Field<TournamentMatch, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$tournamentUid(TournamentMatch v) => v.tournamentUid;
  static const Field<TournamentMatch, String> _f$tournamentUid = Field(
    'tournamentUid',
    _$tournamentUid,
    opt: true,
    def: '',
  );
  static String _$seasonUid(TournamentMatch v) => v.seasonUid;
  static const Field<TournamentMatch, String> _f$seasonUid = Field(
    'seasonUid',
    _$seasonUid,
    opt: true,
    def: '',
  );
  static String _$homeTeamUid(TournamentMatch v) => v.homeTeamUid;
  static const Field<TournamentMatch, String> _f$homeTeamUid = Field(
    'homeTeamUid',
    _$homeTeamUid,
    opt: true,
    def: '',
  );
  static String _$awayTeamUid(TournamentMatch v) => v.awayTeamUid;
  static const Field<TournamentMatch, String> _f$awayTeamUid = Field(
    'awayTeamUid',
    _$awayTeamUid,
    opt: true,
    def: '',
  );
  static int? _$homeScore(TournamentMatch v) => v.homeScore;
  static const Field<TournamentMatch, int> _f$homeScore = Field(
    'homeScore',
    _$homeScore,
    opt: true,
  );
  static int? _$awayScore(TournamentMatch v) => v.awayScore;
  static const Field<TournamentMatch, int> _f$awayScore = Field(
    'awayScore',
    _$awayScore,
    opt: true,
  );
  static int? _$round(TournamentMatch v) => v.round;
  static const Field<TournamentMatch, int> _f$round = Field(
    'round',
    _$round,
    opt: true,
  );
  static int? _$matchNumber(TournamentMatch v) => v.matchNumber;
  static const Field<TournamentMatch, int> _f$matchNumber = Field(
    'matchNumber',
    _$matchNumber,
    opt: true,
  );
  static DateTime? _$date(TournamentMatch v) => v.date;
  static const Field<TournamentMatch, DateTime> _f$date = Field(
    'date',
    _$date,
    opt: true,
  );
  static MatchStatus _$status(TournamentMatch v) => v.status;
  static const Field<TournamentMatch, MatchStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: MatchStatus.scheduled,
  );
  static MatchStage _$stage(TournamentMatch v) => v.stage;
  static const Field<TournamentMatch, MatchStage> _f$stage = Field(
    'stage',
    _$stage,
    opt: true,
    def: MatchStage.league,
  );
  static String? _$groupUid(TournamentMatch v) => v.groupUid;
  static const Field<TournamentMatch, String> _f$groupUid = Field(
    'groupUid',
    _$groupUid,
    opt: true,
  );
  static String? _$winnerTeamUid(TournamentMatch v) => v.winnerTeamUid;
  static const Field<TournamentMatch, String> _f$winnerTeamUid = Field(
    'winnerTeamUid',
    _$winnerTeamUid,
    opt: true,
  );
  static String? _$cancellationReason(TournamentMatch v) =>
      v.cancellationReason;
  static const Field<TournamentMatch, String> _f$cancellationReason = Field(
    'cancellationReason',
    _$cancellationReason,
    opt: true,
  );

  @override
  final MappableFields<TournamentMatch> fields = const {
    #uid: _f$uid,
    #tournamentUid: _f$tournamentUid,
    #seasonUid: _f$seasonUid,
    #homeTeamUid: _f$homeTeamUid,
    #awayTeamUid: _f$awayTeamUid,
    #homeScore: _f$homeScore,
    #awayScore: _f$awayScore,
    #round: _f$round,
    #matchNumber: _f$matchNumber,
    #date: _f$date,
    #status: _f$status,
    #stage: _f$stage,
    #groupUid: _f$groupUid,
    #winnerTeamUid: _f$winnerTeamUid,
    #cancellationReason: _f$cancellationReason,
  };

  static TournamentMatch _instantiate(DecodingData data) {
    return TournamentMatch(
      uid: data.dec(_f$uid),
      tournamentUid: data.dec(_f$tournamentUid),
      seasonUid: data.dec(_f$seasonUid),
      homeTeamUid: data.dec(_f$homeTeamUid),
      awayTeamUid: data.dec(_f$awayTeamUid),
      homeScore: data.dec(_f$homeScore),
      awayScore: data.dec(_f$awayScore),
      round: data.dec(_f$round),
      matchNumber: data.dec(_f$matchNumber),
      date: data.dec(_f$date),
      status: data.dec(_f$status),
      stage: data.dec(_f$stage),
      groupUid: data.dec(_f$groupUid),
      winnerTeamUid: data.dec(_f$winnerTeamUid),
      cancellationReason: data.dec(_f$cancellationReason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TournamentMatch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TournamentMatch>(map);
  }

  static TournamentMatch fromJson(String json) {
    return ensureInitialized().decodeJson<TournamentMatch>(json);
  }
}

mixin TournamentMatchMappable {
  String toJson() {
    return TournamentMatchMapper.ensureInitialized()
        .encodeJson<TournamentMatch>(this as TournamentMatch);
  }

  Map<String, dynamic> toMap() {
    return TournamentMatchMapper.ensureInitialized().encodeMap<TournamentMatch>(
      this as TournamentMatch,
    );
  }

  TournamentMatchCopyWith<TournamentMatch, TournamentMatch, TournamentMatch>
  get copyWith =>
      _TournamentMatchCopyWithImpl<TournamentMatch, TournamentMatch>(
        this as TournamentMatch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TournamentMatchMapper.ensureInitialized().stringifyValue(
      this as TournamentMatch,
    );
  }

  @override
  bool operator ==(Object other) {
    return TournamentMatchMapper.ensureInitialized().equalsValue(
      this as TournamentMatch,
      other,
    );
  }

  @override
  int get hashCode {
    return TournamentMatchMapper.ensureInitialized().hashValue(
      this as TournamentMatch,
    );
  }
}

extension TournamentMatchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TournamentMatch, $Out> {
  TournamentMatchCopyWith<$R, TournamentMatch, $Out> get $asTournamentMatch =>
      $base.as((v, t, t2) => _TournamentMatchCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TournamentMatchCopyWith<$R, $In extends TournamentMatch, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? tournamentUid,
    String? seasonUid,
    String? homeTeamUid,
    String? awayTeamUid,
    int? homeScore,
    int? awayScore,
    int? round,
    int? matchNumber,
    DateTime? date,
    MatchStatus? status,
    MatchStage? stage,
    String? groupUid,
    String? winnerTeamUid,
    String? cancellationReason,
  });
  TournamentMatchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TournamentMatchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TournamentMatch, $Out>
    implements TournamentMatchCopyWith<$R, TournamentMatch, $Out> {
  _TournamentMatchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TournamentMatch> $mapper =
      TournamentMatchMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? tournamentUid,
    String? seasonUid,
    String? homeTeamUid,
    String? awayTeamUid,
    Object? homeScore = $none,
    Object? awayScore = $none,
    Object? round = $none,
    Object? matchNumber = $none,
    Object? date = $none,
    MatchStatus? status,
    MatchStage? stage,
    Object? groupUid = $none,
    Object? winnerTeamUid = $none,
    Object? cancellationReason = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (tournamentUid != null) #tournamentUid: tournamentUid,
      if (seasonUid != null) #seasonUid: seasonUid,
      if (homeTeamUid != null) #homeTeamUid: homeTeamUid,
      if (awayTeamUid != null) #awayTeamUid: awayTeamUid,
      if (homeScore != $none) #homeScore: homeScore,
      if (awayScore != $none) #awayScore: awayScore,
      if (round != $none) #round: round,
      if (matchNumber != $none) #matchNumber: matchNumber,
      if (date != $none) #date: date,
      if (status != null) #status: status,
      if (stage != null) #stage: stage,
      if (groupUid != $none) #groupUid: groupUid,
      if (winnerTeamUid != $none) #winnerTeamUid: winnerTeamUid,
      if (cancellationReason != $none) #cancellationReason: cancellationReason,
    }),
  );
  @override
  TournamentMatch $make(CopyWithData data) => TournamentMatch(
    uid: data.get(#uid, or: $value.uid),
    tournamentUid: data.get(#tournamentUid, or: $value.tournamentUid),
    seasonUid: data.get(#seasonUid, or: $value.seasonUid),
    homeTeamUid: data.get(#homeTeamUid, or: $value.homeTeamUid),
    awayTeamUid: data.get(#awayTeamUid, or: $value.awayTeamUid),
    homeScore: data.get(#homeScore, or: $value.homeScore),
    awayScore: data.get(#awayScore, or: $value.awayScore),
    round: data.get(#round, or: $value.round),
    matchNumber: data.get(#matchNumber, or: $value.matchNumber),
    date: data.get(#date, or: $value.date),
    status: data.get(#status, or: $value.status),
    stage: data.get(#stage, or: $value.stage),
    groupUid: data.get(#groupUid, or: $value.groupUid),
    winnerTeamUid: data.get(#winnerTeamUid, or: $value.winnerTeamUid),
    cancellationReason: data.get(
      #cancellationReason,
      or: $value.cancellationReason,
    ),
  );

  @override
  TournamentMatchCopyWith<$R2, TournamentMatch, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TournamentMatchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

