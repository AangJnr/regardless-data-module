// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tournament.dart';

class TournamentStatusMapper extends EnumMapper<TournamentStatus> {
  TournamentStatusMapper._();

  static TournamentStatusMapper? _instance;
  static TournamentStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentStatusMapper._());
    }
    return _instance!;
  }

  static TournamentStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TournamentStatus decode(dynamic value) {
    switch (value) {
      case r'draft':
        return TournamentStatus.draft;
      case r'active':
        return TournamentStatus.active;
      case r'completed':
        return TournamentStatus.completed;
      case r'archived':
        return TournamentStatus.archived;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TournamentStatus self) {
    switch (self) {
      case TournamentStatus.draft:
        return r'draft';
      case TournamentStatus.active:
        return r'active';
      case TournamentStatus.completed:
        return r'completed';
      case TournamentStatus.archived:
        return r'archived';
    }
  }
}

extension TournamentStatusMapperExtension on TournamentStatus {
  String toValue() {
    TournamentStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TournamentStatus>(this) as String;
  }
}

class TournamentFormatMapper extends EnumMapper<TournamentFormat> {
  TournamentFormatMapper._();

  static TournamentFormatMapper? _instance;
  static TournamentFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentFormatMapper._());
    }
    return _instance!;
  }

  static TournamentFormat fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TournamentFormat decode(dynamic value) {
    switch (value) {
      case r'league':
        return TournamentFormat.league;
      case r'knockout':
        return TournamentFormat.knockout;
      case r'groupKnockout':
        return TournamentFormat.groupKnockout;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TournamentFormat self) {
    switch (self) {
      case TournamentFormat.league:
        return r'league';
      case TournamentFormat.knockout:
        return r'knockout';
      case TournamentFormat.groupKnockout:
        return r'groupKnockout';
    }
  }
}

extension TournamentFormatMapperExtension on TournamentFormat {
  String toValue() {
    TournamentFormatMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TournamentFormat>(this) as String;
  }
}

class RankingSystemMapper extends EnumMapper<RankingSystem> {
  RankingSystemMapper._();

  static RankingSystemMapper? _instance;
  static RankingSystemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RankingSystemMapper._());
    }
    return _instance!;
  }

  static RankingSystem fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RankingSystem decode(dynamic value) {
    switch (value) {
      case r'points':
        return RankingSystem.points;
      case r'winRate':
        return RankingSystem.winRate;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RankingSystem self) {
    switch (self) {
      case RankingSystem.points:
        return r'points';
      case RankingSystem.winRate:
        return r'winRate';
    }
  }
}

extension RankingSystemMapperExtension on RankingSystem {
  String toValue() {
    RankingSystemMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RankingSystem>(this) as String;
  }
}

class TournamentMapper extends ClassMapperBase<Tournament> {
  TournamentMapper._();

  static TournamentMapper? _instance;
  static TournamentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentMapper._());
      TournamentStatusMapper.ensureInitialized();
      TournamentFormatMapper.ensureInitialized();
      RankingSystemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Tournament';

  static String _$uid(Tournament v) => v.uid;
  static const Field<Tournament, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$ownerUid(Tournament v) => v.ownerUid;
  static const Field<Tournament, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static String _$name(Tournament v) => v.name;
  static const Field<Tournament, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$description(Tournament v) => v.description;
  static const Field<Tournament, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String? _$logoUrl(Tournament v) => v.logoUrl;
  static const Field<Tournament, String> _f$logoUrl = Field(
    'logoUrl',
    _$logoUrl,
    opt: true,
  );
  static String? _$coverUrl(Tournament v) => v.coverUrl;
  static const Field<Tournament, String> _f$coverUrl = Field(
    'coverUrl',
    _$coverUrl,
    opt: true,
  );
  static TournamentStatus _$status(Tournament v) => v.status;
  static const Field<Tournament, TournamentStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: TournamentStatus.draft,
  );
  static TournamentFormat _$format(Tournament v) => v.format;
  static const Field<Tournament, TournamentFormat> _f$format = Field(
    'format',
    _$format,
    opt: true,
    def: TournamentFormat.league,
  );
  static RankingSystem _$rankingSystem(Tournament v) => v.rankingSystem;
  static const Field<Tournament, RankingSystem> _f$rankingSystem = Field(
    'rankingSystem',
    _$rankingSystem,
    opt: true,
    def: RankingSystem.points,
  );
  static int _$winPoints(Tournament v) => v.winPoints;
  static const Field<Tournament, int> _f$winPoints = Field(
    'winPoints',
    _$winPoints,
    opt: true,
    def: 3,
  );
  static int _$drawPoints(Tournament v) => v.drawPoints;
  static const Field<Tournament, int> _f$drawPoints = Field(
    'drawPoints',
    _$drawPoints,
    opt: true,
    def: 1,
  );
  static int _$lossPoints(Tournament v) => v.lossPoints;
  static const Field<Tournament, int> _f$lossPoints = Field(
    'lossPoints',
    _$lossPoints,
    opt: true,
    def: 0,
  );
  static int _$roundRobinCount(Tournament v) => v.roundRobinCount;
  static const Field<Tournament, int> _f$roundRobinCount = Field(
    'roundRobinCount',
    _$roundRobinCount,
    opt: true,
    def: 1,
  );
  static int _$minTeams(Tournament v) => v.minTeams;
  static const Field<Tournament, int> _f$minTeams = Field(
    'minTeams',
    _$minTeams,
    opt: true,
    def: 2,
  );
  static int _$maxTeams(Tournament v) => v.maxTeams;
  static const Field<Tournament, int> _f$maxTeams = Field(
    'maxTeams',
    _$maxTeams,
    opt: true,
    def: 20,
  );
  static List<String> _$participantTeamUids(Tournament v) =>
      v.participantTeamUids;
  static const Field<Tournament, List<String>> _f$participantTeamUids = Field(
    'participantTeamUids',
    _$participantTeamUids,
    opt: true,
    def: const [],
  );
  static String? _$currentSeasonUid(Tournament v) => v.currentSeasonUid;
  static const Field<Tournament, String> _f$currentSeasonUid = Field(
    'currentSeasonUid',
    _$currentSeasonUid,
    opt: true,
  );
  static DateTime? _$createdAt(Tournament v) => v.createdAt;
  static const Field<Tournament, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Tournament v) => v.updatedAt;
  static const Field<Tournament, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<Tournament> fields = const {
    #uid: _f$uid,
    #ownerUid: _f$ownerUid,
    #name: _f$name,
    #description: _f$description,
    #logoUrl: _f$logoUrl,
    #coverUrl: _f$coverUrl,
    #status: _f$status,
    #format: _f$format,
    #rankingSystem: _f$rankingSystem,
    #winPoints: _f$winPoints,
    #drawPoints: _f$drawPoints,
    #lossPoints: _f$lossPoints,
    #roundRobinCount: _f$roundRobinCount,
    #minTeams: _f$minTeams,
    #maxTeams: _f$maxTeams,
    #participantTeamUids: _f$participantTeamUids,
    #currentSeasonUid: _f$currentSeasonUid,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static Tournament _instantiate(DecodingData data) {
    return Tournament(
      uid: data.dec(_f$uid),
      ownerUid: data.dec(_f$ownerUid),
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      logoUrl: data.dec(_f$logoUrl),
      coverUrl: data.dec(_f$coverUrl),
      status: data.dec(_f$status),
      format: data.dec(_f$format),
      rankingSystem: data.dec(_f$rankingSystem),
      winPoints: data.dec(_f$winPoints),
      drawPoints: data.dec(_f$drawPoints),
      lossPoints: data.dec(_f$lossPoints),
      roundRobinCount: data.dec(_f$roundRobinCount),
      minTeams: data.dec(_f$minTeams),
      maxTeams: data.dec(_f$maxTeams),
      participantTeamUids: data.dec(_f$participantTeamUids),
      currentSeasonUid: data.dec(_f$currentSeasonUid),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Tournament fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tournament>(map);
  }

  static Tournament fromJson(String json) {
    return ensureInitialized().decodeJson<Tournament>(json);
  }
}

mixin TournamentMappable {
  String toJson() {
    return TournamentMapper.ensureInitialized().encodeJson<Tournament>(
      this as Tournament,
    );
  }

  Map<String, dynamic> toMap() {
    return TournamentMapper.ensureInitialized().encodeMap<Tournament>(
      this as Tournament,
    );
  }

  TournamentCopyWith<Tournament, Tournament, Tournament> get copyWith =>
      _TournamentCopyWithImpl<Tournament, Tournament>(
        this as Tournament,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TournamentMapper.ensureInitialized().stringifyValue(
      this as Tournament,
    );
  }

  @override
  bool operator ==(Object other) {
    return TournamentMapper.ensureInitialized().equalsValue(
      this as Tournament,
      other,
    );
  }

  @override
  int get hashCode {
    return TournamentMapper.ensureInitialized().hashValue(this as Tournament);
  }
}

extension TournamentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Tournament, $Out> {
  TournamentCopyWith<$R, Tournament, $Out> get $asTournament =>
      $base.as((v, t, t2) => _TournamentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TournamentCopyWith<$R, $In extends Tournament, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get participantTeamUids;
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    String? description,
    String? logoUrl,
    String? coverUrl,
    TournamentStatus? status,
    TournamentFormat? format,
    RankingSystem? rankingSystem,
    int? winPoints,
    int? drawPoints,
    int? lossPoints,
    int? roundRobinCount,
    int? minTeams,
    int? maxTeams,
    List<String>? participantTeamUids,
    String? currentSeasonUid,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  TournamentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TournamentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Tournament, $Out>
    implements TournamentCopyWith<$R, Tournament, $Out> {
  _TournamentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tournament> $mapper =
      TournamentMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get participantTeamUids => ListCopyWith(
    $value.participantTeamUids,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(participantTeamUids: v),
  );
  @override
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    String? description,
    Object? logoUrl = $none,
    Object? coverUrl = $none,
    TournamentStatus? status,
    TournamentFormat? format,
    RankingSystem? rankingSystem,
    int? winPoints,
    int? drawPoints,
    int? lossPoints,
    int? roundRobinCount,
    int? minTeams,
    int? maxTeams,
    List<String>? participantTeamUids,
    Object? currentSeasonUid = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (name != null) #name: name,
      if (description != null) #description: description,
      if (logoUrl != $none) #logoUrl: logoUrl,
      if (coverUrl != $none) #coverUrl: coverUrl,
      if (status != null) #status: status,
      if (format != null) #format: format,
      if (rankingSystem != null) #rankingSystem: rankingSystem,
      if (winPoints != null) #winPoints: winPoints,
      if (drawPoints != null) #drawPoints: drawPoints,
      if (lossPoints != null) #lossPoints: lossPoints,
      if (roundRobinCount != null) #roundRobinCount: roundRobinCount,
      if (minTeams != null) #minTeams: minTeams,
      if (maxTeams != null) #maxTeams: maxTeams,
      if (participantTeamUids != null)
        #participantTeamUids: participantTeamUids,
      if (currentSeasonUid != $none) #currentSeasonUid: currentSeasonUid,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  Tournament $make(CopyWithData data) => Tournament(
    uid: data.get(#uid, or: $value.uid),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    logoUrl: data.get(#logoUrl, or: $value.logoUrl),
    coverUrl: data.get(#coverUrl, or: $value.coverUrl),
    status: data.get(#status, or: $value.status),
    format: data.get(#format, or: $value.format),
    rankingSystem: data.get(#rankingSystem, or: $value.rankingSystem),
    winPoints: data.get(#winPoints, or: $value.winPoints),
    drawPoints: data.get(#drawPoints, or: $value.drawPoints),
    lossPoints: data.get(#lossPoints, or: $value.lossPoints),
    roundRobinCount: data.get(#roundRobinCount, or: $value.roundRobinCount),
    minTeams: data.get(#minTeams, or: $value.minTeams),
    maxTeams: data.get(#maxTeams, or: $value.maxTeams),
    participantTeamUids: data.get(
      #participantTeamUids,
      or: $value.participantTeamUids,
    ),
    currentSeasonUid: data.get(#currentSeasonUid, or: $value.currentSeasonUid),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  TournamentCopyWith<$R2, Tournament, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TournamentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

