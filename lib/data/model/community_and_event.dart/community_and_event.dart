import '../../../domain/domain_mapper.dart';
import '../../../domain/model/community/community.dart';
import '../../../domain/model/community_and_event.dart';
import '../../../domain/model/event.dart';

class CommunityAndEventApi implements DomainMapper<CommunityAndEvent> {
  final Community community;
  final Event? event;
  CommunityAndEventApi({required this.event, required this.community});

  @override
  CommunityAndEvent mapToDomain() =>
      CommunityAndEvent(community: community, event:  event);

  factory CommunityAndEventApi.fromMap(Map<String, dynamic> map) {
    return CommunityAndEventApi(
        community: CommunityMapper.fromMap(map['community']),
        event: map['event'] != null ? EventMapper.fromMap(map['event']) : null);
  }
}
