import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';

import '../post/owner.dart';

part 'review.mapper.dart';

@MappableClass()
class Review with ReviewMappable {
  final String uid;
  final Owner reviewer;
  final double rating;
  final String title;
  final String comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Review({
    this.reviewer = const Owner(),
    this.rating = 0.0,
    this.title = '',
    this.comment = '',
    this.createdAt,
    this.updatedAt,
    this.uid = '',
  });

  String getParsedDate() {
    if (createdAt == null) return '';
    try {
      return DateFormat('dd/MM/yyyy').format(createdAt!).toString();
    } catch (e) {
      return '';
    }
  }
}
