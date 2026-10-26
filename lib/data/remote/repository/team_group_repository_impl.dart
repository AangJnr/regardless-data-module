import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/remote/repository/base_repository.dart';
import 'package:regardless_data_module/domain/model/team/team_group.dart';
import 'package:regardless_data_module/domain/repositories/team_group_repository.dart';

class TeamGroupRepositoryImpl
    with BaseRepository
    implements TeamGroupRepository {
  @override
  Future<Result<List<TeamGroup>, Exception>> getTeamGroups(
    String sportsCategoryUid,
  ) async {
    final result = await processRequest(
      () => apiService.getTeamGroups(sportsCategoryUid),
    );
    if (result.isError()) return Error(result.tryGetError()!);

    final data = result.tryGetSuccess();
    if (data is! List) {
      return Error(const FormatException('Expected a list of team groups.'));
    }
    try {
      return Success(
        data.map((item) {
          if (item is! Map<String, dynamic>) {
            throw const FormatException('Invalid team group response.');
          }
          return TeamGroupMapper.fromMap(item);
        }).toList(),
      );
    } on Exception catch (error) {
      return Error(error);
    }
  }

  @override
  Future<Result<TeamGroup, Exception>> saveTeamGroup(TeamGroup group) async {
    final result = await processRequest(() => apiService.saveTeamGroup(group));
    if (result.isError()) return Error(result.tryGetError()!);
    final data = result.tryGetSuccess();
    if (data is! Map<String, dynamic>) {
      return Error(const FormatException('Expected a saved team group.'));
    }
    try {
      return Success(TeamGroupMapper.fromMap(data));
    } on Exception catch (error) {
      return Error(error);
    }
  }

  @override
  Future<Result<bool, Exception>> deleteTeamGroup(String uid) async {
    final result = await processRequest(() => apiService.deleteTeamGroup(uid));
    if (result.isSuccess()) return const Success(true);
    return Error(result.tryGetError()!);
  }
}
