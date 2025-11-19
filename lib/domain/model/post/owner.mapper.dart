// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'owner.dart';

class OwnerMapper extends ClassMapperBase<Owner> {
  OwnerMapper._();

  static OwnerMapper? _instance;
  static OwnerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OwnerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Owner';

  static String _$uid(Owner v) => v.uid;
  static const Field<Owner, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: "",
  );
  static String _$userName(Owner v) => v.userName;
  static const Field<Owner, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: "",
  );
  static String _$imageUrl(Owner v) => v.imageUrl;
  static const Field<Owner, String> _f$imageUrl = Field(
    'imageUrl',
    _$imageUrl,
    opt: true,
    def: "",
  );
  static bool _$isVerified(Owner v) => v.isVerified;
  static const Field<Owner, bool> _f$isVerified = Field(
    'isVerified',
    _$isVerified,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<Owner> fields = const {
    #uid: _f$uid,
    #userName: _f$userName,
    #imageUrl: _f$imageUrl,
    #isVerified: _f$isVerified,
  };

  static Owner _instantiate(DecodingData data) {
    return Owner(
      uid: data.dec(_f$uid),
      userName: data.dec(_f$userName),
      imageUrl: data.dec(_f$imageUrl),
      isVerified: data.dec(_f$isVerified),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Owner fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Owner>(map);
  }

  static Owner fromJson(String json) {
    return ensureInitialized().decodeJson<Owner>(json);
  }
}

mixin OwnerMappable {
  String toJson() {
    return OwnerMapper.ensureInitialized().encodeJson<Owner>(this as Owner);
  }

  Map<String, dynamic> toMap() {
    return OwnerMapper.ensureInitialized().encodeMap<Owner>(this as Owner);
  }

  OwnerCopyWith<Owner, Owner, Owner> get copyWith =>
      _OwnerCopyWithImpl<Owner, Owner>(this as Owner, $identity, $identity);
  @override
  String toString() {
    return OwnerMapper.ensureInitialized().stringifyValue(this as Owner);
  }

  @override
  bool operator ==(Object other) {
    return OwnerMapper.ensureInitialized().equalsValue(this as Owner, other);
  }

  @override
  int get hashCode {
    return OwnerMapper.ensureInitialized().hashValue(this as Owner);
  }
}

extension OwnerValueCopy<$R, $Out> on ObjectCopyWith<$R, Owner, $Out> {
  OwnerCopyWith<$R, Owner, $Out> get $asOwner =>
      $base.as((v, t, t2) => _OwnerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OwnerCopyWith<$R, $In extends Owner, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? uid, String? userName, String? imageUrl, bool? isVerified});
  OwnerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OwnerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Owner, $Out>
    implements OwnerCopyWith<$R, Owner, $Out> {
  _OwnerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Owner> $mapper = OwnerMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? userName,
    String? imageUrl,
    bool? isVerified,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (userName != null) #userName: userName,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (isVerified != null) #isVerified: isVerified,
    }),
  );
  @override
  Owner $make(CopyWithData data) => Owner(
    uid: data.get(#uid, or: $value.uid),
    userName: data.get(#userName, or: $value.userName),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    isVerified: data.get(#isVerified, or: $value.isVerified),
  );

  @override
  OwnerCopyWith<$R2, Owner, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OwnerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

