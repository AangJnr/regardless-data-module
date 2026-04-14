// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'direct_media_upload_init.dart';

class DirectMediaUploadInitMapper
    extends ClassMapperBase<DirectMediaUploadInit> {
  DirectMediaUploadInitMapper._();

  static DirectMediaUploadInitMapper? _instance;
  static DirectMediaUploadInitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DirectMediaUploadInitMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DirectMediaUploadInit';

  static String _$mediaUid(DirectMediaUploadInit v) => v.mediaUid;
  static const Field<DirectMediaUploadInit, String> _f$mediaUid = Field(
    'mediaUid',
    _$mediaUid,
    opt: true,
    def: '',
  );
  static String _$objectPath(DirectMediaUploadInit v) => v.objectPath;
  static const Field<DirectMediaUploadInit, String> _f$objectPath = Field(
    'objectPath',
    _$objectPath,
    opt: true,
    def: '',
  );
  static String _$signedUrl(DirectMediaUploadInit v) => v.signedUrl;
  static const Field<DirectMediaUploadInit, String> _f$signedUrl = Field(
    'signedUrl',
    _$signedUrl,
    opt: true,
    def: '',
  );
  static String _$url(DirectMediaUploadInit v) => v.url;
  static const Field<DirectMediaUploadInit, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
    def: '',
  );
  static String _$fileName(DirectMediaUploadInit v) => v.fileName;
  static const Field<DirectMediaUploadInit, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
    def: '',
  );
  static String? _$mimeType(DirectMediaUploadInit v) => v.mimeType;
  static const Field<DirectMediaUploadInit, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    opt: true,
  );

  @override
  final MappableFields<DirectMediaUploadInit> fields = const {
    #mediaUid: _f$mediaUid,
    #objectPath: _f$objectPath,
    #signedUrl: _f$signedUrl,
    #url: _f$url,
    #fileName: _f$fileName,
    #mimeType: _f$mimeType,
  };

  static DirectMediaUploadInit _instantiate(DecodingData data) {
    return DirectMediaUploadInit(
      mediaUid: data.dec(_f$mediaUid),
      objectPath: data.dec(_f$objectPath),
      signedUrl: data.dec(_f$signedUrl),
      url: data.dec(_f$url),
      fileName: data.dec(_f$fileName),
      mimeType: data.dec(_f$mimeType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DirectMediaUploadInit fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirectMediaUploadInit>(map);
  }

  static DirectMediaUploadInit fromJson(String json) {
    return ensureInitialized().decodeJson<DirectMediaUploadInit>(json);
  }
}

mixin DirectMediaUploadInitMappable {
  String toJson() {
    return DirectMediaUploadInitMapper.ensureInitialized()
        .encodeJson<DirectMediaUploadInit>(this as DirectMediaUploadInit);
  }

  Map<String, dynamic> toMap() {
    return DirectMediaUploadInitMapper.ensureInitialized()
        .encodeMap<DirectMediaUploadInit>(this as DirectMediaUploadInit);
  }

  DirectMediaUploadInitCopyWith<
    DirectMediaUploadInit,
    DirectMediaUploadInit,
    DirectMediaUploadInit
  >
  get copyWith =>
      _DirectMediaUploadInitCopyWithImpl<
        DirectMediaUploadInit,
        DirectMediaUploadInit
      >(this as DirectMediaUploadInit, $identity, $identity);
  @override
  String toString() {
    return DirectMediaUploadInitMapper.ensureInitialized().stringifyValue(
      this as DirectMediaUploadInit,
    );
  }

  @override
  bool operator ==(Object other) {
    return DirectMediaUploadInitMapper.ensureInitialized().equalsValue(
      this as DirectMediaUploadInit,
      other,
    );
  }

  @override
  int get hashCode {
    return DirectMediaUploadInitMapper.ensureInitialized().hashValue(
      this as DirectMediaUploadInit,
    );
  }
}

extension DirectMediaUploadInitValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DirectMediaUploadInit, $Out> {
  DirectMediaUploadInitCopyWith<$R, DirectMediaUploadInit, $Out>
  get $asDirectMediaUploadInit => $base.as(
    (v, t, t2) => _DirectMediaUploadInitCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DirectMediaUploadInitCopyWith<
  $R,
  $In extends DirectMediaUploadInit,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? mediaUid,
    String? objectPath,
    String? signedUrl,
    String? url,
    String? fileName,
    String? mimeType,
  });
  DirectMediaUploadInitCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DirectMediaUploadInitCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DirectMediaUploadInit, $Out>
    implements DirectMediaUploadInitCopyWith<$R, DirectMediaUploadInit, $Out> {
  _DirectMediaUploadInitCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DirectMediaUploadInit> $mapper =
      DirectMediaUploadInitMapper.ensureInitialized();
  @override
  $R call({
    String? mediaUid,
    String? objectPath,
    String? signedUrl,
    String? url,
    String? fileName,
    Object? mimeType = $none,
  }) => $apply(
    FieldCopyWithData({
      if (mediaUid != null) #mediaUid: mediaUid,
      if (objectPath != null) #objectPath: objectPath,
      if (signedUrl != null) #signedUrl: signedUrl,
      if (url != null) #url: url,
      if (fileName != null) #fileName: fileName,
      if (mimeType != $none) #mimeType: mimeType,
    }),
  );
  @override
  DirectMediaUploadInit $make(CopyWithData data) => DirectMediaUploadInit(
    mediaUid: data.get(#mediaUid, or: $value.mediaUid),
    objectPath: data.get(#objectPath, or: $value.objectPath),
    signedUrl: data.get(#signedUrl, or: $value.signedUrl),
    url: data.get(#url, or: $value.url),
    fileName: data.get(#fileName, or: $value.fileName),
    mimeType: data.get(#mimeType, or: $value.mimeType),
  );

  @override
  DirectMediaUploadInitCopyWith<$R2, DirectMediaUploadInit, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DirectMediaUploadInitCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

