// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_member.dart';

class TeamMemberStatusMapper extends EnumMapper<TeamMemberStatus> {
  TeamMemberStatusMapper._();

  static TeamMemberStatusMapper? _instance;
  static TeamMemberStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamMemberStatusMapper._());
    }
    return _instance!;
  }

  static TeamMemberStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TeamMemberStatus decode(dynamic value) {
    switch (value) {
      case r'active':
        return TeamMemberStatus.active;
      case r'removed':
        return TeamMemberStatus.removed;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TeamMemberStatus self) {
    switch (self) {
      case TeamMemberStatus.active:
        return r'active';
      case TeamMemberStatus.removed:
        return r'removed';
    }
  }
}

extension TeamMemberStatusMapperExtension on TeamMemberStatus {
  String toValue() {
    TeamMemberStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TeamMemberStatus>(this) as String;
  }
}

class TeamMemberMapper extends ClassMapperBase<TeamMember> {
  TeamMemberMapper._();

  static TeamMemberMapper? _instance;
  static TeamMemberMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamMemberMapper._());
      TeamMemberStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamMember';

  static String _$uid(TeamMember v) => v.uid;
  static const Field<TeamMember, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String? _$email(TeamMember v) => v.email;
  static const Field<TeamMember, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String _$userName(TeamMember v) => v.userName;
  static const Field<TeamMember, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String? _$profilePicture(TeamMember v) => v.profilePicture;
  static const Field<TeamMember, String> _f$profilePicture = Field(
    'profilePicture',
    _$profilePicture,
    opt: true,
  );
  static String _$role(TeamMember v) => v.role;
  static const Field<TeamMember, String> _f$role = Field(
    'role',
    _$role,
    opt: true,
    def: 'player',
  );
  static String _$fullName(TeamMember v) => v.fullName;
  static const Field<TeamMember, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: '',
  );
  static DateTime? _$joinedAt(TeamMember v) => v.joinedAt;
  static const Field<TeamMember, DateTime> _f$joinedAt = Field(
    'joinedAt',
    _$joinedAt,
    opt: true,
  );
  static TeamMemberStatus _$status(TeamMember v) => v.status;
  static const Field<TeamMember, TeamMemberStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: TeamMemberStatus.active,
  );

  @override
  final MappableFields<TeamMember> fields = const {
    #uid: _f$uid,
    #email: _f$email,
    #userName: _f$userName,
    #profilePicture: _f$profilePicture,
    #role: _f$role,
    #fullName: _f$fullName,
    #joinedAt: _f$joinedAt,
    #status: _f$status,
  };

  static TeamMember _instantiate(DecodingData data) {
    return TeamMember(
      uid: data.dec(_f$uid),
      email: data.dec(_f$email),
      userName: data.dec(_f$userName),
      profilePicture: data.dec(_f$profilePicture),
      role: data.dec(_f$role),
      fullName: data.dec(_f$fullName),
      joinedAt: data.dec(_f$joinedAt),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TeamMember fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamMember>(map);
  }

  static TeamMember fromJson(String json) {
    return ensureInitialized().decodeJson<TeamMember>(json);
  }
}

mixin TeamMemberMappable {
  String toJson() {
    return TeamMemberMapper.ensureInitialized().encodeJson<TeamMember>(
      this as TeamMember,
    );
  }

  Map<String, dynamic> toMap() {
    return TeamMemberMapper.ensureInitialized().encodeMap<TeamMember>(
      this as TeamMember,
    );
  }

  TeamMemberCopyWith<TeamMember, TeamMember, TeamMember> get copyWith =>
      _TeamMemberCopyWithImpl<TeamMember, TeamMember>(
        this as TeamMember,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TeamMemberMapper.ensureInitialized().stringifyValue(
      this as TeamMember,
    );
  }

  @override
  bool operator ==(Object other) {
    return TeamMemberMapper.ensureInitialized().equalsValue(
      this as TeamMember,
      other,
    );
  }

  @override
  int get hashCode {
    return TeamMemberMapper.ensureInitialized().hashValue(this as TeamMember);
  }
}

extension TeamMemberValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamMember, $Out> {
  TeamMemberCopyWith<$R, TeamMember, $Out> get $asTeamMember =>
      $base.as((v, t, t2) => _TeamMemberCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamMemberCopyWith<$R, $In extends TeamMember, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? email,
    String? userName,
    String? profilePicture,
    String? role,
    String? fullName,
    DateTime? joinedAt,
    TeamMemberStatus? status,
  });
  TeamMemberCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamMemberCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamMember, $Out>
    implements TeamMemberCopyWith<$R, TeamMember, $Out> {
  _TeamMemberCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamMember> $mapper =
      TeamMemberMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    Object? email = $none,
    String? userName,
    Object? profilePicture = $none,
    String? role,
    String? fullName,
    Object? joinedAt = $none,
    TeamMemberStatus? status,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (email != $none) #email: email,
      if (userName != null) #userName: userName,
      if (profilePicture != $none) #profilePicture: profilePicture,
      if (role != null) #role: role,
      if (fullName != null) #fullName: fullName,
      if (joinedAt != $none) #joinedAt: joinedAt,
      if (status != null) #status: status,
    }),
  );
  @override
  TeamMember $make(CopyWithData data) => TeamMember(
    uid: data.get(#uid, or: $value.uid),
    email: data.get(#email, or: $value.email),
    userName: data.get(#userName, or: $value.userName),
    profilePicture: data.get(#profilePicture, or: $value.profilePicture),
    role: data.get(#role, or: $value.role),
    fullName: data.get(#fullName, or: $value.fullName),
    joinedAt: data.get(#joinedAt, or: $value.joinedAt),
    status: data.get(#status, or: $value.status),
  );

  @override
  TeamMemberCopyWith<$R2, TeamMember, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TeamMemberCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

