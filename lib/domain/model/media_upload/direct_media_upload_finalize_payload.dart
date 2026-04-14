import 'package:dart_mappable/dart_mappable.dart';

part 'direct_media_upload_finalize_payload.mapper.dart';

@MappableClass()
class DirectMediaUploadFinalizePayload
    with DirectMediaUploadFinalizePayloadMappable {
  final String mediaUid;
  final String objectPath;
  final String url;
  final String fileName;
  final String? mimeType;
  final String? hash;

  const DirectMediaUploadFinalizePayload({
    this.mediaUid = '',
    this.objectPath = '',
    this.url = '',
    this.fileName = '',
    this.mimeType,
    this.hash,
  });
}
