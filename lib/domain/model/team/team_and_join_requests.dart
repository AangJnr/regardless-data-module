import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/team/team_join_request.dart';

part 'team_and_join_requests.mapper.dart';

@MappableClass()
class TeamAndJoinRequests with TeamAndJoinRequestsMappable {
  final Team team;
  final List<TeamJoinRequest> requests;
   const TeamAndJoinRequests({
    this.team = const Team(),
    this.requests = const [],});
}
