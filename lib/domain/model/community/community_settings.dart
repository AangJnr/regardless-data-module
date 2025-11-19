import 'package:dart_mappable/dart_mappable.dart';

part 'community_settings.mapper.dart';

@MappableClass()
class CommunitySettings with CommunitySettingsMappable {
  final bool isPublic;
  final bool allowComments;
  final int maxMembers;

  const CommunitySettings({
    this.isPublic = true,
    this.allowComments = true,
    this.maxMembers = 100,
  });

  @override
  String toString() {
    return 'CommunitySettings(isPublic: $isPublic, allowComments: $allowComments, maxMembers: $maxMembers)';
  }
}
