class ParticipantDetail {
  final String name;
  final String phone;
  final String email;
  final String profilePhotoUrl;

  const ParticipantDetail(
      {this.name = '',
      this.phone = '',
      this.email = '',
      this.profilePhotoUrl = ''});

  @override
  String toString() {
    return 'ParticipantDetails(name: $name, phone: $phone, email: $email)';
  }

  ParticipantDetail copyWith(
      {String? name, String? phone, String? email, String? profilePhotoUrl}) {
    return ParticipantDetail(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl);
  }
}
