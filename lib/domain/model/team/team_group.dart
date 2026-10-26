import 'package:dart_mappable/dart_mappable.dart';

part 'team_group.mapper.dart';


@MappableClass()
class TeamGroup with TeamGroupMappable{
  const TeamGroup({
    this.uid = '',
    this.ownerUid = '',
    required this.name,
    required this.sportsCategoryUid,
    required this.teamUids,
    this.createdAt,
    this.updatedAt,
  });

  final String uid;
  final String ownerUid;
  final String name;
  final String sportsCategoryUid;
  final List<String> teamUids;
  final DateTime? createdAt;
  final DateTime? updatedAt;
 }
