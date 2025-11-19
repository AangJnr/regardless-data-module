// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'new_user.dart';

class NewUserMapper extends ClassMapperBase<NewUser> {
  NewUserMapper._();

  static NewUserMapper? _instance;
  static NewUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewUserMapper._());
      GenderMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NewUser';

  static String _$email(NewUser v) => v.email;
  static const Field<NewUser, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$fullName(NewUser v) => v.fullName;
  static const Field<NewUser, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: 'Regardless User',
  );
  static String _$phone(NewUser v) => v.phone;
  static const Field<NewUser, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
    def: '',
  );
  static String _$picture(NewUser v) => v.picture;
  static const Field<NewUser, String> _f$picture = Field(
    'picture',
    _$picture,
    opt: true,
    def: '',
  );
  static String _$userName(NewUser v) => v.userName;
  static const Field<NewUser, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String? _$categoryUid(NewUser v) => v.categoryUid;
  static const Field<NewUser, String> _f$categoryUid = Field(
    'categoryUid',
    _$categoryUid,
    opt: true,
  );
  static bool _$isProvider(NewUser v) => v.isProvider;
  static const Field<NewUser, bool> _f$isProvider = Field(
    'isProvider',
    _$isProvider,
    opt: true,
    def: false,
  );
  static String _$defaultProfileUid(NewUser v) => v.defaultProfileUid;
  static const Field<NewUser, String> _f$defaultProfileUid = Field(
    'defaultProfileUid',
    _$defaultProfileUid,
    opt: true,
    def: '',
  );
  static Gender _$gender(NewUser v) => v.gender;
  static const Field<NewUser, Gender> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
    def: Gender.Unsure,
  );
  static List<String> _$privateCommunities(NewUser v) => v.privateCommunities;
  static const Field<NewUser, List<String>> _f$privateCommunities = Field(
    'privateCommunities',
    _$privateCommunities,
    opt: true,
    def: const [],
  );
  static List<String> _$publicCommunities(NewUser v) => v.publicCommunities;
  static const Field<NewUser, List<String>> _f$publicCommunities = Field(
    'publicCommunities',
    _$publicCommunities,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<NewUser> fields = const {
    #email: _f$email,
    #fullName: _f$fullName,
    #phone: _f$phone,
    #picture: _f$picture,
    #userName: _f$userName,
    #categoryUid: _f$categoryUid,
    #isProvider: _f$isProvider,
    #defaultProfileUid: _f$defaultProfileUid,
    #gender: _f$gender,
    #privateCommunities: _f$privateCommunities,
    #publicCommunities: _f$publicCommunities,
  };

  static NewUser _instantiate(DecodingData data) {
    return NewUser(
      email: data.dec(_f$email),
      fullName: data.dec(_f$fullName),
      phone: data.dec(_f$phone),
      picture: data.dec(_f$picture),
      userName: data.dec(_f$userName),
      categoryUid: data.dec(_f$categoryUid),
      isProvider: data.dec(_f$isProvider),
      defaultProfileUid: data.dec(_f$defaultProfileUid),
      gender: data.dec(_f$gender),
      privateCommunities: data.dec(_f$privateCommunities),
      publicCommunities: data.dec(_f$publicCommunities),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NewUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NewUser>(map);
  }

  static NewUser fromJson(String json) {
    return ensureInitialized().decodeJson<NewUser>(json);
  }
}

mixin NewUserMappable {
  String toJson() {
    return NewUserMapper.ensureInitialized().encodeJson<NewUser>(
      this as NewUser,
    );
  }

  Map<String, dynamic> toMap() {
    return NewUserMapper.ensureInitialized().encodeMap<NewUser>(
      this as NewUser,
    );
  }

  NewUserCopyWith<NewUser, NewUser, NewUser> get copyWith =>
      _NewUserCopyWithImpl<NewUser, NewUser>(
        this as NewUser,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NewUserMapper.ensureInitialized().stringifyValue(this as NewUser);
  }

  @override
  bool operator ==(Object other) {
    return NewUserMapper.ensureInitialized().equalsValue(
      this as NewUser,
      other,
    );
  }

  @override
  int get hashCode {
    return NewUserMapper.ensureInitialized().hashValue(this as NewUser);
  }
}

extension NewUserValueCopy<$R, $Out> on ObjectCopyWith<$R, NewUser, $Out> {
  NewUserCopyWith<$R, NewUser, $Out> get $asNewUser =>
      $base.as((v, t, t2) => _NewUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NewUserCopyWith<$R, $In extends NewUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get privateCommunities;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get publicCommunities;
  $R call({
    String? email,
    String? fullName,
    String? phone,
    String? picture,
    String? userName,
    String? categoryUid,
    bool? isProvider,
    String? defaultProfileUid,
    Gender? gender,
    List<String>? privateCommunities,
    List<String>? publicCommunities,
  });
  NewUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NewUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NewUser, $Out>
    implements NewUserCopyWith<$R, NewUser, $Out> {
  _NewUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewUser> $mapper =
      NewUserMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get privateCommunities => ListCopyWith(
    $value.privateCommunities,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(privateCommunities: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get publicCommunities => ListCopyWith(
    $value.publicCommunities,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(publicCommunities: v),
  );
  @override
  $R call({
    String? email,
    String? fullName,
    String? phone,
    String? picture,
    String? userName,
    Object? categoryUid = $none,
    bool? isProvider,
    String? defaultProfileUid,
    Gender? gender,
    List<String>? privateCommunities,
    List<String>? publicCommunities,
  }) => $apply(
    FieldCopyWithData({
      if (email != null) #email: email,
      if (fullName != null) #fullName: fullName,
      if (phone != null) #phone: phone,
      if (picture != null) #picture: picture,
      if (userName != null) #userName: userName,
      if (categoryUid != $none) #categoryUid: categoryUid,
      if (isProvider != null) #isProvider: isProvider,
      if (defaultProfileUid != null) #defaultProfileUid: defaultProfileUid,
      if (gender != null) #gender: gender,
      if (privateCommunities != null) #privateCommunities: privateCommunities,
      if (publicCommunities != null) #publicCommunities: publicCommunities,
    }),
  );
  @override
  NewUser $make(CopyWithData data) => NewUser(
    email: data.get(#email, or: $value.email),
    fullName: data.get(#fullName, or: $value.fullName),
    phone: data.get(#phone, or: $value.phone),
    picture: data.get(#picture, or: $value.picture),
    userName: data.get(#userName, or: $value.userName),
    categoryUid: data.get(#categoryUid, or: $value.categoryUid),
    isProvider: data.get(#isProvider, or: $value.isProvider),
    defaultProfileUid: data.get(
      #defaultProfileUid,
      or: $value.defaultProfileUid,
    ),
    gender: data.get(#gender, or: $value.gender),
    privateCommunities: data.get(
      #privateCommunities,
      or: $value.privateCommunities,
    ),
    publicCommunities: data.get(
      #publicCommunities,
      or: $value.publicCommunities,
    ),
  );

  @override
  NewUserCopyWith<$R2, NewUser, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NewUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

