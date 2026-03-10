// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'member.dart';

class MemberMapper extends ClassMapperBase<Member> {
  MemberMapper._();

  static MemberMapper? _instance;
  static MemberMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MemberMapper._());
      AUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Member';

  static String _$uid(Member v) => v.uid;
  static const Field<Member, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$userName(Member v) => v.userName;
  static const Field<Member, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static AUser _$profile(Member v) => v.profile;
  static const Field<Member, AUser> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
    def: const AUser(),
  );
  static DateTime? _$joinedAt(Member v) => v.joinedAt;
  static const Field<Member, DateTime> _f$joinedAt = Field(
    'joinedAt',
    _$joinedAt,
    opt: true,
  );
  static DateTime? _$requestedAt(Member v) => v.requestedAt;
  static const Field<Member, DateTime> _f$requestedAt = Field(
    'requestedAt',
    _$requestedAt,
    opt: true,
  );
  static DateTime? _$confirmedAt(Member v) => v.confirmedAt;
  static const Field<Member, DateTime> _f$confirmedAt = Field(
    'confirmedAt',
    _$confirmedAt,
    opt: true,
  );

  @override
  final MappableFields<Member> fields = const {
    #uid: _f$uid,
    #userName: _f$userName,
    #profile: _f$profile,
    #joinedAt: _f$joinedAt,
    #requestedAt: _f$requestedAt,
    #confirmedAt: _f$confirmedAt,
  };

  static Member _instantiate(DecodingData data) {
    return Member(
      uid: data.dec(_f$uid),
      userName: data.dec(_f$userName),
      profile: data.dec(_f$profile),
      joinedAt: data.dec(_f$joinedAt),
      requestedAt: data.dec(_f$requestedAt),
      confirmedAt: data.dec(_f$confirmedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Member fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Member>(map);
  }

  static Member fromJson(String json) {
    return ensureInitialized().decodeJson<Member>(json);
  }
}

mixin MemberMappable {
  String toJson() {
    return MemberMapper.ensureInitialized().encodeJson<Member>(this as Member);
  }

  Map<String, dynamic> toMap() {
    return MemberMapper.ensureInitialized().encodeMap<Member>(this as Member);
  }

  MemberCopyWith<Member, Member, Member> get copyWith =>
      _MemberCopyWithImpl<Member, Member>(this as Member, $identity, $identity);
  @override
  String toString() {
    return MemberMapper.ensureInitialized().stringifyValue(this as Member);
  }

  @override
  bool operator ==(Object other) {
    return MemberMapper.ensureInitialized().equalsValue(this as Member, other);
  }

  @override
  int get hashCode {
    return MemberMapper.ensureInitialized().hashValue(this as Member);
  }
}

extension MemberValueCopy<$R, $Out> on ObjectCopyWith<$R, Member, $Out> {
  MemberCopyWith<$R, Member, $Out> get $asMember =>
      $base.as((v, t, t2) => _MemberCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MemberCopyWith<$R, $In extends Member, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AUserCopyWith<$R, AUser, AUser> get profile;
  $R call({
    String? uid,
    String? userName,
    AUser? profile,
    DateTime? joinedAt,
    DateTime? requestedAt,
    DateTime? confirmedAt,
  });
  MemberCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MemberCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Member, $Out>
    implements MemberCopyWith<$R, Member, $Out> {
  _MemberCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Member> $mapper = MemberMapper.ensureInitialized();
  @override
  AUserCopyWith<$R, AUser, AUser> get profile =>
      $value.profile.copyWith.$chain((v) => call(profile: v));
  @override
  $R call({
    String? uid,
    String? userName,
    AUser? profile,
    Object? joinedAt = $none,
    Object? requestedAt = $none,
    Object? confirmedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (userName != null) #userName: userName,
      if (profile != null) #profile: profile,
      if (joinedAt != $none) #joinedAt: joinedAt,
      if (requestedAt != $none) #requestedAt: requestedAt,
      if (confirmedAt != $none) #confirmedAt: confirmedAt,
    }),
  );
  @override
  Member $make(CopyWithData data) => Member(
    uid: data.get(#uid, or: $value.uid),
    userName: data.get(#userName, or: $value.userName),
    profile: data.get(#profile, or: $value.profile),
    joinedAt: data.get(#joinedAt, or: $value.joinedAt),
    requestedAt: data.get(#requestedAt, or: $value.requestedAt),
    confirmedAt: data.get(#confirmedAt, or: $value.confirmedAt),
  );

  @override
  MemberCopyWith<$R2, Member, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MemberCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

