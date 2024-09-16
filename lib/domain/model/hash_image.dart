import '../../data/model/hash_image.dart';
import '../domain_mapper.dart';

class HashImage implements DataMapper<HashImageApi> {
  final String url;
  final String hash;

  const HashImage({this.url = '', this.hash = ''});

  HashImage copyWith({
    String? url,
    String? hash,
  }) {
    return HashImage(
      url: url ?? this.url,
      hash: hash ?? this.hash,
    );
  }

  @override
  HashImageApi mapToApi() => HashImageApi(
        url: url,
        hash: hash,
      );
}
