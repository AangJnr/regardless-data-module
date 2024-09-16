import 'dart:convert';

import 'package:regardless_data_module/domain/domain_mapper.dart';

import '../../../domain/model/community/community_settings.dart';

class CommunitySettingsApi implements DomainMapper<CommunitySettings> {
  final bool? isPublic;
  final bool? allowComments;
  final int? maxMembers;

  const CommunitySettingsApi({
    this.isPublic,
    this.allowComments,
    this.maxMembers,
  });

  @override
  String toString() {
    return 'CommunitySettings(isPublic: $isPublic, allowComments: $allowComments, maxMembers: $maxMembers)';
  }

  factory CommunitySettingsApi.fromMap(Map<String, dynamic> data) {
    return CommunitySettingsApi(
      isPublic: data['isPublic'] as bool?,
      allowComments: data['allowComments'] as bool?,
      maxMembers: data['maxMembers'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'isPublic': isPublic,
        'allowComments': allowComments,
        'maxMembers': maxMembers,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommunitySettingsApi].
  factory CommunitySettingsApi.fromJson(String data) {
    return CommunitySettingsApi.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommunitySettingsApi] to a JSON string.
  String toJson() => json.encode(toMap());

  CommunitySettingsApi copyWith({
    bool? isPublic,
    bool? allowComments,
    int? maxMembers,
  }) {
    return CommunitySettingsApi(
      isPublic: isPublic ?? this.isPublic,
      allowComments: allowComments ?? this.allowComments,
      maxMembers: maxMembers ?? this.maxMembers,
    );
  }

  @override
  CommunitySettings mapToDomain() => CommunitySettings(
        isPublic: isPublic ?? true,
        allowComments: allowComments ?? true,
        maxMembers: maxMembers ?? 100,
      );
}
