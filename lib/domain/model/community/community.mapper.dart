// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'community.dart';

class CommunityMapper extends ClassMapperBase<Community> {
  CommunityMapper._();

  static CommunityMapper? _instance;
  static CommunityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommunityMapper._());
      CommunitySettingsMapper.ensureInitialized();
      HashImageMapper.ensureInitialized();
      MemberMapper.ensureInitialized();
      AUserMapper.ensureInitialized();
      VenueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Community';

  static String _$name(Community v) => v.name;
  static const Field<Community, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$description(Community v) => v.description;
  static const Field<Community, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$ownerUid(Community v) => v.ownerUid;
  static const Field<Community, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static CommunitySettings _$communitySettings(Community v) =>
      v.communitySettings;
  static const Field<Community, CommunitySettings> _f$communitySettings = Field(
    'communitySettings',
    _$communitySettings,
    opt: true,
    def: const CommunitySettings(),
  );
  static int _$membersCount(Community v) => v.membersCount;
  static const Field<Community, int> _f$membersCount = Field(
    'membersCount',
    _$membersCount,
    opt: true,
    def: 0,
  );
  static DateTime? _$createdAt(Community v) => v.createdAt;
  static const Field<Community, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Community v) => v.updatedAt;
  static const Field<Community, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static DateTime? _$joinedAt(Community v) => v.joinedAt;
  static const Field<Community, DateTime> _f$joinedAt = Field(
    'joinedAt',
    _$joinedAt,
    opt: true,
  );
  static List<String> _$tags(Community v) => v.tags;
  static const Field<Community, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
    def: const [],
  );
  static List<HashImage> _$imageUrls(Community v) => v.imageUrls;
  static const Field<Community, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );
  static bool _$isArchived(Community v) => v.isArchived;
  static const Field<Community, bool> _f$isArchived = Field(
    'isArchived',
    _$isArchived,
    opt: true,
    def: false,
  );
  static int _$commentsCount(Community v) => v.commentsCount;
  static const Field<Community, int> _f$commentsCount = Field(
    'commentsCount',
    _$commentsCount,
    opt: true,
    def: 0,
  );
  static int _$eventsCount(Community v) => v.eventsCount;
  static const Field<Community, int> _f$eventsCount = Field(
    'eventsCount',
    _$eventsCount,
    opt: true,
    def: 0,
  );
  static String _$uid(Community v) => v.uid;
  static const Field<Community, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static double _$distance(Community v) => v.distance;
  static const Field<Community, double> _f$distance = Field(
    'distance',
    _$distance,
    opt: true,
    def: 0.0,
  );
  static List<Member> _$members(Community v) => v.members;
  static const Field<Community, List<Member>> _f$members = Field(
    'members',
    _$members,
    opt: true,
    def: const [],
  );
  static AUser _$organizer(Community v) => v.organizer;
  static const Field<Community, AUser> _f$organizer = Field(
    'organizer',
    _$organizer,
    opt: true,
    def: const AUser(),
  );
  static Venue? _$venue(Community v) => v.venue;
  static const Field<Community, Venue> _f$venue = Field(
    'venue',
    _$venue,
    opt: true,
  );
  static List<String>? _$imageBase64Data(Community v) => v.imageBase64Data;
  static const Field<Community, List<String>> _f$imageBase64Data = Field(
    'imageBase64Data',
    _$imageBase64Data,
    opt: true,
  );

  @override
  final MappableFields<Community> fields = const {
    #name: _f$name,
    #description: _f$description,
    #ownerUid: _f$ownerUid,
    #communitySettings: _f$communitySettings,
    #membersCount: _f$membersCount,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #joinedAt: _f$joinedAt,
    #tags: _f$tags,
    #imageUrls: _f$imageUrls,
    #isArchived: _f$isArchived,
    #commentsCount: _f$commentsCount,
    #eventsCount: _f$eventsCount,
    #uid: _f$uid,
    #distance: _f$distance,
    #members: _f$members,
    #organizer: _f$organizer,
    #venue: _f$venue,
    #imageBase64Data: _f$imageBase64Data,
  };

  static Community _instantiate(DecodingData data) {
    return Community(
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      ownerUid: data.dec(_f$ownerUid),
      communitySettings: data.dec(_f$communitySettings),
      membersCount: data.dec(_f$membersCount),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      joinedAt: data.dec(_f$joinedAt),
      tags: data.dec(_f$tags),
      imageUrls: data.dec(_f$imageUrls),
      isArchived: data.dec(_f$isArchived),
      commentsCount: data.dec(_f$commentsCount),
      eventsCount: data.dec(_f$eventsCount),
      uid: data.dec(_f$uid),
      distance: data.dec(_f$distance),
      members: data.dec(_f$members),
      organizer: data.dec(_f$organizer),
      venue: data.dec(_f$venue),
      imageBase64Data: data.dec(_f$imageBase64Data),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Community fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Community>(map);
  }

  static Community fromJson(String json) {
    return ensureInitialized().decodeJson<Community>(json);
  }
}

mixin CommunityMappable {
  String toJson() {
    return CommunityMapper.ensureInitialized().encodeJson<Community>(
      this as Community,
    );
  }

  Map<String, dynamic> toMap() {
    return CommunityMapper.ensureInitialized().encodeMap<Community>(
      this as Community,
    );
  }

  CommunityCopyWith<Community, Community, Community> get copyWith =>
      _CommunityCopyWithImpl<Community, Community>(
        this as Community,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CommunityMapper.ensureInitialized().stringifyValue(
      this as Community,
    );
  }

  @override
  bool operator ==(Object other) {
    return CommunityMapper.ensureInitialized().equalsValue(
      this as Community,
      other,
    );
  }

  @override
  int get hashCode {
    return CommunityMapper.ensureInitialized().hashValue(this as Community);
  }
}

extension CommunityValueCopy<$R, $Out> on ObjectCopyWith<$R, Community, $Out> {
  CommunityCopyWith<$R, Community, $Out> get $asCommunity =>
      $base.as((v, t, t2) => _CommunityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CommunityCopyWith<$R, $In extends Community, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CommunitySettingsCopyWith<$R, CommunitySettings, CommunitySettings>
  get communitySettings;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls;
  ListCopyWith<$R, Member, MemberCopyWith<$R, Member, Member>> get members;
  AUserCopyWith<$R, AUser, AUser> get organizer;
  VenueCopyWith<$R, Venue, Venue>? get venue;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get imageBase64Data;
  $R call({
    String? name,
    String? description,
    String? ownerUid,
    CommunitySettings? communitySettings,
    int? membersCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? joinedAt,
    List<String>? tags,
    List<HashImage>? imageUrls,
    bool? isArchived,
    int? commentsCount,
    int? eventsCount,
    String? uid,
    double? distance,
    List<Member>? members,
    AUser? organizer,
    Venue? venue,
    List<String>? imageBase64Data,
  });
  CommunityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommunityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Community, $Out>
    implements CommunityCopyWith<$R, Community, $Out> {
  _CommunityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Community> $mapper =
      CommunityMapper.ensureInitialized();
  @override
  CommunitySettingsCopyWith<$R, CommunitySettings, CommunitySettings>
  get communitySettings => $value.communitySettings.copyWith.$chain(
    (v) => call(communitySettings: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls => ListCopyWith(
    $value.imageUrls,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(imageUrls: v),
  );
  @override
  ListCopyWith<$R, Member, MemberCopyWith<$R, Member, Member>> get members =>
      ListCopyWith(
        $value.members,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(members: v),
      );
  @override
  AUserCopyWith<$R, AUser, AUser> get organizer =>
      $value.organizer.copyWith.$chain((v) => call(organizer: v));
  @override
  VenueCopyWith<$R, Venue, Venue>? get venue =>
      $value.venue?.copyWith.$chain((v) => call(venue: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get imageBase64Data => $value.imageBase64Data != null
      ? ListCopyWith(
          $value.imageBase64Data!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(imageBase64Data: v),
        )
      : null;
  @override
  $R call({
    String? name,
    String? description,
    String? ownerUid,
    CommunitySettings? communitySettings,
    int? membersCount,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? joinedAt = $none,
    List<String>? tags,
    List<HashImage>? imageUrls,
    bool? isArchived,
    int? commentsCount,
    int? eventsCount,
    String? uid,
    double? distance,
    List<Member>? members,
    AUser? organizer,
    Object? venue = $none,
    Object? imageBase64Data = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (description != null) #description: description,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (communitySettings != null) #communitySettings: communitySettings,
      if (membersCount != null) #membersCount: membersCount,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (joinedAt != $none) #joinedAt: joinedAt,
      if (tags != null) #tags: tags,
      if (imageUrls != null) #imageUrls: imageUrls,
      if (isArchived != null) #isArchived: isArchived,
      if (commentsCount != null) #commentsCount: commentsCount,
      if (eventsCount != null) #eventsCount: eventsCount,
      if (uid != null) #uid: uid,
      if (distance != null) #distance: distance,
      if (members != null) #members: members,
      if (organizer != null) #organizer: organizer,
      if (venue != $none) #venue: venue,
      if (imageBase64Data != $none) #imageBase64Data: imageBase64Data,
    }),
  );
  @override
  Community $make(CopyWithData data) => Community(
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    communitySettings: data.get(
      #communitySettings,
      or: $value.communitySettings,
    ),
    membersCount: data.get(#membersCount, or: $value.membersCount),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    joinedAt: data.get(#joinedAt, or: $value.joinedAt),
    tags: data.get(#tags, or: $value.tags),
    imageUrls: data.get(#imageUrls, or: $value.imageUrls),
    isArchived: data.get(#isArchived, or: $value.isArchived),
    commentsCount: data.get(#commentsCount, or: $value.commentsCount),
    eventsCount: data.get(#eventsCount, or: $value.eventsCount),
    uid: data.get(#uid, or: $value.uid),
    distance: data.get(#distance, or: $value.distance),
    members: data.get(#members, or: $value.members),
    organizer: data.get(#organizer, or: $value.organizer),
    venue: data.get(#venue, or: $value.venue),
    imageBase64Data: data.get(#imageBase64Data, or: $value.imageBase64Data),
  );

  @override
  CommunityCopyWith<$R2, Community, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CommunityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

