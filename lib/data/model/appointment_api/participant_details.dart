import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/appointment/participant_detail.dart';

class ParticipantDetailApi implements DomainMapper<ParticipantDetail> {
  final String? name;
  final String? phone;
  final String? email;
  final String? photoUrl;

  const ParticipantDetailApi(
      {this.name, this.phone, this.email, this.photoUrl});

  @override
  String toString() {
    return 'ParticipantDetails(name: $name, phone: $phone, email: $email)';
  }

  factory ParticipantDetailApi.fromMap(Map<String, dynamic> data) {
    return ParticipantDetailApi(
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        photoUrl: data['photoUrl'] as String?);
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'phone': phone,
        'email': email,
        'photoUrl': photoUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ParticipantDetailApi].
  factory ParticipantDetailApi.fromJson(String data) {
    return ParticipantDetailApi.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ParticipantDetailApi] to a JSON string.
  String toJson() => json.encode(toMap());

  ParticipantDetailApi copyWith({
    String? name,
    String? phone,
    String? email,
  }) {
    return ParticipantDetailApi(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  ParticipantDetail mapToDomain() => ParticipantDetail(
      name: name ?? '',
      phone: phone ?? '',
      email: email ?? '',
      profilePhotoUrl: photoUrl ?? '');
}
