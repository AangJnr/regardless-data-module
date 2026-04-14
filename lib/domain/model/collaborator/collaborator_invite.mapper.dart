// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'collaborator_invite.dart';

class CollaboratorInviteMapper extends ClassMapperBase<CollaboratorInvite> {
  CollaboratorInviteMapper._();

  static CollaboratorInviteMapper? _instance;
  static CollaboratorInviteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CollaboratorInviteMapper._());
      CollaboratorRoleMapper.ensureInitialized();
      InviteStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CollaboratorInvite';

  static String _$uid(CollaboratorInvite v) => v.uid;
  static const Field<CollaboratorInvite, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$email(CollaboratorInvite v) => v.email;
  static const Field<CollaboratorInvite, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$userName(CollaboratorInvite v) => v.userName;
  static const Field<CollaboratorInvite, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String _$name(CollaboratorInvite v) => v.name;
  static const Field<CollaboratorInvite, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: 'Team Name',
  );
  static CollaboratorRole _$collaboratorRole(CollaboratorInvite v) =>
      v.collaboratorRole;
  static const Field<CollaboratorInvite, CollaboratorRole> _f$collaboratorRole =
      Field(
        'collaboratorRole',
        _$collaboratorRole,
        opt: true,
        def: CollaboratorRole.staff,
      );
  static List<String> _$permissions(CollaboratorInvite v) => v.permissions;
  static const Field<CollaboratorInvite, List<String>> _f$permissions = Field(
    'permissions',
    _$permissions,
    opt: true,
    def: const [],
  );
  static String _$invitedByUid(CollaboratorInvite v) => v.invitedByUid;
  static const Field<CollaboratorInvite, String> _f$invitedByUid = Field(
    'invitedByUid',
    _$invitedByUid,
    opt: true,
    def: '',
  );
  static DateTime? _$invitedAt(CollaboratorInvite v) => v.invitedAt;
  static const Field<CollaboratorInvite, DateTime> _f$invitedAt = Field(
    'invitedAt',
    _$invitedAt,
    opt: true,
  );
  static InviteStatus _$status(CollaboratorInvite v) => v.status;
  static const Field<CollaboratorInvite, InviteStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: InviteStatus.pending,
  );

  @override
  final MappableFields<CollaboratorInvite> fields = const {
    #uid: _f$uid,
    #email: _f$email,
    #userName: _f$userName,
    #name: _f$name,
    #collaboratorRole: _f$collaboratorRole,
    #permissions: _f$permissions,
    #invitedByUid: _f$invitedByUid,
    #invitedAt: _f$invitedAt,
    #status: _f$status,
  };

  static CollaboratorInvite _instantiate(DecodingData data) {
    return CollaboratorInvite(
      uid: data.dec(_f$uid),
      email: data.dec(_f$email),
      userName: data.dec(_f$userName),
      name: data.dec(_f$name),
      collaboratorRole: data.dec(_f$collaboratorRole),
      permissions: data.dec(_f$permissions),
      invitedByUid: data.dec(_f$invitedByUid),
      invitedAt: data.dec(_f$invitedAt),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CollaboratorInvite fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CollaboratorInvite>(map);
  }

  static CollaboratorInvite fromJson(String json) {
    return ensureInitialized().decodeJson<CollaboratorInvite>(json);
  }
}

mixin CollaboratorInviteMappable {
  String toJson() {
    return CollaboratorInviteMapper.ensureInitialized()
        .encodeJson<CollaboratorInvite>(this as CollaboratorInvite);
  }

  Map<String, dynamic> toMap() {
    return CollaboratorInviteMapper.ensureInitialized()
        .encodeMap<CollaboratorInvite>(this as CollaboratorInvite);
  }

  CollaboratorInviteCopyWith<
    CollaboratorInvite,
    CollaboratorInvite,
    CollaboratorInvite
  >
  get copyWith =>
      _CollaboratorInviteCopyWithImpl<CollaboratorInvite, CollaboratorInvite>(
        this as CollaboratorInvite,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CollaboratorInviteMapper.ensureInitialized().stringifyValue(
      this as CollaboratorInvite,
    );
  }

  @override
  bool operator ==(Object other) {
    return CollaboratorInviteMapper.ensureInitialized().equalsValue(
      this as CollaboratorInvite,
      other,
    );
  }

  @override
  int get hashCode {
    return CollaboratorInviteMapper.ensureInitialized().hashValue(
      this as CollaboratorInvite,
    );
  }
}

extension CollaboratorInviteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CollaboratorInvite, $Out> {
  CollaboratorInviteCopyWith<$R, CollaboratorInvite, $Out>
  get $asCollaboratorInvite => $base.as(
    (v, t, t2) => _CollaboratorInviteCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CollaboratorInviteCopyWith<
  $R,
  $In extends CollaboratorInvite,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get permissions;
  $R call({
    String? uid,
    String? email,
    String? userName,
    String? name,
    CollaboratorRole? collaboratorRole,
    List<String>? permissions,
    String? invitedByUid,
    DateTime? invitedAt,
    InviteStatus? status,
  });
  CollaboratorInviteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CollaboratorInviteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CollaboratorInvite, $Out>
    implements CollaboratorInviteCopyWith<$R, CollaboratorInvite, $Out> {
  _CollaboratorInviteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CollaboratorInvite> $mapper =
      CollaboratorInviteMapper.ensureInitialized();
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
    CollaboratorRole? collaboratorRole,
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
      if (collaboratorRole != null) #collaboratorRole: collaboratorRole,
      if (permissions != null) #permissions: permissions,
      if (invitedByUid != null) #invitedByUid: invitedByUid,
      if (invitedAt != $none) #invitedAt: invitedAt,
      if (status != null) #status: status,
    }),
  );
  @override
  CollaboratorInvite $make(CopyWithData data) => CollaboratorInvite(
    uid: data.get(#uid, or: $value.uid),
    email: data.get(#email, or: $value.email),
    userName: data.get(#userName, or: $value.userName),
    name: data.get(#name, or: $value.name),
    collaboratorRole: data.get(#collaboratorRole, or: $value.collaboratorRole),
    permissions: data.get(#permissions, or: $value.permissions),
    invitedByUid: data.get(#invitedByUid, or: $value.invitedByUid),
    invitedAt: data.get(#invitedAt, or: $value.invitedAt),
    status: data.get(#status, or: $value.status),
  );

  @override
  CollaboratorInviteCopyWith<$R2, CollaboratorInvite, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CollaboratorInviteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

