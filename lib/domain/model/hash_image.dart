import 'package:dart_mappable/dart_mappable.dart';

import '../../data/model/hash_image.dart';
import '../domain_mapper.dart';
part 'hash_image.mapper.dart';

@MappableClass()
class HashImage with HashImageMappable implements DataMapper<HashImageApi> {
  final String url;
  final String hash;

  const HashImage({this.url = '', this.hash = ''});

  @override
  HashImageApi mapToApi() => HashImageApi(
        url: url,
        hash: hash,
      );
}
