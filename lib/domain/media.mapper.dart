// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'media.dart';

class MediaMapper extends ClassMapperBase<Media> {
  MediaMapper._();

  static MediaMapper? _instance;
  static MediaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Media';

  static String _$thumbnailUrl(Media v) => v.thumbnailUrl;
  static const Field<Media, String> _f$thumbnailUrl = Field(
    'thumbnailUrl',
    _$thumbnailUrl,
    opt: true,
    def: '',
  );
  static String _$uid(Media v) => v.uid;
  static const Field<Media, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$url(Media v) => v.url;
  static const Field<Media, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
    def: '',
  );
  static String _$hash(Media v) => v.hash;
  static const Field<Media, String> _f$hash = Field(
    'hash',
    _$hash,
    opt: true,
    def: 'LOEO@A0bM_RpWsxWW-s,9sn+-DWF',
  );
  static String _$fileName(Media v) => v.fileName;
  static const Field<Media, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(Media v) => v.createdAt;
  static const Field<Media, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String? _$mimeType(Media v) => v.mimeType;
  static const Field<Media, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<Media> fields = const {
    #thumbnailUrl: _f$thumbnailUrl,
    #uid: _f$uid,
    #url: _f$url,
    #hash: _f$hash,
    #fileName: _f$fileName,
    #createdAt: _f$createdAt,
    #mimeType: _f$mimeType,
  };

  static Media _instantiate(DecodingData data) {
    return Media(
      thumbnailUrl: data.dec(_f$thumbnailUrl),
      uid: data.dec(_f$uid),
      url: data.dec(_f$url),
      hash: data.dec(_f$hash),
      fileName: data.dec(_f$fileName),
      createdAt: data.dec(_f$createdAt),
      mimeType: data.dec(_f$mimeType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Media fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Media>(map);
  }

  static Media fromJson(String json) {
    return ensureInitialized().decodeJson<Media>(json);
  }
}

mixin MediaMappable {
  String toJson() {
    return MediaMapper.ensureInitialized().encodeJson<Media>(this as Media);
  }

  Map<String, dynamic> toMap() {
    return MediaMapper.ensureInitialized().encodeMap<Media>(this as Media);
  }

  MediaCopyWith<Media, Media, Media> get copyWith =>
      _MediaCopyWithImpl<Media, Media>(this as Media, $identity, $identity);
  @override
  String toString() {
    return MediaMapper.ensureInitialized().stringifyValue(this as Media);
  }

  @override
  bool operator ==(Object other) {
    return MediaMapper.ensureInitialized().equalsValue(this as Media, other);
  }

  @override
  int get hashCode {
    return MediaMapper.ensureInitialized().hashValue(this as Media);
  }
}

extension MediaValueCopy<$R, $Out> on ObjectCopyWith<$R, Media, $Out> {
  MediaCopyWith<$R, Media, $Out> get $asMedia =>
      $base.as((v, t, t2) => _MediaCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MediaCopyWith<$R, $In extends Media, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? thumbnailUrl,
    String? uid,
    String? url,
    String? hash,
    String? fileName,
    DateTime? createdAt,
    String? mimeType,
  });
  MediaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MediaCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Media, $Out>
    implements MediaCopyWith<$R, Media, $Out> {
  _MediaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Media> $mapper = MediaMapper.ensureInitialized();
  @override
  $R call({
    String? thumbnailUrl,
    String? uid,
    String? url,
    String? hash,
    String? fileName,
    Object? createdAt = $none,
    Object? mimeType = $none,
  }) => $apply(
    FieldCopyWithData({
      if (thumbnailUrl != null) #thumbnailUrl: thumbnailUrl,
      if (uid != null) #uid: uid,
      if (url != null) #url: url,
      if (hash != null) #hash: hash,
      if (fileName != null) #fileName: fileName,
      if (createdAt != $none) #createdAt: createdAt,
      if (mimeType != $none) #mimeType: mimeType,
    }),
  );
  @override
  Media $make(CopyWithData data) => Media(
    thumbnailUrl: data.get(#thumbnailUrl, or: $value.thumbnailUrl),
    uid: data.get(#uid, or: $value.uid),
    url: data.get(#url, or: $value.url),
    hash: data.get(#hash, or: $value.hash),
    fileName: data.get(#fileName, or: $value.fileName),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    mimeType: data.get(#mimeType, or: $value.mimeType),
  );

  @override
  MediaCopyWith<$R2, Media, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MediaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

