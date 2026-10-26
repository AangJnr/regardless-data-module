import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/team/team_group.dart';

abstract class TeamGroupRepository {
  Future<Result<List<TeamGroup>, Exception>> getTeamGroups(
    String sportsCategoryUid,
  );

  Future<Result<TeamGroup, Exception>> saveTeamGroup(TeamGroup group);

  Future<Result<bool, Exception>> deleteTeamGroup(String uid);
}
