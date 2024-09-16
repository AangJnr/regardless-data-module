import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<bool, Exception>> attemptLogout();
  Future<Result<bool, Exception>> checkName(String name);
  Future<Result<bool, Exception>> deleteAccount();
}
