// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'post.dart';

class PostMapper extends ClassMapperBase<Post> {
  PostMapper._();

  static PostMapper? _instance;
  static PostMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostMapper._());
      VenueMapper.ensureInitialized();
      HashImageMapper.ensureInitialized();
      PriceMapper.ensureInitialized();
      OwnerMapper.ensureInitialized();
      CommunityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Post';

  static String _$uid(Post v) => v.uid;
  static const Field<Post, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$eventUid(Post v) => v.eventUid;
  static const Field<Post, String> _f$eventUid = Field(
    'eventUid',
    _$eventUid,
    opt: true,
    def: '',
  );
  static String _$recurrenceUid(Post v) => v.recurrenceUid;
  static const Field<Post, String> _f$recurrenceUid = Field(
    'recurrenceUid',
    _$recurrenceUid,
    opt: true,
    def: '',
  );
  static String _$description(Post v) => v.description;
  static const Field<Post, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static Venue _$venue(Post v) => v.venue;
  static const Field<Post, Venue> _f$venue = Field(
    'venue',
    _$venue,
    opt: true,
    def: const Venue(),
  );
  static List<HashImage> _$imageUrls(Post v) => v.imageUrls;
  static const Field<Post, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );
  static DateTime? _$createdAt(Post v) => v.createdAt;
  static const Field<Post, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static int _$likesCount(Post v) => v.likesCount;
  static const Field<Post, int> _f$likesCount = Field(
    'likesCount',
    _$likesCount,
    opt: true,
    def: 0,
  );
  static int _$commentsCount(Post v) => v.commentsCount;
  static const Field<Post, int> _f$commentsCount = Field(
    'commentsCount',
    _$commentsCount,
    opt: true,
    def: 0,
  );
  static DateTime? _$updatedAt(Post v) => v.updatedAt;
  static const Field<Post, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static bool _$isVerified(Post v) => v.isVerified;
  static const Field<Post, bool> _f$isVerified = Field(
    'isVerified',
    _$isVerified,
    opt: true,
    def: false,
  );
  static List<Price> _$prices(Post v) => v.prices;
  static const Field<Post, List<Price>> _f$prices = Field(
    'prices',
    _$prices,
    opt: true,
    def: const [],
  );
  static int _$availableTickets(Post v) => v.availableTickets;
  static const Field<Post, int> _f$availableTickets = Field(
    'availableTickets',
    _$availableTickets,
    opt: true,
    def: 0,
  );
  static Owner _$owner(Post v) => v.owner;
  static const Field<Post, Owner> _f$owner = Field(
    'owner',
    _$owner,
    opt: true,
    def: const Owner(),
  );
  static String _$localTimestamp(Post v) => v.localTimestamp;
  static const Field<Post, String> _f$localTimestamp = Field(
    'localTimestamp',
    _$localTimestamp,
    opt: true,
    def: '',
  );
  static String _$name(Post v) => v.name;
  static const Field<Post, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static int _$timestamp(Post v) => v.timestamp;
  static const Field<Post, int> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
    def: 0,
  );
  static String _$communityUid(Post v) => v.communityUid;
  static const Field<Post, String> _f$communityUid = Field(
    'communityUid',
    _$communityUid,
    opt: true,
    def: '',
  );
  static Community? _$community(Post v) => v.community;
  static const Field<Post, Community> _f$community = Field(
    'community',
    _$community,
    opt: true,
  );

  @override
  final MappableFields<Post> fields = const {
    #uid: _f$uid,
    #eventUid: _f$eventUid,
    #recurrenceUid: _f$recurrenceUid,
    #description: _f$description,
    #venue: _f$venue,
    #imageUrls: _f$imageUrls,
    #createdAt: _f$createdAt,
    #likesCount: _f$likesCount,
    #commentsCount: _f$commentsCount,
    #updatedAt: _f$updatedAt,
    #isVerified: _f$isVerified,
    #prices: _f$prices,
    #availableTickets: _f$availableTickets,
    #owner: _f$owner,
    #localTimestamp: _f$localTimestamp,
    #name: _f$name,
    #timestamp: _f$timestamp,
    #communityUid: _f$communityUid,
    #community: _f$community,
  };

  static Post _instantiate(DecodingData data) {
    return Post(
      uid: data.dec(_f$uid),
      eventUid: data.dec(_f$eventUid),
      recurrenceUid: data.dec(_f$recurrenceUid),
      description: data.dec(_f$description),
      venue: data.dec(_f$venue),
      imageUrls: data.dec(_f$imageUrls),
      createdAt: data.dec(_f$createdAt),
      likesCount: data.dec(_f$likesCount),
      commentsCount: data.dec(_f$commentsCount),
      updatedAt: data.dec(_f$updatedAt),
      isVerified: data.dec(_f$isVerified),
      prices: data.dec(_f$prices),
      availableTickets: data.dec(_f$availableTickets),
      owner: data.dec(_f$owner),
      localTimestamp: data.dec(_f$localTimestamp),
      name: data.dec(_f$name),
      timestamp: data.dec(_f$timestamp),
      communityUid: data.dec(_f$communityUid),
      community: data.dec(_f$community),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Post fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Post>(map);
  }

  static Post fromJson(String json) {
    return ensureInitialized().decodeJson<Post>(json);
  }
}

mixin PostMappable {
  String toJson() {
    return PostMapper.ensureInitialized().encodeJson<Post>(this as Post);
  }

  Map<String, dynamic> toMap() {
    return PostMapper.ensureInitialized().encodeMap<Post>(this as Post);
  }

  PostCopyWith<Post, Post, Post> get copyWith =>
      _PostCopyWithImpl<Post, Post>(this as Post, $identity, $identity);
  @override
  String toString() {
    return PostMapper.ensureInitialized().stringifyValue(this as Post);
  }

  @override
  bool operator ==(Object other) {
    return PostMapper.ensureInitialized().equalsValue(this as Post, other);
  }

  @override
  int get hashCode {
    return PostMapper.ensureInitialized().hashValue(this as Post);
  }
}

extension PostValueCopy<$R, $Out> on ObjectCopyWith<$R, Post, $Out> {
  PostCopyWith<$R, Post, $Out> get $asPost =>
      $base.as((v, t, t2) => _PostCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PostCopyWith<$R, $In extends Post, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  VenueCopyWith<$R, Venue, Venue> get venue;
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls;
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices;
  OwnerCopyWith<$R, Owner, Owner> get owner;
  CommunityCopyWith<$R, Community, Community>? get community;
  $R call({
    String? uid,
    String? eventUid,
    String? recurrenceUid,
    String? description,
    Venue? venue,
    List<HashImage>? imageUrls,
    DateTime? createdAt,
    int? likesCount,
    int? commentsCount,
    DateTime? updatedAt,
    bool? isVerified,
    List<Price>? prices,
    int? availableTickets,
    Owner? owner,
    String? localTimestamp,
    String? name,
    int? timestamp,
    String? communityUid,
    Community? community,
  });
  PostCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Post, $Out>
    implements PostCopyWith<$R, Post, $Out> {
  _PostCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Post> $mapper = PostMapper.ensureInitialized();
  @override
  VenueCopyWith<$R, Venue, Venue> get venue =>
      $value.venue.copyWith.$chain((v) => call(venue: v));
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls => ListCopyWith(
    $value.imageUrls,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(imageUrls: v),
  );
  @override
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices =>
      ListCopyWith(
        $value.prices,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(prices: v),
      );
  @override
  OwnerCopyWith<$R, Owner, Owner> get owner =>
      $value.owner.copyWith.$chain((v) => call(owner: v));
  @override
  CommunityCopyWith<$R, Community, Community>? get community =>
      $value.community?.copyWith.$chain((v) => call(community: v));
  @override
  $R call({
    String? uid,
    String? eventUid,
    String? recurrenceUid,
    String? description,
    Venue? venue,
    List<HashImage>? imageUrls,
    Object? createdAt = $none,
    int? likesCount,
    int? commentsCount,
    Object? updatedAt = $none,
    bool? isVerified,
    List<Price>? prices,
    int? availableTickets,
    Owner? owner,
    String? localTimestamp,
    String? name,
    int? timestamp,
    String? communityUid,
    Object? community = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (eventUid != null) #eventUid: eventUid,
      if (recurrenceUid != null) #recurrenceUid: recurrenceUid,
      if (description != null) #description: description,
      if (venue != null) #venue: venue,
      if (imageUrls != null) #imageUrls: imageUrls,
      if (createdAt != $none) #createdAt: createdAt,
      if (likesCount != null) #likesCount: likesCount,
      if (commentsCount != null) #commentsCount: commentsCount,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (isVerified != null) #isVerified: isVerified,
      if (prices != null) #prices: prices,
      if (availableTickets != null) #availableTickets: availableTickets,
      if (owner != null) #owner: owner,
      if (localTimestamp != null) #localTimestamp: localTimestamp,
      if (name != null) #name: name,
      if (timestamp != null) #timestamp: timestamp,
      if (communityUid != null) #communityUid: communityUid,
      if (community != $none) #community: community,
    }),
  );
  @override
  Post $make(CopyWithData data) => Post(
    uid: data.get(#uid, or: $value.uid),
    eventUid: data.get(#eventUid, or: $value.eventUid),
    recurrenceUid: data.get(#recurrenceUid, or: $value.recurrenceUid),
    description: data.get(#description, or: $value.description),
    venue: data.get(#venue, or: $value.venue),
    imageUrls: data.get(#imageUrls, or: $value.imageUrls),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    likesCount: data.get(#likesCount, or: $value.likesCount),
    commentsCount: data.get(#commentsCount, or: $value.commentsCount),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isVerified: data.get(#isVerified, or: $value.isVerified),
    prices: data.get(#prices, or: $value.prices),
    availableTickets: data.get(#availableTickets, or: $value.availableTickets),
    owner: data.get(#owner, or: $value.owner),
    localTimestamp: data.get(#localTimestamp, or: $value.localTimestamp),
    name: data.get(#name, or: $value.name),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    communityUid: data.get(#communityUid, or: $value.communityUid),
    community: data.get(#community, or: $value.community),
  );

  @override
  PostCopyWith<$R2, Post, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PostCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

