import 'package:dart_mappable/dart_mappable.dart';

part 'direct_media_upload_init.mapper.dart';

@MappableClass()
class DirectMediaUploadInit with DirectMediaUploadInitMappable {
  final String mediaUid;
  final String objectPath;
  final String signedUrl;
  final String url;
  final String fileName;
  final String? mimeType;

  const DirectMediaUploadInit({
    this.mediaUid = '',
    this.objectPath = '',
    this.signedUrl = '',
    this.url = '',
    this.fileName = '',
    this.mimeType,
  });
}
