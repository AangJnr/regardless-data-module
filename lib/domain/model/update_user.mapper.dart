// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'update_user.dart';

class UpdateUserMapper extends ClassMapperBase<UpdateUser> {
  UpdateUserMapper._();

  static UpdateUserMapper? _instance;
  static UpdateUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateUserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUser';

  static String _$uid(UpdateUser v) => v.uid;
  static const Field<UpdateUser, String> _f$uid = Field('uid', _$uid);
  static String _$email(UpdateUser v) => v.email;
  static const Field<UpdateUser, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$fullName(UpdateUser v) => v.fullName;
  static const Field<UpdateUser, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: 'Regardless User',
  );
  static String _$phone(UpdateUser v) => v.phone;
  static const Field<UpdateUser, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
    def: '',
  );
  static String _$picture(UpdateUser v) => v.picture;
  static const Field<UpdateUser, String> _f$picture = Field(
    'picture',
    _$picture,
    opt: true,
    def: '',
  );
  static String _$bio(UpdateUser v) => v.bio;
  static const Field<UpdateUser, String> _f$bio = Field(
    'bio',
    _$bio,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<UpdateUser> fields = const {
    #uid: _f$uid,
    #email: _f$email,
    #fullName: _f$fullName,
    #phone: _f$phone,
    #picture: _f$picture,
    #bio: _f$bio,
  };

  static UpdateUser _instantiate(DecodingData data) {
    return UpdateUser(
      uid: data.dec(_f$uid),
      email: data.dec(_f$email),
      fullName: data.dec(_f$fullName),
      phone: data.dec(_f$phone),
      picture: data.dec(_f$picture),
      bio: data.dec(_f$bio),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUser>(map);
  }

  static UpdateUser fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUser>(json);
  }
}

mixin UpdateUserMappable {
  String toJson() {
    return UpdateUserMapper.ensureInitialized().encodeJson<UpdateUser>(
      this as UpdateUser,
    );
  }

  Map<String, dynamic> toMap() {
    return UpdateUserMapper.ensureInitialized().encodeMap<UpdateUser>(
      this as UpdateUser,
    );
  }

  UpdateUserCopyWith<UpdateUser, UpdateUser, UpdateUser> get copyWith =>
      _UpdateUserCopyWithImpl<UpdateUser, UpdateUser>(
        this as UpdateUser,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UpdateUserMapper.ensureInitialized().stringifyValue(
      this as UpdateUser,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserMapper.ensureInitialized().equalsValue(
      this as UpdateUser,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateUserMapper.ensureInitialized().hashValue(this as UpdateUser);
  }
}

extension UpdateUserValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUser, $Out> {
  UpdateUserCopyWith<$R, UpdateUser, $Out> get $asUpdateUser =>
      $base.as((v, t, t2) => _UpdateUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UpdateUserCopyWith<$R, $In extends UpdateUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? email,
    String? fullName,
    String? phone,
    String? picture,
    String? bio,
  });
  UpdateUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UpdateUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUser, $Out>
    implements UpdateUserCopyWith<$R, UpdateUser, $Out> {
  _UpdateUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUser> $mapper =
      UpdateUserMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? email,
    String? fullName,
    String? phone,
    String? picture,
    String? bio,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (email != null) #email: email,
      if (fullName != null) #fullName: fullName,
      if (phone != null) #phone: phone,
      if (picture != null) #picture: picture,
      if (bio != null) #bio: bio,
    }),
  );
  @override
  UpdateUser $make(CopyWithData data) => UpdateUser(
    uid: data.get(#uid, or: $value.uid),
    email: data.get(#email, or: $value.email),
    fullName: data.get(#fullName, or: $value.fullName),
    phone: data.get(#phone, or: $value.phone),
    picture: data.get(#picture, or: $value.picture),
    bio: data.get(#bio, or: $value.bio),
  );

  @override
  UpdateUserCopyWith<$R2, UpdateUser, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UpdateUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

