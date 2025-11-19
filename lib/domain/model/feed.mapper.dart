// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'feed.dart';

class FeedMapper extends ClassMapperBase<Feed> {
  FeedMapper._();

  static FeedMapper? _instance;
  static FeedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FeedMapper._());
      VenueMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
      HashImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Feed';

  static Venue _$venue(Feed v) => v.venue;
  static const Field<Feed, Venue> _f$venue = Field(
    'venue',
    _$venue,
    opt: true,
    def: const Venue(),
  );
  static String _$description(Feed v) => v.description;
  static const Field<Feed, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(Feed v) => v.createdAt;
  static const Field<Feed, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String _$uid(Feed v) => v.uid;
  static const Field<Feed, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static bool _$isArchived(Feed v) => v.isArchived;
  static const Field<Feed, bool> _f$isArchived = Field(
    'isArchived',
    _$isArchived,
    opt: true,
    def: false,
  );
  static String _$title(Feed v) => v.title;
  static const Field<Feed, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
    def: '',
  );
  static int _$timestamp(Feed v) => v.timestamp;
  static const Field<Feed, int> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
    def: 0,
  );
  static Category _$category(Feed v) => v.category;
  static const Field<Feed, Category> _f$category = Field(
    'category',
    _$category,
    opt: true,
    def: const Category(),
  );
  static String _$localTimestamp(Feed v) => v.localTimestamp;
  static const Field<Feed, String> _f$localTimestamp = Field(
    'localTimestamp',
    _$localTimestamp,
    opt: true,
    def: '',
  );
  static String _$categoryUid(Feed v) => v.categoryUid;
  static const Field<Feed, String> _f$categoryUid = Field(
    'categoryUid',
    _$categoryUid,
    opt: true,
    def: '',
  );
  static DateTime? _$updatedAt(Feed v) => v.updatedAt;
  static const Field<Feed, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static List<HashImage> _$imageUrls(Feed v) => v.imageUrls;
  static const Field<Feed, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );
  static List<String> _$tags(Feed v) => v.tags;
  static const Field<Feed, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
    def: const [],
  );
  static String _$ownerUid(Feed v) => v.ownerUid;
  static const Field<Feed, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static String _$ownerUserName(Feed v) => v.ownerUserName;
  static const Field<Feed, String> _f$ownerUserName = Field(
    'ownerUserName',
    _$ownerUserName,
    opt: true,
    def: '',
  );
  static String _$ownerProfileImageUrl(Feed v) => v.ownerProfileImageUrl;
  static const Field<Feed, String> _f$ownerProfileImageUrl = Field(
    'ownerProfileImageUrl',
    _$ownerProfileImageUrl,
    opt: true,
    def: '',
  );
  static bool _$isSponsored(Feed v) => v.isSponsored;
  static const Field<Feed, bool> _f$isSponsored = Field(
    'isSponsored',
    _$isSponsored,
    opt: true,
    def: false,
  );
  static String _$communityUid(Feed v) => v.communityUid;
  static const Field<Feed, String> _f$communityUid = Field(
    'communityUid',
    _$communityUid,
    opt: true,
    def: '',
  );
  static String _$recurrenceUid(Feed v) => v.recurrenceUid;
  static const Field<Feed, String> _f$recurrenceUid = Field(
    'recurrenceUid',
    _$recurrenceUid,
    opt: true,
    def: '',
  );
  static bool _$isRepeating(Feed v) => v.isRepeating;
  static const Field<Feed, bool> _f$isRepeating = Field(
    'isRepeating',
    _$isRepeating,
    opt: true,
    def: false,
  );
  static double _$distance(Feed v) => v.distance;
  static const Field<Feed, double> _f$distance = Field(
    'distance',
    _$distance,
    opt: true,
    def: 0.0,
  );
  static bool _$isFromFeed(Feed v) => v.isFromFeed;
  static const Field<Feed, bool> _f$isFromFeed = Field(
    'isFromFeed',
    _$isFromFeed,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<Feed> fields = const {
    #venue: _f$venue,
    #description: _f$description,
    #createdAt: _f$createdAt,
    #uid: _f$uid,
    #isArchived: _f$isArchived,
    #title: _f$title,
    #timestamp: _f$timestamp,
    #category: _f$category,
    #localTimestamp: _f$localTimestamp,
    #categoryUid: _f$categoryUid,
    #updatedAt: _f$updatedAt,
    #imageUrls: _f$imageUrls,
    #tags: _f$tags,
    #ownerUid: _f$ownerUid,
    #ownerUserName: _f$ownerUserName,
    #ownerProfileImageUrl: _f$ownerProfileImageUrl,
    #isSponsored: _f$isSponsored,
    #communityUid: _f$communityUid,
    #recurrenceUid: _f$recurrenceUid,
    #isRepeating: _f$isRepeating,
    #distance: _f$distance,
    #isFromFeed: _f$isFromFeed,
  };

  static Feed _instantiate(DecodingData data) {
    return Feed(
      venue: data.dec(_f$venue),
      description: data.dec(_f$description),
      createdAt: data.dec(_f$createdAt),
      uid: data.dec(_f$uid),
      isArchived: data.dec(_f$isArchived),
      title: data.dec(_f$title),
      timestamp: data.dec(_f$timestamp),
      category: data.dec(_f$category),
      localTimestamp: data.dec(_f$localTimestamp),
      categoryUid: data.dec(_f$categoryUid),
      updatedAt: data.dec(_f$updatedAt),
      imageUrls: data.dec(_f$imageUrls),
      tags: data.dec(_f$tags),
      ownerUid: data.dec(_f$ownerUid),
      ownerUserName: data.dec(_f$ownerUserName),
      ownerProfileImageUrl: data.dec(_f$ownerProfileImageUrl),
      isSponsored: data.dec(_f$isSponsored),
      communityUid: data.dec(_f$communityUid),
      recurrenceUid: data.dec(_f$recurrenceUid),
      isRepeating: data.dec(_f$isRepeating),
      distance: data.dec(_f$distance),
      isFromFeed: data.dec(_f$isFromFeed),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Feed fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Feed>(map);
  }

  static Feed fromJson(String json) {
    return ensureInitialized().decodeJson<Feed>(json);
  }
}

mixin FeedMappable {
  String toJson() {
    return FeedMapper.ensureInitialized().encodeJson<Feed>(this as Feed);
  }

  Map<String, dynamic> toMap() {
    return FeedMapper.ensureInitialized().encodeMap<Feed>(this as Feed);
  }

  FeedCopyWith<Feed, Feed, Feed> get copyWith =>
      _FeedCopyWithImpl<Feed, Feed>(this as Feed, $identity, $identity);
  @override
  String toString() {
    return FeedMapper.ensureInitialized().stringifyValue(this as Feed);
  }

  @override
  bool operator ==(Object other) {
    return FeedMapper.ensureInitialized().equalsValue(this as Feed, other);
  }

  @override
  int get hashCode {
    return FeedMapper.ensureInitialized().hashValue(this as Feed);
  }
}

extension FeedValueCopy<$R, $Out> on ObjectCopyWith<$R, Feed, $Out> {
  FeedCopyWith<$R, Feed, $Out> get $asFeed =>
      $base.as((v, t, t2) => _FeedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FeedCopyWith<$R, $In extends Feed, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  VenueCopyWith<$R, Venue, Venue> get venue;
  CategoryCopyWith<$R, Category, Category> get category;
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call({
    Venue? venue,
    String? description,
    DateTime? createdAt,
    String? uid,
    bool? isArchived,
    String? title,
    int? timestamp,
    Category? category,
    String? localTimestamp,
    String? categoryUid,
    DateTime? updatedAt,
    List<HashImage>? imageUrls,
    List<String>? tags,
    String? ownerUid,
    String? ownerUserName,
    String? ownerProfileImageUrl,
    bool? isSponsored,
    String? communityUid,
    String? recurrenceUid,
    bool? isRepeating,
    double? distance,
    bool? isFromFeed,
  });
  FeedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FeedCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Feed, $Out>
    implements FeedCopyWith<$R, Feed, $Out> {
  _FeedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Feed> $mapper = FeedMapper.ensureInitialized();
  @override
  VenueCopyWith<$R, Venue, Venue> get venue =>
      $value.venue.copyWith.$chain((v) => call(venue: v));
  @override
  CategoryCopyWith<$R, Category, Category> get category =>
      $value.category.copyWith.$chain((v) => call(category: v));
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls => ListCopyWith(
    $value.imageUrls,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(imageUrls: v),
  );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  $R call({
    Venue? venue,
    String? description,
    Object? createdAt = $none,
    String? uid,
    bool? isArchived,
    String? title,
    int? timestamp,
    Category? category,
    String? localTimestamp,
    String? categoryUid,
    Object? updatedAt = $none,
    List<HashImage>? imageUrls,
    List<String>? tags,
    String? ownerUid,
    String? ownerUserName,
    String? ownerProfileImageUrl,
    bool? isSponsored,
    String? communityUid,
    String? recurrenceUid,
    bool? isRepeating,
    double? distance,
    bool? isFromFeed,
  }) => $apply(
    FieldCopyWithData({
      if (venue != null) #venue: venue,
      if (description != null) #description: description,
      if (createdAt != $none) #createdAt: createdAt,
      if (uid != null) #uid: uid,
      if (isArchived != null) #isArchived: isArchived,
      if (title != null) #title: title,
      if (timestamp != null) #timestamp: timestamp,
      if (category != null) #category: category,
      if (localTimestamp != null) #localTimestamp: localTimestamp,
      if (categoryUid != null) #categoryUid: categoryUid,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (imageUrls != null) #imageUrls: imageUrls,
      if (tags != null) #tags: tags,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (ownerUserName != null) #ownerUserName: ownerUserName,
      if (ownerProfileImageUrl != null)
        #ownerProfileImageUrl: ownerProfileImageUrl,
      if (isSponsored != null) #isSponsored: isSponsored,
      if (communityUid != null) #communityUid: communityUid,
      if (recurrenceUid != null) #recurrenceUid: recurrenceUid,
      if (isRepeating != null) #isRepeating: isRepeating,
      if (distance != null) #distance: distance,
      if (isFromFeed != null) #isFromFeed: isFromFeed,
    }),
  );
  @override
  Feed $make(CopyWithData data) => Feed(
    venue: data.get(#venue, or: $value.venue),
    description: data.get(#description, or: $value.description),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    uid: data.get(#uid, or: $value.uid),
    isArchived: data.get(#isArchived, or: $value.isArchived),
    title: data.get(#title, or: $value.title),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    category: data.get(#category, or: $value.category),
    localTimestamp: data.get(#localTimestamp, or: $value.localTimestamp),
    categoryUid: data.get(#categoryUid, or: $value.categoryUid),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    imageUrls: data.get(#imageUrls, or: $value.imageUrls),
    tags: data.get(#tags, or: $value.tags),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    ownerUserName: data.get(#ownerUserName, or: $value.ownerUserName),
    ownerProfileImageUrl: data.get(
      #ownerProfileImageUrl,
      or: $value.ownerProfileImageUrl,
    ),
    isSponsored: data.get(#isSponsored, or: $value.isSponsored),
    communityUid: data.get(#communityUid, or: $value.communityUid),
    recurrenceUid: data.get(#recurrenceUid, or: $value.recurrenceUid),
    isRepeating: data.get(#isRepeating, or: $value.isRepeating),
    distance: data.get(#distance, or: $value.distance),
    isFromFeed: data.get(#isFromFeed, or: $value.isFromFeed),
  );

  @override
  FeedCopyWith<$R2, Feed, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FeedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

