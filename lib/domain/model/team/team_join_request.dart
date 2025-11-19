import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/user.dart';

part 'team_join_request.mapper.dart';

@MappableEnum()
enum TeamJoinRequestStatus { pending, approved, rejected }

@MappableClass()
class TeamJoinRequest with TeamJoinRequestMappable {
  final AUser requester;
  final DateTime? requestedAt;
  final TeamJoinRequestStatus status; // pending | approved | rejected
  const TeamJoinRequest(
      {this.requester = const AUser(),
      this.requestedAt,
      this.status = TeamJoinRequestStatus.pending});
}
