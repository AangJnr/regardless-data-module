// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'announcement.dart';

class AnnouncementMapper extends ClassMapperBase<Announcement> {
  AnnouncementMapper._();

  static AnnouncementMapper? _instance;
  static AnnouncementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnnouncementMapper._());
      HashImageMapper.ensureInitialized();
      OwnerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Announcement';

  static String _$uid(Announcement v) => v.uid;
  static const Field<Announcement, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$description(Announcement v) => v.description;
  static const Field<Announcement, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static List<HashImage> _$imageUrls(Announcement v) => v.imageUrls;
  static const Field<Announcement, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );
  static DateTime? _$createdAt(Announcement v) => v.createdAt;
  static const Field<Announcement, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static int _$likesCount(Announcement v) => v.likesCount;
  static const Field<Announcement, int> _f$likesCount = Field(
    'likesCount',
    _$likesCount,
    opt: true,
    def: 0,
  );
  static int _$commentsCount(Announcement v) => v.commentsCount;
  static const Field<Announcement, int> _f$commentsCount = Field(
    'commentsCount',
    _$commentsCount,
    opt: true,
    def: 0,
  );
  static DateTime? _$updatedAt(Announcement v) => v.updatedAt;
  static const Field<Announcement, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static Owner _$owner(Announcement v) => v.owner;
  static const Field<Announcement, Owner> _f$owner = Field(
    'owner',
    _$owner,
    opt: true,
    def: const Owner(),
  );
  static int _$timestamp(Announcement v) => v.timestamp;
  static const Field<Announcement, int> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Announcement> fields = const {
    #uid: _f$uid,
    #description: _f$description,
    #imageUrls: _f$imageUrls,
    #createdAt: _f$createdAt,
    #likesCount: _f$likesCount,
    #commentsCount: _f$commentsCount,
    #updatedAt: _f$updatedAt,
    #owner: _f$owner,
    #timestamp: _f$timestamp,
  };

  static Announcement _instantiate(DecodingData data) {
    return Announcement(
      uid: data.dec(_f$uid),
      description: data.dec(_f$description),
      imageUrls: data.dec(_f$imageUrls),
      createdAt: data.dec(_f$createdAt),
      likesCount: data.dec(_f$likesCount),
      commentsCount: data.dec(_f$commentsCount),
      updatedAt: data.dec(_f$updatedAt),
      owner: data.dec(_f$owner),
      timestamp: data.dec(_f$timestamp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Announcement fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Announcement>(map);
  }

  static Announcement fromJson(String json) {
    return ensureInitialized().decodeJson<Announcement>(json);
  }
}

mixin AnnouncementMappable {
  String toJson() {
    return AnnouncementMapper.ensureInitialized().encodeJson<Announcement>(
      this as Announcement,
    );
  }

  Map<String, dynamic> toMap() {
    return AnnouncementMapper.ensureInitialized().encodeMap<Announcement>(
      this as Announcement,
    );
  }

  AnnouncementCopyWith<Announcement, Announcement, Announcement> get copyWith =>
      _AnnouncementCopyWithImpl<Announcement, Announcement>(
        this as Announcement,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AnnouncementMapper.ensureInitialized().stringifyValue(
      this as Announcement,
    );
  }

  @override
  bool operator ==(Object other) {
    return AnnouncementMapper.ensureInitialized().equalsValue(
      this as Announcement,
      other,
    );
  }

  @override
  int get hashCode {
    return AnnouncementMapper.ensureInitialized().hashValue(
      this as Announcement,
    );
  }
}

extension AnnouncementValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Announcement, $Out> {
  AnnouncementCopyWith<$R, Announcement, $Out> get $asAnnouncement =>
      $base.as((v, t, t2) => _AnnouncementCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AnnouncementCopyWith<$R, $In extends Announcement, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
      get imageUrls;
  OwnerCopyWith<$R, Owner, Owner> get owner;
  $R call({
    String? uid,
    String? description,
    List<HashImage>? imageUrls,
    DateTime? createdAt,
    int? likesCount,
    int? commentsCount,
    DateTime? updatedAt,
    Owner? owner,
    int? timestamp,
  });
  AnnouncementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AnnouncementCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Announcement, $Out>
    implements AnnouncementCopyWith<$R, Announcement, $Out> {
  _AnnouncementCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Announcement> $mapper =
      AnnouncementMapper.ensureInitialized();
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
      get imageUrls => ListCopyWith(
            $value.imageUrls,
            (v, t) => v.copyWith.$chain(t),
            (v) => call(imageUrls: v),
          );
  @override
  OwnerCopyWith<$R, Owner, Owner> get owner =>
      $value.owner.copyWith.$chain((v) => call(owner: v));
  @override
  $R call({
    String? uid,
    String? description,
    List<HashImage>? imageUrls,
    Object? createdAt = $none,
    int? likesCount,
    int? commentsCount,
    Object? updatedAt = $none,
    Owner? owner,
    int? timestamp,
  }) =>
      $apply(
        FieldCopyWithData({
          if (uid != null) #uid: uid,
          if (description != null) #description: description,
          if (imageUrls != null) #imageUrls: imageUrls,
          if (createdAt != $none) #createdAt: createdAt,
          if (likesCount != null) #likesCount: likesCount,
          if (commentsCount != null) #commentsCount: commentsCount,
          if (updatedAt != $none) #updatedAt: updatedAt,
          if (owner != null) #owner: owner,
          if (timestamp != null) #timestamp: timestamp,
        }),
      );
  @override
  Announcement $make(CopyWithData data) => Announcement(
        uid: data.get(#uid, or: $value.uid),
        description: data.get(#description, or: $value.description),
        imageUrls: data.get(#imageUrls, or: $value.imageUrls),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        likesCount: data.get(#likesCount, or: $value.likesCount),
        commentsCount: data.get(#commentsCount, or: $value.commentsCount),
        updatedAt: data.get(#updatedAt, or: $value.updatedAt),
        owner: data.get(#owner, or: $value.owner),
        timestamp: data.get(#timestamp, or: $value.timestamp),
      );

  @override
  AnnouncementCopyWith<$R2, Announcement, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _AnnouncementCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
