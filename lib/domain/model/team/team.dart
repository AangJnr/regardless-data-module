import 'package:dart_mappable/dart_mappable.dart';

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
  final bool isPublic;
  final bool isArchived;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Team({
    this.uid = '',
    this.ownerUid = '',
    this.name = '',
    this.logo,
    this.sportsCategoryUid = '',
    this.sportsCategoryName,
    this.bio = '',
    this.headerUrl,
    this.isPublic = true,
    this.isArchived = false,
    this.createdAt,
    this.updatedAt,
  });
}
