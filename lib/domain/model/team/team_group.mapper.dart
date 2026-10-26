// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_group.dart';

class TeamGroupMapper extends ClassMapperBase<TeamGroup> {
  TeamGroupMapper._();

  static TeamGroupMapper? _instance;
  static TeamGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamGroupMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TeamGroup';

  static String _$uid(TeamGroup v) => v.uid;
  static const Field<TeamGroup, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$ownerUid(TeamGroup v) => v.ownerUid;
  static const Field<TeamGroup, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static String _$name(TeamGroup v) => v.name;
  static const Field<TeamGroup, String> _f$name = Field('name', _$name);
  static String _$sportsCategoryUid(TeamGroup v) => v.sportsCategoryUid;
  static const Field<TeamGroup, String> _f$sportsCategoryUid = Field(
    'sportsCategoryUid',
    _$sportsCategoryUid,
  );
  static List<String> _$teamUids(TeamGroup v) => v.teamUids;
  static const Field<TeamGroup, List<String>> _f$teamUids = Field(
    'teamUids',
    _$teamUids,
  );
  static DateTime? _$createdAt(TeamGroup v) => v.createdAt;
  static const Field<TeamGroup, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(TeamGroup v) => v.updatedAt;
  static const Field<TeamGroup, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<TeamGroup> fields = const {
    #uid: _f$uid,
    #ownerUid: _f$ownerUid,
    #name: _f$name,
    #sportsCategoryUid: _f$sportsCategoryUid,
    #teamUids: _f$teamUids,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static TeamGroup _instantiate(DecodingData data) {
    return TeamGroup(
      uid: data.dec(_f$uid),
      ownerUid: data.dec(_f$ownerUid),
      name: data.dec(_f$name),
      sportsCategoryUid: data.dec(_f$sportsCategoryUid),
      teamUids: data.dec(_f$teamUids),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TeamGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamGroup>(map);
  }

  static TeamGroup fromJson(String json) {
    return ensureInitialized().decodeJson<TeamGroup>(json);
  }
}

mixin TeamGroupMappable {
  String toJson() {
    return TeamGroupMapper.ensureInitialized().encodeJson<TeamGroup>(
      this as TeamGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return TeamGroupMapper.ensureInitialized().encodeMap<TeamGroup>(
      this as TeamGroup,
    );
  }

  TeamGroupCopyWith<TeamGroup, TeamGroup, TeamGroup> get copyWith =>
      _TeamGroupCopyWithImpl<TeamGroup, TeamGroup>(
        this as TeamGroup,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TeamGroupMapper.ensureInitialized().stringifyValue(
      this as TeamGroup,
    );
  }

  @override
  bool operator ==(Object other) {
    return TeamGroupMapper.ensureInitialized().equalsValue(
      this as TeamGroup,
      other,
    );
  }

  @override
  int get hashCode {
    return TeamGroupMapper.ensureInitialized().hashValue(this as TeamGroup);
  }
}

extension TeamGroupValueCopy<$R, $Out> on ObjectCopyWith<$R, TeamGroup, $Out> {
  TeamGroupCopyWith<$R, TeamGroup, $Out> get $asTeamGroup =>
      $base.as((v, t, t2) => _TeamGroupCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamGroupCopyWith<$R, $In extends TeamGroup, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get teamUids;
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    String? sportsCategoryUid,
    List<String>? teamUids,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  TeamGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamGroup, $Out>
    implements TeamGroupCopyWith<$R, TeamGroup, $Out> {
  _TeamGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamGroup> $mapper =
      TeamGroupMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get teamUids =>
      ListCopyWith(
        $value.teamUids,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(teamUids: v),
      );
  @override
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    String? sportsCategoryUid,
    List<String>? teamUids,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (name != null) #name: name,
      if (sportsCategoryUid != null) #sportsCategoryUid: sportsCategoryUid,
      if (teamUids != null) #teamUids: teamUids,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  TeamGroup $make(CopyWithData data) => TeamGroup(
    uid: data.get(#uid, or: $value.uid),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    name: data.get(#name, or: $value.name),
    sportsCategoryUid: data.get(
      #sportsCategoryUid,
      or: $value.sportsCategoryUid,
    ),
    teamUids: data.get(#teamUids, or: $value.teamUids),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  TeamGroupCopyWith<$R2, TeamGroup, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TeamGroupCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

