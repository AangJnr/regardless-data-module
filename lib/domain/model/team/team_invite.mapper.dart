// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_invite.dart';

class TeamRoleMapper extends EnumMapper<TeamRole> {
  TeamRoleMapper._();

  static TeamRoleMapper? _instance;
  static TeamRoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamRoleMapper._());
    }
    return _instance!;
  }

  static TeamRole fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TeamRole decode(dynamic value) {
    switch (value) {
      case r'player':
        return TeamRole.player;
      case r'manager':
        return TeamRole.manager;
      case r'coach':
        return TeamRole.coach;
      case r'owner':
        return TeamRole.owner;
      case r'collaborator':
        return TeamRole.collaborator;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TeamRole self) {
    switch (self) {
      case TeamRole.player:
        return r'player';
      case TeamRole.manager:
        return r'manager';
      case TeamRole.coach:
        return r'coach';
      case TeamRole.owner:
        return r'owner';
      case TeamRole.collaborator:
        return r'collaborator';
    }
  }
}

extension TeamRoleMapperExtension on TeamRole {
  String toValue() {
    TeamRoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TeamRole>(this) as String;
  }
}

class InviteStatusMapper extends EnumMapper<InviteStatus> {
  InviteStatusMapper._();

  static InviteStatusMapper? _instance;
  static InviteStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InviteStatusMapper._());
    }
    return _instance!;
  }

  static InviteStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  InviteStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return InviteStatus.pending;
      case r'accepted':
        return InviteStatus.accepted;
      case r'completed':
        return InviteStatus.completed;
      case r'expired':
        return InviteStatus.expired;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(InviteStatus self) {
    switch (self) {
      case InviteStatus.pending:
        return r'pending';
      case InviteStatus.accepted:
        return r'accepted';
      case InviteStatus.completed:
        return r'completed';
      case InviteStatus.expired:
        return r'expired';
    }
  }
}

extension InviteStatusMapperExtension on InviteStatus {
  String toValue() {
    InviteStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<InviteStatus>(this) as String;
  }
}

class TeamInviteMapper extends ClassMapperBase<TeamInvite> {
  TeamInviteMapper._();

  static TeamInviteMapper? _instance;
  static TeamInviteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamInviteMapper._());
      TeamRoleMapper.ensureInitialized();
      InviteStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamInvite';

  static String _$uid(TeamInvite v) => v.uid;
  static const Field<TeamInvite, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$email(TeamInvite v) => v.email;
  static const Field<TeamInvite, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$userName(TeamInvite v) => v.userName;
  static const Field<TeamInvite, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String _$name(TeamInvite v) => v.name;
  static const Field<TeamInvite, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: 'Team Name',
  );
  static TeamRole _$role(TeamInvite v) => v.role;
  static const Field<TeamInvite, TeamRole> _f$role = Field(
    'role',
    _$role,
    opt: true,
    def: TeamRole.player,
  );
  static List<String> _$permissions(TeamInvite v) => v.permissions;
  static const Field<TeamInvite, List<String>> _f$permissions = Field(
    'permissions',
    _$permissions,
    opt: true,
    def: const [],
  );
  static String _$invitedByUid(TeamInvite v) => v.invitedByUid;
  static const Field<TeamInvite, String> _f$invitedByUid = Field(
    'invitedByUid',
    _$invitedByUid,
    opt: true,
    def: '',
  );
  static DateTime? _$invitedAt(TeamInvite v) => v.invitedAt;
  static const Field<TeamInvite, DateTime> _f$invitedAt = Field(
    'invitedAt',
    _$invitedAt,
    opt: true,
  );
  static InviteStatus _$status(TeamInvite v) => v.status;
  static const Field<TeamInvite, InviteStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: InviteStatus.pending,
  );

  @override
  final MappableFields<TeamInvite> fields = const {
    #uid: _f$uid,
    #email: _f$email,
    #userName: _f$userName,
    #name: _f$name,
    #role: _f$role,
    #permissions: _f$permissions,
    #invitedByUid: _f$invitedByUid,
    #invitedAt: _f$invitedAt,
    #status: _f$status,
  };

  static TeamInvite _instantiate(DecodingData data) {
    return TeamInvite(
      uid: data.dec(_f$uid),
      email: data.dec(_f$email),
      userName: data.dec(_f$userName),
      name: data.dec(_f$name),
      role: data.dec(_f$role),
      permissions: data.dec(_f$permissions),
      invitedByUid: data.dec(_f$invitedByUid),
      invitedAt: data.dec(_f$invitedAt),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TeamInvite fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamInvite>(map);
  }

  static TeamInvite fromJson(String json) {
    return ensureInitialized().decodeJson<TeamInvite>(json);
  }
}

mixin TeamInviteMappable {
  String toJson() {
    return TeamInviteMapper.ensureInitialized().encodeJson<TeamInvite>(
      this as TeamInvite,
    );
  }

  Map<String, dynamic> toMap() {
    return TeamInviteMapper.ensureInitialized().encodeMap<TeamInvite>(
      this as TeamInvite,
    );
  }

  TeamInviteCopyWith<TeamInvite, TeamInvite, TeamInvite> get copyWith =>
      _TeamInviteCopyWithImpl<TeamInvite, TeamInvite>(
        this as TeamInvite,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TeamInviteMapper.ensureInitialized().stringifyValue(
      this as TeamInvite,
    );
  }

  @override
  bool operator ==(Object other) {
    return TeamInviteMapper.ensureInitialized().equalsValue(
      this as TeamInvite,
      other,
    );
  }

  @override
  int get hashCode {
    return TeamInviteMapper.ensureInitialized().hashValue(this as TeamInvite);
  }
}

extension TeamInviteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamInvite, $Out> {
  TeamInviteCopyWith<$R, TeamInvite, $Out> get $asTeamInvite =>
      $base.as((v, t, t2) => _TeamInviteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamInviteCopyWith<$R, $In extends TeamInvite, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get permissions;
  $R call({
    String? uid,
    String? email,
    String? userName,
    String? name,
    TeamRole? role,
    List<String>? permissions,
    String? invitedByUid,
    DateTime? invitedAt,
    InviteStatus? status,
  });
  TeamInviteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamInviteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamInvite, $Out>
    implements TeamInviteCopyWith<$R, TeamInvite, $Out> {
  _TeamInviteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamInvite> $mapper =
      TeamInviteMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get permissions => ListCopyWith(
    $value.permissions,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(permissions: v),
  );
  @override
  $R call({
    String? uid,
    String? email,
    String? userName,
    String? name,
    TeamRole? role,
    List<String>? permissions,
    String? invitedByUid,
    Object? invitedAt = $none,
    InviteStatus? status,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (email != null) #email: email,
      if (userName != null) #userName: userName,
      if (name != null) #name: name,
      if (role != null) #role: role,
      if (permissions != null) #permissions: permissions,
      if (invitedByUid != null) #invitedByUid: invitedByUid,
      if (invitedAt != $none) #invitedAt: invitedAt,
      if (status != null) #status: status,
    }),
  );
  @override
  TeamInvite $make(CopyWithData data) => TeamInvite(
    uid: data.get(#uid, or: $value.uid),
    email: data.get(#email, or: $value.email),
    userName: data.get(#userName, or: $value.userName),
    name: data.get(#name, or: $value.name),
    role: data.get(#role, or: $value.role),
    permissions: data.get(#permissions, or: $value.permissions),
    invitedByUid: data.get(#invitedByUid, or: $value.invitedByUid),
    invitedAt: data.get(#invitedAt, or: $value.invitedAt),
    status: data.get(#status, or: $value.status),
  );

  @override
  TeamInviteCopyWith<$R2, TeamInvite, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TeamInviteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

