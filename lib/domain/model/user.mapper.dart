// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user.dart';

class GenderMapper extends EnumMapper<Gender> {
  GenderMapper._();

  static GenderMapper? _instance;
  static GenderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenderMapper._());
    }
    return _instance!;
  }

  static Gender fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Gender decode(dynamic value) {
    switch (value) {
      case r'Male':
        return Gender.Male;
      case r'Female':
        return Gender.Female;
      case r'NonBinary':
        return Gender.NonBinary;
      case r'Unsure':
        return Gender.Unsure;
      case r'RatherNotSay':
        return Gender.RatherNotSay;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Gender self) {
    switch (self) {
      case Gender.Male:
        return r'Male';
      case Gender.Female:
        return r'Female';
      case Gender.NonBinary:
        return r'NonBinary';
      case Gender.Unsure:
        return r'Unsure';
      case Gender.RatherNotSay:
        return r'RatherNotSay';
    }
  }
}

extension GenderMapperExtension on Gender {
  String toValue() {
    GenderMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Gender>(this) as String;
  }
}

class AUserMapper extends ClassMapperBase<AUser> {
  AUserMapper._();

  static AUserMapper? _instance;
  static AUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AUserMapper._());
      GenderMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AUser';

  static String _$uid(AUser v) => v.uid;
  static const Field<AUser, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$email(AUser v) => v.email;
  static const Field<AUser, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: '',
  );
  static String _$fullName(AUser v) => v.fullName;
  static const Field<AUser, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
    def: '',
  );
  static String _$phone(AUser v) => v.phone;
  static const Field<AUser, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(AUser v) => v.createdAt;
  static const Field<AUser, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(AUser v) => v.updatedAt;
  static const Field<AUser, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static bool _$isProvider(AUser v) => v.isProvider;
  static const Field<AUser, bool> _f$isProvider = Field(
    'isProvider',
    _$isProvider,
    opt: true,
    def: false,
  );
  static Gender _$gender(AUser v) => v.gender;
  static const Field<AUser, Gender> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
    def: Gender.Unsure,
  );
  static String _$picture(AUser v) => v.picture;
  static const Field<AUser, String> _f$picture = Field(
    'picture',
    _$picture,
    opt: true,
    def: '',
  );
  static String _$bio(AUser v) => v.bio;
  static const Field<AUser, String> _f$bio = Field(
    'bio',
    _$bio,
    opt: true,
    def: '',
  );
  static String _$userName(AUser v) => v.userName;
  static const Field<AUser, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String _$authUid(AUser v) => v.authUid;
  static const Field<AUser, String> _f$authUid = Field(
    'authUid',
    _$authUid,
    opt: true,
    def: '',
  );
  static bool _$isVerified(AUser v) => v.isVerified;
  static const Field<AUser, bool> _f$isVerified = Field(
    'isVerified',
    _$isVerified,
    opt: true,
    def: false,
  );
  static String _$categoryUid(AUser v) => v.categoryUid;
  static const Field<AUser, String> _f$categoryUid = Field(
    'categoryUid',
    _$categoryUid,
    opt: true,
    def: '',
  );
  static bool _$userNameAlreadyUpdated(AUser v) => v.userNameAlreadyUpdated;
  static const Field<AUser, bool> _f$userNameAlreadyUpdated = Field(
    'userNameAlreadyUpdated',
    _$userNameAlreadyUpdated,
    opt: true,
    def: false,
  );
  static Category? _$category(AUser v) => v.category;
  static const Field<AUser, Category> _f$category = Field(
    'category',
    _$category,
    opt: true,
  );
  static int _$unreadNotificationCount(AUser v) => v.unreadNotificationCount;
  static const Field<AUser, int> _f$unreadNotificationCount = Field(
    'unreadNotificationCount',
    _$unreadNotificationCount,
    opt: true,
    def: 0,
  );
  static int _$reviewsCount(AUser v) => v.reviewsCount;
  static const Field<AUser, int> _f$reviewsCount = Field(
    'reviewsCount',
    _$reviewsCount,
    opt: true,
    def: 0,
  );
  static double _$rating(AUser v) => v.rating;
  static const Field<AUser, double> _f$rating = Field(
    'rating',
    _$rating,
    opt: true,
    def: 5.0,
  );
  static List<String> _$likedPostUids(AUser v) => v.likedPostUids;
  static const Field<AUser, List<String>> _f$likedPostUids = Field(
    'likedPostUids',
    _$likedPostUids,
    opt: true,
    def: const [],
  );
  static List<String> _$favoratesUids(AUser v) => v.favoratesUids;
  static const Field<AUser, List<String>> _f$favoratesUids = Field(
    'favoratesUids',
    _$favoratesUids,
    opt: true,
    def: const [],
  );
  static List<String> _$joinedCommunityUids(AUser v) => v.joinedCommunityUids;
  static const Field<AUser, List<String>> _f$joinedCommunityUids = Field(
    'joinedCommunityUids',
    _$joinedCommunityUids,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<AUser> fields = const {
    #uid: _f$uid,
    #email: _f$email,
    #fullName: _f$fullName,
    #phone: _f$phone,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isProvider: _f$isProvider,
    #gender: _f$gender,
    #picture: _f$picture,
    #bio: _f$bio,
    #userName: _f$userName,
    #authUid: _f$authUid,
    #isVerified: _f$isVerified,
    #categoryUid: _f$categoryUid,
    #userNameAlreadyUpdated: _f$userNameAlreadyUpdated,
    #category: _f$category,
    #unreadNotificationCount: _f$unreadNotificationCount,
    #reviewsCount: _f$reviewsCount,
    #rating: _f$rating,
    #likedPostUids: _f$likedPostUids,
    #favoratesUids: _f$favoratesUids,
    #joinedCommunityUids: _f$joinedCommunityUids,
  };

  static AUser _instantiate(DecodingData data) {
    return AUser(
      uid: data.dec(_f$uid),
      email: data.dec(_f$email),
      fullName: data.dec(_f$fullName),
      phone: data.dec(_f$phone),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      isProvider: data.dec(_f$isProvider),
      gender: data.dec(_f$gender),
      picture: data.dec(_f$picture),
      bio: data.dec(_f$bio),
      userName: data.dec(_f$userName),
      authUid: data.dec(_f$authUid),
      isVerified: data.dec(_f$isVerified),
      categoryUid: data.dec(_f$categoryUid),
      userNameAlreadyUpdated: data.dec(_f$userNameAlreadyUpdated),
      category: data.dec(_f$category),
      unreadNotificationCount: data.dec(_f$unreadNotificationCount),
      reviewsCount: data.dec(_f$reviewsCount),
      rating: data.dec(_f$rating),
      likedPostUids: data.dec(_f$likedPostUids),
      favoratesUids: data.dec(_f$favoratesUids),
      joinedCommunityUids: data.dec(_f$joinedCommunityUids),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AUser>(map);
  }

  static AUser fromJson(String json) {
    return ensureInitialized().decodeJson<AUser>(json);
  }
}

mixin AUserMappable {
  String toJson() {
    return AUserMapper.ensureInitialized().encodeJson<AUser>(this as AUser);
  }

  Map<String, dynamic> toMap() {
    return AUserMapper.ensureInitialized().encodeMap<AUser>(this as AUser);
  }

  AUserCopyWith<AUser, AUser, AUser> get copyWith =>
      _AUserCopyWithImpl<AUser, AUser>(this as AUser, $identity, $identity);
  @override
  String toString() {
    return AUserMapper.ensureInitialized().stringifyValue(this as AUser);
  }

  @override
  bool operator ==(Object other) {
    return AUserMapper.ensureInitialized().equalsValue(this as AUser, other);
  }

  @override
  int get hashCode {
    return AUserMapper.ensureInitialized().hashValue(this as AUser);
  }
}

extension AUserValueCopy<$R, $Out> on ObjectCopyWith<$R, AUser, $Out> {
  AUserCopyWith<$R, AUser, $Out> get $asAUser =>
      $base.as((v, t, t2) => _AUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AUserCopyWith<$R, $In extends AUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CategoryCopyWith<$R, Category, Category>? get category;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get likedPostUids;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get favoratesUids;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get joinedCommunityUids;
  $R call({
    String? uid,
    String? email,
    String? fullName,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isProvider,
    Gender? gender,
    String? picture,
    String? bio,
    String? userName,
    String? authUid,
    bool? isVerified,
    String? categoryUid,
    bool? userNameAlreadyUpdated,
    Category? category,
    int? unreadNotificationCount,
    int? reviewsCount,
    double? rating,
    List<String>? likedPostUids,
    List<String>? favoratesUids,
    List<String>? joinedCommunityUids,
  });
  AUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AUserCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, AUser, $Out>
    implements AUserCopyWith<$R, AUser, $Out> {
  _AUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AUser> $mapper = AUserMapper.ensureInitialized();
  @override
  CategoryCopyWith<$R, Category, Category>? get category =>
      $value.category?.copyWith.$chain((v) => call(category: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get likedPostUids => ListCopyWith(
    $value.likedPostUids,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(likedPostUids: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get favoratesUids => ListCopyWith(
    $value.favoratesUids,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(favoratesUids: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get joinedCommunityUids => ListCopyWith(
    $value.joinedCommunityUids,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(joinedCommunityUids: v),
  );
  @override
  $R call({
    String? uid,
    String? email,
    String? fullName,
    String? phone,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    bool? isProvider,
    Gender? gender,
    String? picture,
    String? bio,
    String? userName,
    String? authUid,
    bool? isVerified,
    String? categoryUid,
    bool? userNameAlreadyUpdated,
    Object? category = $none,
    int? unreadNotificationCount,
    int? reviewsCount,
    double? rating,
    List<String>? likedPostUids,
    List<String>? favoratesUids,
    List<String>? joinedCommunityUids,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (email != null) #email: email,
      if (fullName != null) #fullName: fullName,
      if (phone != null) #phone: phone,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (isProvider != null) #isProvider: isProvider,
      if (gender != null) #gender: gender,
      if (picture != null) #picture: picture,
      if (bio != null) #bio: bio,
      if (userName != null) #userName: userName,
      if (authUid != null) #authUid: authUid,
      if (isVerified != null) #isVerified: isVerified,
      if (categoryUid != null) #categoryUid: categoryUid,
      if (userNameAlreadyUpdated != null)
        #userNameAlreadyUpdated: userNameAlreadyUpdated,
      if (category != $none) #category: category,
      if (unreadNotificationCount != null)
        #unreadNotificationCount: unreadNotificationCount,
      if (reviewsCount != null) #reviewsCount: reviewsCount,
      if (rating != null) #rating: rating,
      if (likedPostUids != null) #likedPostUids: likedPostUids,
      if (favoratesUids != null) #favoratesUids: favoratesUids,
      if (joinedCommunityUids != null)
        #joinedCommunityUids: joinedCommunityUids,
    }),
  );
  @override
  AUser $make(CopyWithData data) => AUser(
    uid: data.get(#uid, or: $value.uid),
    email: data.get(#email, or: $value.email),
    fullName: data.get(#fullName, or: $value.fullName),
    phone: data.get(#phone, or: $value.phone),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isProvider: data.get(#isProvider, or: $value.isProvider),
    gender: data.get(#gender, or: $value.gender),
    picture: data.get(#picture, or: $value.picture),
    bio: data.get(#bio, or: $value.bio),
    userName: data.get(#userName, or: $value.userName),
    authUid: data.get(#authUid, or: $value.authUid),
    isVerified: data.get(#isVerified, or: $value.isVerified),
    categoryUid: data.get(#categoryUid, or: $value.categoryUid),
    userNameAlreadyUpdated: data.get(
      #userNameAlreadyUpdated,
      or: $value.userNameAlreadyUpdated,
    ),
    category: data.get(#category, or: $value.category),
    unreadNotificationCount: data.get(
      #unreadNotificationCount,
      or: $value.unreadNotificationCount,
    ),
    reviewsCount: data.get(#reviewsCount, or: $value.reviewsCount),
    rating: data.get(#rating, or: $value.rating),
    likedPostUids: data.get(#likedPostUids, or: $value.likedPostUids),
    favoratesUids: data.get(#favoratesUids, or: $value.favoratesUids),
    joinedCommunityUids: data.get(
      #joinedCommunityUids,
      or: $value.joinedCommunityUids,
    ),
  );

  @override
  AUserCopyWith<$R2, AUser, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

