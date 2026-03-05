import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/extensions/extensions.dart';
import '../collaborator/collaborator_role.dart';

part 'staff_member.mapper.dart';

@MappableClass()
class StaffMember with StaffMemberMappable {
  final String uid;
  final String userName;
  final CollaboratorRole role; // NEW: Admin | Manager | Staff
  final List<String> permissions; // NEW: ["manage_schedule:view", ...]
  final DateTime? joinedAt;
  const StaffMember({
    this.uid = '',
    this.userName = '',
    this.role = CollaboratorRole.staff,
    this.permissions = const [],
    this.joinedAt,
  });

  String get profilePicture => uid.profileUidToProfileUrl;
}
