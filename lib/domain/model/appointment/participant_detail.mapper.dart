// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'participant_detail.dart';

class ParticipantDetailMapper extends ClassMapperBase<ParticipantDetail> {
  ParticipantDetailMapper._();

  static ParticipantDetailMapper? _instance;
  static ParticipantDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ParticipantDetailMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ParticipantDetail';

  static String _$uid(ParticipantDetail v) => v.uid;
  static const Field<ParticipantDetail, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$userName(ParticipantDetail v) => v.userName;
  static const Field<ParticipantDetail, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String _$fullName(ParticipantDetail v) => v.fullName;
  static const Field<ParticipantDetail, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ParticipantDetail> fields = const {
    #uid: _f$uid,
    #userName: _f$userName,
    #fullName: _f$fullName,
  };

  static ParticipantDetail _instantiate(DecodingData data) {
    return ParticipantDetail(
      uid: data.dec(_f$uid),
      userName: data.dec(_f$userName),
      fullName: data.dec(_f$fullName),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ParticipantDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ParticipantDetail>(map);
  }

  static ParticipantDetail fromJson(String json) {
    return ensureInitialized().decodeJson<ParticipantDetail>(json);
  }
}

mixin ParticipantDetailMappable {
  String toJson() {
    return ParticipantDetailMapper.ensureInitialized()
        .encodeJson<ParticipantDetail>(this as ParticipantDetail);
  }

  Map<String, dynamic> toMap() {
    return ParticipantDetailMapper.ensureInitialized()
        .encodeMap<ParticipantDetail>(this as ParticipantDetail);
  }

  ParticipantDetailCopyWith<
    ParticipantDetail,
    ParticipantDetail,
    ParticipantDetail
  >
  get copyWith =>
      _ParticipantDetailCopyWithImpl<ParticipantDetail, ParticipantDetail>(
        this as ParticipantDetail,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ParticipantDetailMapper.ensureInitialized().stringifyValue(
      this as ParticipantDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return ParticipantDetailMapper.ensureInitialized().equalsValue(
      this as ParticipantDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return ParticipantDetailMapper.ensureInitialized().hashValue(
      this as ParticipantDetail,
    );
  }
}

extension ParticipantDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ParticipantDetail, $Out> {
  ParticipantDetailCopyWith<$R, ParticipantDetail, $Out>
  get $asParticipantDetail => $base.as(
    (v, t, t2) => _ParticipantDetailCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ParticipantDetailCopyWith<
  $R,
  $In extends ParticipantDetail,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uid, String? userName, String? fullName});
  ParticipantDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ParticipantDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ParticipantDetail, $Out>
    implements ParticipantDetailCopyWith<$R, ParticipantDetail, $Out> {
  _ParticipantDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ParticipantDetail> $mapper =
      ParticipantDetailMapper.ensureInitialized();
  @override
  $R call({String? uid, String? userName, String? fullName}) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (userName != null) #userName: userName,
      if (fullName != null) #fullName: fullName,
    }),
  );
  @override
  ParticipantDetail $make(CopyWithData data) => ParticipantDetail(
    uid: data.get(#uid, or: $value.uid),
    userName: data.get(#userName, or: $value.userName),
    fullName: data.get(#fullName, or: $value.fullName),
  );

  @override
  ParticipantDetailCopyWith<$R2, ParticipantDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ParticipantDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProviderDetailsMapper extends ClassMapperBase<ProviderDetails> {
  ProviderDetailsMapper._();

  static ProviderDetailsMapper? _instance;
  static ProviderDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProviderDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProviderDetails';

  static String _$uid(ProviderDetails v) => v.uid;
  static const Field<ProviderDetails, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$userName(ProviderDetails v) => v.userName;
  static const Field<ProviderDetails, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String? _$phone(ProviderDetails v) => v.phone;
  static const Field<ProviderDetails, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
    def: '',
  );
  static String? _$email(ProviderDetails v) => v.email;
  static const Field<ProviderDetails, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$fullName(ProviderDetails v) => v.fullName;
  static const Field<ProviderDetails, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ProviderDetails> fields = const {
    #uid: _f$uid,
    #userName: _f$userName,
    #phone: _f$phone,
    #email: _f$email,
    #fullName: _f$fullName,
  };

  static ProviderDetails _instantiate(DecodingData data) {
    return ProviderDetails(
      uid: data.dec(_f$uid),
      userName: data.dec(_f$userName),
      phone: data.dec(_f$phone),
      email: data.dec(_f$email),
      fullName: data.dec(_f$fullName),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProviderDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProviderDetails>(map);
  }

  static ProviderDetails fromJson(String json) {
    return ensureInitialized().decodeJson<ProviderDetails>(json);
  }
}

mixin ProviderDetailsMappable {
  String toJson() {
    return ProviderDetailsMapper.ensureInitialized()
        .encodeJson<ProviderDetails>(this as ProviderDetails);
  }

  Map<String, dynamic> toMap() {
    return ProviderDetailsMapper.ensureInitialized().encodeMap<ProviderDetails>(
      this as ProviderDetails,
    );
  }

  ProviderDetailsCopyWith<ProviderDetails, ProviderDetails, ProviderDetails>
  get copyWith =>
      _ProviderDetailsCopyWithImpl<ProviderDetails, ProviderDetails>(
        this as ProviderDetails,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProviderDetailsMapper.ensureInitialized().stringifyValue(
      this as ProviderDetails,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProviderDetailsMapper.ensureInitialized().equalsValue(
      this as ProviderDetails,
      other,
    );
  }

  @override
  int get hashCode {
    return ProviderDetailsMapper.ensureInitialized().hashValue(
      this as ProviderDetails,
    );
  }
}

extension ProviderDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProviderDetails, $Out> {
  ProviderDetailsCopyWith<$R, ProviderDetails, $Out> get $asProviderDetails =>
      $base.as((v, t, t2) => _ProviderDetailsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProviderDetailsCopyWith<$R, $In extends ProviderDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? userName,
    String? phone,
    String? email,
    String? fullName,
  });
  ProviderDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ProviderDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProviderDetails, $Out>
    implements ProviderDetailsCopyWith<$R, ProviderDetails, $Out> {
  _ProviderDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProviderDetails> $mapper =
      ProviderDetailsMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? userName,
    Object? phone = $none,
    Object? email = $none,
    String? fullName,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (userName != null) #userName: userName,
      if (phone != $none) #phone: phone,
      if (email != $none) #email: email,
      if (fullName != null) #fullName: fullName,
    }),
  );
  @override
  ProviderDetails $make(CopyWithData data) => ProviderDetails(
    uid: data.get(#uid, or: $value.uid),
    userName: data.get(#userName, or: $value.userName),
    phone: data.get(#phone, or: $value.phone),
    email: data.get(#email, or: $value.email),
    fullName: data.get(#fullName, or: $value.fullName),
  );

  @override
  ProviderDetailsCopyWith<$R2, ProviderDetails, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProviderDetailsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

