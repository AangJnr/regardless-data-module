import 'package:dart_mappable/dart_mappable.dart';

part 'media.mapper.dart';

@MappableClass()
class Media with MediaMappable {
  final String url;
  final String hash;
  final String fileName;
  final DateTime? createdAt;
  final String? mimeType;
  final String uid;
  final String thumbnailUrl;

  const Media({this.thumbnailUrl = '',this.uid ='', this.url = '', this.hash = 'LOEO@A0bM_RpWsxWW-s,9sn+-DWF', this.fileName = '', this.createdAt, this.mimeType = ''});
}
