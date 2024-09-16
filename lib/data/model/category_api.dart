import 'dart:convert';

import '../../../domain/model/category.dart';
import '../../domain/domain_mapper.dart';

class CategoryApi implements DomainMapper<Category> {
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? iconUrl;
  final String? uid;
  final String? hexColor;
  final String? descriptionForProvider;
  final bool? serviceSupported;
  const CategoryApi(
      {this.name,
      this.iconUrl,
      this.description,
      this.descriptionForProvider,
      this.imageUrl,
      this.uid,
      this.serviceSupported,
      this.hexColor});

  @override
  String toString() {
    return 'CategoryApi(name: $name, imageUrl: $imageUrl, uid: $uid)';
  }

  factory CategoryApi.fromMap(Map<String, dynamic> data) => CategoryApi(
      name: data['name'] as String?,
      description: data['description'] as String?,
      imageUrl: data['imageUrl'] as String?,
      iconUrl: data['iconUrl'] as String?,
      uid: data['uid'] as String?,
      serviceSupported: data['serviceSupported'] as bool?,
      descriptionForProvider: data['descriptionForProvider'],
      hexColor: data["hexColor"] as String?);

  factory CategoryApi.fromMapList(dynamic data) {
    try {
      if (data.isNotEmpty) return CategoryApi.fromMap(data.first);
    } catch (e) {
      return const CategoryApi();
    }
    return const CategoryApi();
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'imageUrl': imageUrl,
        'uid': uid,
        'hexColor': hexColor,
        'descriptionForProvider': descriptionForProvider,
        'description': description,
        'iconUrl': iconUrl,
        'serviceSupported': serviceSupported,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryApi].
  factory CategoryApi.fromJson(String data) {
    return CategoryApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryApi] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Category mapToDomain() {
    return Category(
        name: name ?? '',
        description: description ?? '',
        imageUrl: imageUrl ?? '',
        uid: uid ?? '',
        hexColor: hexColor,
        descriptionForProvider: descriptionForProvider ?? '',
        iconUrl: iconUrl ?? '',
        serviceSupported: serviceSupported ?? false);
  }
}
