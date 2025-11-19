// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team.dart';

class TeamMapper extends ClassMapperBase<Team> {
  TeamMapper._();

  static TeamMapper? _instance;
  static TeamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Team';

  static String _$uid(Team v) => v.uid;
  static const Field<Team, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$ownerUid(Team v) => v.ownerUid;
  static const Field<Team, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static String _$name(Team v) => v.name;
  static const Field<Team, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String? _$logo(Team v) => v.logo;
  static const Field<Team, String> _f$logo = Field('logo', _$logo, opt: true);
  static String _$sportsCategoryUid(Team v) => v.sportsCategoryUid;
  static const Field<Team, String> _f$sportsCategoryUid = Field(
    'sportsCategoryUid',
    _$sportsCategoryUid,
    opt: true,
    def: '',
  );
  static String? _$sportsCategoryName(Team v) => v.sportsCategoryName;
  static const Field<Team, String> _f$sportsCategoryName = Field(
    'sportsCategoryName',
    _$sportsCategoryName,
    opt: true,
  );
  static String _$bio(Team v) => v.bio;
  static const Field<Team, String> _f$bio = Field(
    'bio',
    _$bio,
    opt: true,
    def: '',
  );
  static String? _$headerUrl(Team v) => v.headerUrl;
  static const Field<Team, String> _f$headerUrl = Field(
    'headerUrl',
    _$headerUrl,
    opt: true,
  );
  static bool _$isPublic(Team v) => v.isPublic;
  static const Field<Team, bool> _f$isPublic = Field(
    'isPublic',
    _$isPublic,
    opt: true,
    def: true,
  );
  static bool _$isArchived(Team v) => v.isArchived;
  static const Field<Team, bool> _f$isArchived = Field(
    'isArchived',
    _$isArchived,
    opt: true,
    def: false,
  );
  static DateTime? _$createdAt(Team v) => v.createdAt;
  static const Field<Team, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Team v) => v.updatedAt;
  static const Field<Team, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<Team> fields = const {
    #uid: _f$uid,
    #ownerUid: _f$ownerUid,
    #name: _f$name,
    #logo: _f$logo,
    #sportsCategoryUid: _f$sportsCategoryUid,
    #sportsCategoryName: _f$sportsCategoryName,
    #bio: _f$bio,
    #headerUrl: _f$headerUrl,
    #isPublic: _f$isPublic,
    #isArchived: _f$isArchived,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static Team _instantiate(DecodingData data) {
    return Team(
      uid: data.dec(_f$uid),
      ownerUid: data.dec(_f$ownerUid),
      name: data.dec(_f$name),
      logo: data.dec(_f$logo),
      sportsCategoryUid: data.dec(_f$sportsCategoryUid),
      sportsCategoryName: data.dec(_f$sportsCategoryName),
      bio: data.dec(_f$bio),
      headerUrl: data.dec(_f$headerUrl),
      isPublic: data.dec(_f$isPublic),
      isArchived: data.dec(_f$isArchived),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Team fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Team>(map);
  }

  static Team fromJson(String json) {
    return ensureInitialized().decodeJson<Team>(json);
  }
}

mixin TeamMappable {
  String toJson() {
    return TeamMapper.ensureInitialized().encodeJson<Team>(this as Team);
  }

  Map<String, dynamic> toMap() {
    return TeamMapper.ensureInitialized().encodeMap<Team>(this as Team);
  }

  TeamCopyWith<Team, Team, Team> get copyWith =>
      _TeamCopyWithImpl<Team, Team>(this as Team, $identity, $identity);
  @override
  String toString() {
    return TeamMapper.ensureInitialized().stringifyValue(this as Team);
  }

  @override
  bool operator ==(Object other) {
    return TeamMapper.ensureInitialized().equalsValue(this as Team, other);
  }

  @override
  int get hashCode {
    return TeamMapper.ensureInitialized().hashValue(this as Team);
  }
}

extension TeamValueCopy<$R, $Out> on ObjectCopyWith<$R, Team, $Out> {
  TeamCopyWith<$R, Team, $Out> get $asTeam =>
      $base.as((v, t, t2) => _TeamCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamCopyWith<$R, $In extends Team, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    String? logo,
    String? sportsCategoryUid,
    String? sportsCategoryName,
    String? bio,
    String? headerUrl,
    bool? isPublic,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  TeamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Team, $Out>
    implements TeamCopyWith<$R, Team, $Out> {
  _TeamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Team> $mapper = TeamMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? ownerUid,
    String? name,
    Object? logo = $none,
    String? sportsCategoryUid,
    Object? sportsCategoryName = $none,
    String? bio,
    Object? headerUrl = $none,
    bool? isPublic,
    bool? isArchived,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (name != null) #name: name,
      if (logo != $none) #logo: logo,
      if (sportsCategoryUid != null) #sportsCategoryUid: sportsCategoryUid,
      if (sportsCategoryName != $none) #sportsCategoryName: sportsCategoryName,
      if (bio != null) #bio: bio,
      if (headerUrl != $none) #headerUrl: headerUrl,
      if (isPublic != null) #isPublic: isPublic,
      if (isArchived != null) #isArchived: isArchived,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  Team $make(CopyWithData data) => Team(
    uid: data.get(#uid, or: $value.uid),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    name: data.get(#name, or: $value.name),
    logo: data.get(#logo, or: $value.logo),
    sportsCategoryUid: data.get(
      #sportsCategoryUid,
      or: $value.sportsCategoryUid,
    ),
    sportsCategoryName: data.get(
      #sportsCategoryName,
      or: $value.sportsCategoryName,
    ),
    bio: data.get(#bio, or: $value.bio),
    headerUrl: data.get(#headerUrl, or: $value.headerUrl),
    isPublic: data.get(#isPublic, or: $value.isPublic),
    isArchived: data.get(#isArchived, or: $value.isArchived),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  TeamCopyWith<$R2, Team, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TeamCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

