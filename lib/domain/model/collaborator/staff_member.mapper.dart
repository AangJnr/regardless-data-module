// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'staff_member.dart';

class StaffMemberMapper extends ClassMapperBase<StaffMember> {
  StaffMemberMapper._();

  static StaffMemberMapper? _instance;
  static StaffMemberMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StaffMemberMapper._());
      CollaboratorRoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StaffMember';

  static String _$uid(StaffMember v) => v.uid;
  static const Field<StaffMember, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$userName(StaffMember v) => v.userName;
  static const Field<StaffMember, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static CollaboratorRole _$role(StaffMember v) => v.role;
  static const Field<StaffMember, CollaboratorRole> _f$role = Field(
    'role',
    _$role,
    opt: true,
    def: CollaboratorRole.staff,
  );
  static List<String> _$permissions(StaffMember v) => v.permissions;
  static const Field<StaffMember, List<String>> _f$permissions = Field(
    'permissions',
    _$permissions,
    opt: true,
    def: const [],
  );
  static DateTime? _$joinedAt(StaffMember v) => v.joinedAt;
  static const Field<StaffMember, DateTime> _f$joinedAt = Field(
    'joinedAt',
    _$joinedAt,
    opt: true,
  );

  @override
  final MappableFields<StaffMember> fields = const {
    #uid: _f$uid,
    #userName: _f$userName,
    #role: _f$role,
    #permissions: _f$permissions,
    #joinedAt: _f$joinedAt,
  };

  static StaffMember _instantiate(DecodingData data) {
    return StaffMember(
      uid: data.dec(_f$uid),
      userName: data.dec(_f$userName),
      role: data.dec(_f$role),
      permissions: data.dec(_f$permissions),
      joinedAt: data.dec(_f$joinedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StaffMember fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StaffMember>(map);
  }

  static StaffMember fromJson(String json) {
    return ensureInitialized().decodeJson<StaffMember>(json);
  }
}

mixin StaffMemberMappable {
  String toJson() {
    return StaffMemberMapper.ensureInitialized().encodeJson<StaffMember>(
      this as StaffMember,
    );
  }

  Map<String, dynamic> toMap() {
    return StaffMemberMapper.ensureInitialized().encodeMap<StaffMember>(
      this as StaffMember,
    );
  }

  StaffMemberCopyWith<StaffMember, StaffMember, StaffMember> get copyWith =>
      _StaffMemberCopyWithImpl<StaffMember, StaffMember>(
        this as StaffMember,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StaffMemberMapper.ensureInitialized().stringifyValue(
      this as StaffMember,
    );
  }

  @override
  bool operator ==(Object other) {
    return StaffMemberMapper.ensureInitialized().equalsValue(
      this as StaffMember,
      other,
    );
  }

  @override
  int get hashCode {
    return StaffMemberMapper.ensureInitialized().hashValue(this as StaffMember);
  }
}

extension StaffMemberValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StaffMember, $Out> {
  StaffMemberCopyWith<$R, StaffMember, $Out> get $asStaffMember =>
      $base.as((v, t, t2) => _StaffMemberCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StaffMemberCopyWith<$R, $In extends StaffMember, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get permissions;
  $R call({
    String? uid,
    String? userName,
    CollaboratorRole? role,
    List<String>? permissions,
    DateTime? joinedAt,
  });
  StaffMemberCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StaffMemberCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StaffMember, $Out>
    implements StaffMemberCopyWith<$R, StaffMember, $Out> {
  _StaffMemberCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StaffMember> $mapper =
      StaffMemberMapper.ensureInitialized();
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
    String? userName,
    CollaboratorRole? role,
    List<String>? permissions,
    Object? joinedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (userName != null) #userName: userName,
      if (role != null) #role: role,
      if (permissions != null) #permissions: permissions,
      if (joinedAt != $none) #joinedAt: joinedAt,
    }),
  );
  @override
  StaffMember $make(CopyWithData data) => StaffMember(
    uid: data.get(#uid, or: $value.uid),
    userName: data.get(#userName, or: $value.userName),
    role: data.get(#role, or: $value.role),
    permissions: data.get(#permissions, or: $value.permissions),
    joinedAt: data.get(#joinedAt, or: $value.joinedAt),
  );

  @override
  StaffMemberCopyWith<$R2, StaffMember, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StaffMemberCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

