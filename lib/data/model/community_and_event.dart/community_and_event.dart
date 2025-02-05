import 'package:regardless_data_module/data/model/community_api/community_api.dart';
import 'package:regardless_data_module/data/model/event_api.dart';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/community_and_event.dart';

class CommunityAndEventApi implements DomainMapper<CommunityAndEvent> {
  final CommunityApi community;
  final EventApi? event;
  CommunityAndEventApi({required this.event, required this.community});

  @override
  CommunityAndEvent mapToDomain() => CommunityAndEvent(
      community: community.mapToDomain(), event: event?.mapToDomain());

  factory CommunityAndEventApi.fromMap(Map<String, dynamic> map) {
    return CommunityAndEventApi(
        community: CommunityApi.fromMap(map['community']),
        event: map['event'] != null ? EventApi.fromMap(map['event']) : null);
  }
}
