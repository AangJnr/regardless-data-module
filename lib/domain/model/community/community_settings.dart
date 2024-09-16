class CommunitySettings {
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

  CommunitySettings copyWith({
    bool? isPublic,
    bool? allowComments,
    int? maxMembers,
  }) {
    return CommunitySettings(
      isPublic: isPublic ?? this.isPublic,
      allowComments: allowComments ?? this.allowComments,
      maxMembers: maxMembers ?? this.maxMembers,
    );
  }
}
