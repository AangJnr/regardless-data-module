// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tournament_season.dart';

class TournamentSeasonStatusMapper extends EnumMapper<TournamentSeasonStatus> {
  TournamentSeasonStatusMapper._();

  static TournamentSeasonStatusMapper? _instance;
  static TournamentSeasonStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentSeasonStatusMapper._());
    }
    return _instance!;
  }

  static TournamentSeasonStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TournamentSeasonStatus decode(dynamic value) {
    switch (value) {
      case r'draft':
        return TournamentSeasonStatus.draft;
      case r'active':
        return TournamentSeasonStatus.active;
      case r'completed':
        return TournamentSeasonStatus.completed;
      case r'cancelled':
        return TournamentSeasonStatus.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TournamentSeasonStatus self) {
    switch (self) {
      case TournamentSeasonStatus.draft:
        return r'draft';
      case TournamentSeasonStatus.active:
        return r'active';
      case TournamentSeasonStatus.completed:
        return r'completed';
      case TournamentSeasonStatus.cancelled:
        return r'cancelled';
    }
  }
}

extension TournamentSeasonStatusMapperExtension on TournamentSeasonStatus {
  String toValue() {
    TournamentSeasonStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TournamentSeasonStatus>(this)
        as String;
  }
}

class SeasonGenerationStatusMapper extends EnumMapper<SeasonGenerationStatus> {
  SeasonGenerationStatusMapper._();

  static SeasonGenerationStatusMapper? _instance;
  static SeasonGenerationStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SeasonGenerationStatusMapper._());
    }
    return _instance!;
  }

  static SeasonGenerationStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  SeasonGenerationStatus decode(dynamic value) {
    switch (value) {
      case r'notStarted':
        return SeasonGenerationStatus.notStarted;
      case r'generating':
        return SeasonGenerationStatus.generating;
      case r'regenerating':
        return SeasonGenerationStatus.regenerating;
      case r'complete':
        return SeasonGenerationStatus.complete;
      case r'failed':
        return SeasonGenerationStatus.failed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(SeasonGenerationStatus self) {
    switch (self) {
      case SeasonGenerationStatus.notStarted:
        return r'notStarted';
      case SeasonGenerationStatus.generating:
        return r'generating';
      case SeasonGenerationStatus.regenerating:
        return r'regenerating';
      case SeasonGenerationStatus.complete:
        return r'complete';
      case SeasonGenerationStatus.failed:
        return r'failed';
    }
  }
}

extension SeasonGenerationStatusMapperExtension on SeasonGenerationStatus {
  String toValue() {
    SeasonGenerationStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<SeasonGenerationStatus>(this)
        as String;
  }
}

class TournamentSeasonMapper extends ClassMapperBase<TournamentSeason> {
  TournamentSeasonMapper._();

  static TournamentSeasonMapper? _instance;
  static TournamentSeasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TournamentSeasonMapper._());
      TournamentSeasonStatusMapper.ensureInitialized();
      SeasonGenerationStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TournamentSeason';

  static String _$uid(TournamentSeason v) => v.uid;
  static const Field<TournamentSeason, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$tournamentUid(TournamentSeason v) => v.tournamentUid;
  static const Field<TournamentSeason, String> _f$tournamentUid = Field(
    'tournamentUid',
    _$tournamentUid,
    opt: true,
    def: '',
  );
  static String _$name(TournamentSeason v) => v.name;
  static const Field<TournamentSeason, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static TournamentSeasonStatus _$status(TournamentSeason v) => v.status;
  static const Field<TournamentSeason, TournamentSeasonStatus> _f$status =
      Field('status', _$status, opt: true, def: TournamentSeasonStatus.draft);
  static SeasonGenerationStatus _$generationStatus(TournamentSeason v) =>
      v.generationStatus;
  static const Field<TournamentSeason, SeasonGenerationStatus>
  _f$generationStatus = Field(
    'generationStatus',
    _$generationStatus,
    opt: true,
    def: SeasonGenerationStatus.notStarted,
  );
  static List<String> _$participantTeamUids(TournamentSeason v) =>
      v.participantTeamUids;
  static const Field<TournamentSeason, List<String>> _f$participantTeamUids =
      Field(
        'participantTeamUids',
        _$participantTeamUids,
        opt: true,
        def: const [],
      );
  static List<Map<String, dynamic>> _$generationWarnings(TournamentSeason v) =>
      v.generationWarnings;
  static const Field<TournamentSeason, List<Map<String, dynamic>>>
  _f$generationWarnings = Field(
    'generationWarnings',
    _$generationWarnings,
    opt: true,
    def: const [],
  );
  static List<Map<String, dynamic>> _$categoryWarnings(TournamentSeason v) =>
      v.categoryWarnings;
  static const Field<TournamentSeason, List<Map<String, dynamic>>>
  _f$categoryWarnings = Field(
    'categoryWarnings',
    _$categoryWarnings,
    opt: true,
    def: const [],
  );
  static Map<String, dynamic>? _$categoryRulesSnapshot(TournamentSeason v) =>
      v.categoryRulesSnapshot;
  static const Field<TournamentSeason, Map<String, dynamic>>
  _f$categoryRulesSnapshot = Field(
    'categoryRulesSnapshot',
    _$categoryRulesSnapshot,
    opt: true,
  );
  static DateTime? _$startedAt(TournamentSeason v) => v.startedAt;
  static const Field<TournamentSeason, DateTime> _f$startedAt = Field(
    'startedAt',
    _$startedAt,
    opt: true,
  );
  static DateTime? _$completedAt(TournamentSeason v) => v.completedAt;
  static const Field<TournamentSeason, DateTime> _f$completedAt = Field(
    'completedAt',
    _$completedAt,
    opt: true,
  );
  static DateTime? _$updatedAt(TournamentSeason v) => v.updatedAt;
  static const Field<TournamentSeason, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<TournamentSeason> fields = const {
    #uid: _f$uid,
    #tournamentUid: _f$tournamentUid,
    #name: _f$name,
    #status: _f$status,
    #generationStatus: _f$generationStatus,
    #participantTeamUids: _f$participantTeamUids,
    #generationWarnings: _f$generationWarnings,
    #categoryWarnings: _f$categoryWarnings,
    #categoryRulesSnapshot: _f$categoryRulesSnapshot,
    #startedAt: _f$startedAt,
    #completedAt: _f$completedAt,
    #updatedAt: _f$updatedAt,
  };

  static TournamentSeason _instantiate(DecodingData data) {
    return TournamentSeason(
      uid: data.dec(_f$uid),
      tournamentUid: data.dec(_f$tournamentUid),
      name: data.dec(_f$name),
      status: data.dec(_f$status),
      generationStatus: data.dec(_f$generationStatus),
      participantTeamUids: data.dec(_f$participantTeamUids),
      generationWarnings: data.dec(_f$generationWarnings),
      categoryWarnings: data.dec(_f$categoryWarnings),
      categoryRulesSnapshot: data.dec(_f$categoryRulesSnapshot),
      startedAt: data.dec(_f$startedAt),
      completedAt: data.dec(_f$completedAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TournamentSeason fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TournamentSeason>(map);
  }

  static TournamentSeason fromJson(String json) {
    return ensureInitialized().decodeJson<TournamentSeason>(json);
  }
}

mixin TournamentSeasonMappable {
  String toJson() {
    return TournamentSeasonMapper.ensureInitialized()
        .encodeJson<TournamentSeason>(this as TournamentSeason);
  }

  Map<String, dynamic> toMap() {
    return TournamentSeasonMapper.ensureInitialized()
        .encodeMap<TournamentSeason>(this as TournamentSeason);
  }

  TournamentSeasonCopyWith<TournamentSeason, TournamentSeason, TournamentSeason>
  get copyWith =>
      _TournamentSeasonCopyWithImpl<TournamentSeason, TournamentSeason>(
        this as TournamentSeason,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TournamentSeasonMapper.ensureInitialized().stringifyValue(
      this as TournamentSeason,
    );
  }

  @override
  bool operator ==(Object other) {
    return TournamentSeasonMapper.ensureInitialized().equalsValue(
      this as TournamentSeason,
      other,
    );
  }

  @override
  int get hashCode {
    return TournamentSeasonMapper.ensureInitialized().hashValue(
      this as TournamentSeason,
    );
  }
}

extension TournamentSeasonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TournamentSeason, $Out> {
  TournamentSeasonCopyWith<$R, TournamentSeason, $Out>
  get $asTournamentSeason =>
      $base.as((v, t, t2) => _TournamentSeasonCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TournamentSeasonCopyWith<$R, $In extends TournamentSeason, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get participantTeamUids;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get generationWarnings;
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get categoryWarnings;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get categoryRulesSnapshot;
  $R call({
    String? uid,
    String? tournamentUid,
    String? name,
    TournamentSeasonStatus? status,
    SeasonGenerationStatus? generationStatus,
    List<String>? participantTeamUids,
    List<Map<String, dynamic>>? generationWarnings,
    List<Map<String, dynamic>>? categoryWarnings,
    Map<String, dynamic>? categoryRulesSnapshot,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime? updatedAt,
  });
  TournamentSeasonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TournamentSeasonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TournamentSeason, $Out>
    implements TournamentSeasonCopyWith<$R, TournamentSeason, $Out> {
  _TournamentSeasonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TournamentSeason> $mapper =
      TournamentSeasonMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get participantTeamUids => ListCopyWith(
    $value.participantTeamUids,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(participantTeamUids: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get generationWarnings => ListCopyWith(
    $value.generationWarnings,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(generationWarnings: v),
  );
  @override
  ListCopyWith<
    $R,
    Map<String, dynamic>,
    ObjectCopyWith<$R, Map<String, dynamic>, Map<String, dynamic>>
  >
  get categoryWarnings => ListCopyWith(
    $value.categoryWarnings,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(categoryWarnings: v),
  );
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get categoryRulesSnapshot => $value.categoryRulesSnapshot != null
      ? MapCopyWith(
          $value.categoryRulesSnapshot!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(categoryRulesSnapshot: v),
        )
      : null;
  @override
  $R call({
    String? uid,
    String? tournamentUid,
    String? name,
    TournamentSeasonStatus? status,
    SeasonGenerationStatus? generationStatus,
    List<String>? participantTeamUids,
    List<Map<String, dynamic>>? generationWarnings,
    List<Map<String, dynamic>>? categoryWarnings,
    Object? categoryRulesSnapshot = $none,
    Object? startedAt = $none,
    Object? completedAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (tournamentUid != null) #tournamentUid: tournamentUid,
      if (name != null) #name: name,
      if (status != null) #status: status,
      if (generationStatus != null) #generationStatus: generationStatus,
      if (participantTeamUids != null)
        #participantTeamUids: participantTeamUids,
      if (generationWarnings != null) #generationWarnings: generationWarnings,
      if (categoryWarnings != null) #categoryWarnings: categoryWarnings,
      if (categoryRulesSnapshot != $none)
        #categoryRulesSnapshot: categoryRulesSnapshot,
      if (startedAt != $none) #startedAt: startedAt,
      if (completedAt != $none) #completedAt: completedAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  TournamentSeason $make(CopyWithData data) => TournamentSeason(
    uid: data.get(#uid, or: $value.uid),
    tournamentUid: data.get(#tournamentUid, or: $value.tournamentUid),
    name: data.get(#name, or: $value.name),
    status: data.get(#status, or: $value.status),
    generationStatus: data.get(#generationStatus, or: $value.generationStatus),
    participantTeamUids: data.get(
      #participantTeamUids,
      or: $value.participantTeamUids,
    ),
    generationWarnings: data.get(
      #generationWarnings,
      or: $value.generationWarnings,
    ),
    categoryWarnings: data.get(#categoryWarnings, or: $value.categoryWarnings),
    categoryRulesSnapshot: data.get(
      #categoryRulesSnapshot,
      or: $value.categoryRulesSnapshot,
    ),
    startedAt: data.get(#startedAt, or: $value.startedAt),
    completedAt: data.get(#completedAt, or: $value.completedAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  TournamentSeasonCopyWith<$R2, TournamentSeason, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TournamentSeasonCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

