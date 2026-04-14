// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'direct_media_upload_finalize_payload.dart';

class DirectMediaUploadFinalizePayloadMapper
    extends ClassMapperBase<DirectMediaUploadFinalizePayload> {
  DirectMediaUploadFinalizePayloadMapper._();

  static DirectMediaUploadFinalizePayloadMapper? _instance;
  static DirectMediaUploadFinalizePayloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = DirectMediaUploadFinalizePayloadMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'DirectMediaUploadFinalizePayload';

  static String _$mediaUid(DirectMediaUploadFinalizePayload v) => v.mediaUid;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$mediaUid =
      Field('mediaUid', _$mediaUid, opt: true, def: '');
  static String _$objectPath(DirectMediaUploadFinalizePayload v) =>
      v.objectPath;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$objectPath =
      Field('objectPath', _$objectPath, opt: true, def: '');
  static String _$url(DirectMediaUploadFinalizePayload v) => v.url;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
    def: '',
  );
  static String _$fileName(DirectMediaUploadFinalizePayload v) => v.fileName;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$fileName =
      Field('fileName', _$fileName, opt: true, def: '');
  static String? _$mimeType(DirectMediaUploadFinalizePayload v) => v.mimeType;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$mimeType =
      Field('mimeType', _$mimeType, opt: true);
  static String? _$hash(DirectMediaUploadFinalizePayload v) => v.hash;
  static const Field<DirectMediaUploadFinalizePayload, String> _f$hash = Field(
    'hash',
    _$hash,
    opt: true,
  );

  @override
  final MappableFields<DirectMediaUploadFinalizePayload> fields = const {
    #mediaUid: _f$mediaUid,
    #objectPath: _f$objectPath,
    #url: _f$url,
    #fileName: _f$fileName,
    #mimeType: _f$mimeType,
    #hash: _f$hash,
  };

  static DirectMediaUploadFinalizePayload _instantiate(DecodingData data) {
    return DirectMediaUploadFinalizePayload(
      mediaUid: data.dec(_f$mediaUid),
      objectPath: data.dec(_f$objectPath),
      url: data.dec(_f$url),
      fileName: data.dec(_f$fileName),
      mimeType: data.dec(_f$mimeType),
      hash: data.dec(_f$hash),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DirectMediaUploadFinalizePayload fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirectMediaUploadFinalizePayload>(map);
  }

  static DirectMediaUploadFinalizePayload fromJson(String json) {
    return ensureInitialized().decodeJson<DirectMediaUploadFinalizePayload>(
      json,
    );
  }
}

mixin DirectMediaUploadFinalizePayloadMappable {
  String toJson() {
    return DirectMediaUploadFinalizePayloadMapper.ensureInitialized()
        .encodeJson<DirectMediaUploadFinalizePayload>(
          this as DirectMediaUploadFinalizePayload,
        );
  }

  Map<String, dynamic> toMap() {
    return DirectMediaUploadFinalizePayloadMapper.ensureInitialized()
        .encodeMap<DirectMediaUploadFinalizePayload>(
          this as DirectMediaUploadFinalizePayload,
        );
  }

  DirectMediaUploadFinalizePayloadCopyWith<
    DirectMediaUploadFinalizePayload,
    DirectMediaUploadFinalizePayload,
    DirectMediaUploadFinalizePayload
  >
  get copyWith =>
      _DirectMediaUploadFinalizePayloadCopyWithImpl<
        DirectMediaUploadFinalizePayload,
        DirectMediaUploadFinalizePayload
      >(this as DirectMediaUploadFinalizePayload, $identity, $identity);
  @override
  String toString() {
    return DirectMediaUploadFinalizePayloadMapper.ensureInitialized()
        .stringifyValue(this as DirectMediaUploadFinalizePayload);
  }

  @override
  bool operator ==(Object other) {
    return DirectMediaUploadFinalizePayloadMapper.ensureInitialized()
        .equalsValue(this as DirectMediaUploadFinalizePayload, other);
  }

  @override
  int get hashCode {
    return DirectMediaUploadFinalizePayloadMapper.ensureInitialized().hashValue(
      this as DirectMediaUploadFinalizePayload,
    );
  }
}

extension DirectMediaUploadFinalizePayloadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DirectMediaUploadFinalizePayload, $Out> {
  DirectMediaUploadFinalizePayloadCopyWith<
    $R,
    DirectMediaUploadFinalizePayload,
    $Out
  >
  get $asDirectMediaUploadFinalizePayload => $base.as(
    (v, t, t2) =>
        _DirectMediaUploadFinalizePayloadCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DirectMediaUploadFinalizePayloadCopyWith<
  $R,
  $In extends DirectMediaUploadFinalizePayload,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? mediaUid,
    String? objectPath,
    String? url,
    String? fileName,
    String? mimeType,
    String? hash,
  });
  DirectMediaUploadFinalizePayloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DirectMediaUploadFinalizePayloadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DirectMediaUploadFinalizePayload, $Out>
    implements
        DirectMediaUploadFinalizePayloadCopyWith<
          $R,
          DirectMediaUploadFinalizePayload,
          $Out
        > {
  _DirectMediaUploadFinalizePayloadCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<DirectMediaUploadFinalizePayload> $mapper =
      DirectMediaUploadFinalizePayloadMapper.ensureInitialized();
  @override
  $R call({
    String? mediaUid,
    String? objectPath,
    String? url,
    String? fileName,
    Object? mimeType = $none,
    Object? hash = $none,
  }) => $apply(
    FieldCopyWithData({
      if (mediaUid != null) #mediaUid: mediaUid,
      if (objectPath != null) #objectPath: objectPath,
      if (url != null) #url: url,
      if (fileName != null) #fileName: fileName,
      if (mimeType != $none) #mimeType: mimeType,
      if (hash != $none) #hash: hash,
    }),
  );
  @override
  DirectMediaUploadFinalizePayload $make(CopyWithData data) =>
      DirectMediaUploadFinalizePayload(
        mediaUid: data.get(#mediaUid, or: $value.mediaUid),
        objectPath: data.get(#objectPath, or: $value.objectPath),
        url: data.get(#url, or: $value.url),
        fileName: data.get(#fileName, or: $value.fileName),
        mimeType: data.get(#mimeType, or: $value.mimeType),
        hash: data.get(#hash, or: $value.hash),
      );

  @override
  DirectMediaUploadFinalizePayloadCopyWith<
    $R2,
    DirectMediaUploadFinalizePayload,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DirectMediaUploadFinalizePayloadCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

