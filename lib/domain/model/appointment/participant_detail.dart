import 'package:dart_mappable/dart_mappable.dart';

part 'participant_detail.mapper.dart';

@MappableClass()
class ParticipantDetail with ParticipantDetailMappable {
  final String fullName;
  final String userName;
  final String uid;

  const ParticipantDetail({
    this.uid = '',
    this.userName = '',
    this.fullName = '',
  });
}

@MappableClass()
class ProviderDetails with ProviderDetailsMappable {
  final String uid;
  final String userName;
  final String? phone;
  final String? email;
  final String fullName;

  const ProviderDetails(
      {this.uid = '',
      this.userName = '',
      this.phone = '',
      this.email = '',
      this.fullName = ''});
}
