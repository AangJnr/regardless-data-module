import 'dart:convert';

import '../../domain/domain_mapper.dart';

import '../../../domain/model/hash_image.dart';

class HashImageApi implements DomainMapper<HashImage> {
  final String? url;
  final String? hash;

  const HashImageApi({this.url, this.hash});

  factory HashImageApi.fromMap(Map<String, dynamic> data) => HashImageApi(
        url: data['url'] as String?,
        hash: data['blurHash'] != null ? (data['blurHash'] as String?) : "",
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'blurHash': hash,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HashImageApi].
  factory HashImageApi.fromJson(String data) {
    return HashImageApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HashImageApi] to a JSON string.
  String toJson() => json.encode(toMap());

  HashImageApi copyWith({
    String? url,
    String? hash,
  }) {
    return HashImageApi(
      url: url ?? this.url,
      hash: hash ?? this.hash,
    );
  }

  @override
  HashImage mapToDomain() => HashImage(
        url: url ?? '',
        hash: hash ?? '',
      );
}
