import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/user.dart';
part 'accounts.mapper.dart';

@MappableClass()
class Accounts with AccountsMappable {
  final List<AUser> profiles;
   final bool canAddMore;
  Accounts(
      {this.profiles = const [],
       this.canAddMore = true});
}
