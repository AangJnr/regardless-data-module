import '../../../../domain/model/community/community.dart';
import '../../../../domain/model/event.dart';

class CommunityAndEvent {

  final Community community;
  final Event? event;
  CommunityAndEvent({required this.event, required this.community});
}