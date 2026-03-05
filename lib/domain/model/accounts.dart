import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/user.dart';
part 'accounts.mapper.dart';

@MappableClass()
class Accounts with AccountsMappable {
  final List<AUser> owned;
  final List<AUser> collaborated;
  final bool canAddMore;
  Accounts({
    this.owned = const [],
    this.collaborated = const [],
    this.canAddMore = false,
  });
}
