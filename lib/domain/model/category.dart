import 'dart:ui' show Color;

import 'package:dart_mappable/dart_mappable.dart';

part "category.mapper.dart";

@MappableClass()
class Category with CategoryMappable {
  final String name;
  final String imageUrl;
  final String uid;
  final String? hexColor;
  final String description;
  final String descriptionForProvider;
  final String iconUrl;
  final bool serviceSupported;
  final String nameForProvider;
  final bool isActive;

  const Category(
      {this.name = '',
      this.description = '',
      this.imageUrl = '',
      this.uid = '',
      this.descriptionForProvider = '',
      this.nameForProvider = '',
      this.iconUrl = '',
      this.hexColor,
      this.isActive = true,
      this.serviceSupported = false});

  @override
  String toString() {
    return name;
  }

  Color getColor() =>
      Color(int.parse((hexColor ?? "#151515").replaceAll('#', '0xFF')));
}
