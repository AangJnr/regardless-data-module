import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/sports/sports_category.dart';

part 'team.mapper.dart';

@MappableClass()
class Team with TeamMappable {
  final String uid;
  final String ownerUid;
  final String name;
  final String sportsCategoryUid;
  final String? sportsCategoryName;
  final String bio;
  final String? headerUrl;
  final String? logo;
  final List<String> startingPlayerUids;
  final bool isPublic;
  final bool isArchived;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SportsCategory? category;
  const Team({
    this.uid = '',
    this.ownerUid = '',
    this.name = '',
    this.logo,
    this.sportsCategoryUid = '',
    this.sportsCategoryName,
    this.bio = '',
    this.headerUrl,
    this.startingPlayerUids = const [],
    this.isPublic = true,
    this.isArchived = false,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  bool isCategoryMismatch(String? selectedCategoryUid) =>
      sportsCategoryUid.isNotEmpty && sportsCategoryUid != selectedCategoryUid;

  factory Team.placeholder() => Team(
    name: 'Team unavailable',
    logo: 'https://api.dicebear.com/9.x/identicon/png?seed=Regardless',
  );
}
