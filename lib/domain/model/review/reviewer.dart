class Reviewer {
  final String userUid;
  final String name;
  final String profilePictureUrl;

  const Reviewer(
      {this.userUid = '', this.name = 'G', this.profilePictureUrl = ''});

  @override
  String toString() {
    return 'Reviewer(userId: $userUid, name: $name, profilePictureUrl: $profilePictureUrl)';
  }

  Reviewer copyWith({
    String? userUid,
    String? name,
    String? profilePictureUrl,
  }) {
    return Reviewer(
      userUid: userUid ?? this.userUid,
      name: name ?? this.name,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }
}
