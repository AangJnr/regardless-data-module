import 'package:multiple_result/multiple_result.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'base_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  @override
  Future<Result<bool, Exception>> attemptLogout() async {
    await processRequest(() => apiService.attemptLogout());
    return Future.value(const Success(true));
  }

  @override
  Future<Result<bool, Exception>> checkName(String name) async {
    var data = await processRequest(() => apiService.checkUserName(name));
    if (data.isSuccess()) {
      final result = data.tryGetSuccess()! as Map<String, dynamic>;
      return Future.value(Success(result['valid'] == true));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> deleteAccount() async {
    var data = await processRequest(
        () => apiService.deleteUser(sessionManager.getUserProfile().uid));
    if (data.isSuccess()) {
      final result = data.tryGetSuccess()! as Map<String, dynamic>;

      sessionManager.invalidate();
      return Future.value(Success(result.containsKey('message')));
    }
    return Future.value(Error(data.tryGetError()!));
  }
}
