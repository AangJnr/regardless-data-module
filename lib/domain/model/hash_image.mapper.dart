// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hash_image.dart';

class HashImageMapper extends ClassMapperBase<HashImage> {
  HashImageMapper._();

  static HashImageMapper? _instance;
  static HashImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HashImageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HashImage';

  static String _$url(HashImage v) => v.url;
  static const Field<HashImage, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
    def: '',
  );
  static String _$hash(HashImage v) => v.hash;
  static const Field<HashImage, String> _f$hash = Field(
    'hash',
    _$hash,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<HashImage> fields = const {#url: _f$url, #hash: _f$hash};

  static HashImage _instantiate(DecodingData data) {
    return HashImage(url: data.dec(_f$url), hash: data.dec(_f$hash));
  }

  @override
  final Function instantiate = _instantiate;

  static HashImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HashImage>(map);
  }

  static HashImage fromJson(String json) {
    return ensureInitialized().decodeJson<HashImage>(json);
  }
}

mixin HashImageMappable {
  String toJson() {
    return HashImageMapper.ensureInitialized().encodeJson<HashImage>(
      this as HashImage,
    );
  }

  Map<String, dynamic> toMap() {
    return HashImageMapper.ensureInitialized().encodeMap<HashImage>(
      this as HashImage,
    );
  }

  HashImageCopyWith<HashImage, HashImage, HashImage> get copyWith =>
      _HashImageCopyWithImpl<HashImage, HashImage>(
        this as HashImage,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HashImageMapper.ensureInitialized().stringifyValue(
      this as HashImage,
    );
  }

  @override
  bool operator ==(Object other) {
    return HashImageMapper.ensureInitialized().equalsValue(
      this as HashImage,
      other,
    );
  }

  @override
  int get hashCode {
    return HashImageMapper.ensureInitialized().hashValue(this as HashImage);
  }
}

extension HashImageValueCopy<$R, $Out> on ObjectCopyWith<$R, HashImage, $Out> {
  HashImageCopyWith<$R, HashImage, $Out> get $asHashImage =>
      $base.as((v, t, t2) => _HashImageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HashImageCopyWith<$R, $In extends HashImage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? url, String? hash});
  HashImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HashImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HashImage, $Out>
    implements HashImageCopyWith<$R, HashImage, $Out> {
  _HashImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HashImage> $mapper =
      HashImageMapper.ensureInitialized();
  @override
  $R call({String? url, String? hash}) => $apply(
    FieldCopyWithData({
      if (url != null) #url: url,
      if (hash != null) #hash: hash,
    }),
  );
  @override
  HashImage $make(CopyWithData data) => HashImage(
    url: data.get(#url, or: $value.url),
    hash: data.get(#hash, or: $value.hash),
  );

  @override
  HashImageCopyWith<$R2, HashImage, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HashImageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

