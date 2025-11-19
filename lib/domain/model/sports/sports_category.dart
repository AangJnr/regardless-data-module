import 'dart:ui' show Color;

import 'package:dart_mappable/dart_mappable.dart';

part 'sports_category.mapper.dart';

@MappableClass()
class SportsCategory with SportsCategoryMappable {
  final String uid;
  final String name;
  final bool isActive;
  final String? iconUrl;
  final String? hexColor;

  const SportsCategory({
    this.uid = '',
    this.name = '',
    this.isActive = true,
    this.iconUrl,
    this.hexColor,
  });

  Color getColor() =>
      Color(int.parse((hexColor ?? "#151515").replaceAll('#', '0xFF')));
}
