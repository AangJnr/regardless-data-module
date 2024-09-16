import 'dart:ui' show Color;

import '../../data/model/category_api.dart';
import '../domain_mapper.dart';

class Category implements DataMapper<CategoryApi> {
  final String name;
  final String imageUrl;
  final String uid;
  final String? hexColor;
  final String description;
  final String descriptionForProvider;
  final String iconUrl;
  final bool serviceSupported;

  const Category(
      {this.name = '',
      this.description = '',
      this.imageUrl = '',
      this.uid = '',
      this.descriptionForProvider = '',
      this.iconUrl = '',
      this.hexColor,
      this.serviceSupported = false});

  @override
  String toString() {
    return name;
  }

  Category copyWith(
      {String? name,
      String? imageUrl,
      String? uid,
      String? hexColor,
      bool? serviceSupported}) {
    return Category(
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        uid: uid ?? this.uid,
        hexColor: hexColor,
        serviceSupported: serviceSupported ?? this.serviceSupported);
  }

  @override
  CategoryApi mapToApi() {
    return CategoryApi(
        name: name,
        description: description,
        imageUrl: imageUrl,
        uid: uid,
        descriptionForProvider: descriptionForProvider,
        iconUrl: iconUrl,
        hexColor: hexColor,
        serviceSupported: serviceSupported);
  }

  Color getColor() =>
      Color(int.parse((hexColor ?? "#151515").replaceAll('#', '0xFF')));
}
