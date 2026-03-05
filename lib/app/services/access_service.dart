import 'package:regardless_data_module/app/app.logger.dart';
import 'package:regardless_data_module/domain/access_manager.dart';
import 'package:regardless_data_module/domain/model/collaborator/staff_member.dart';

class AccessService {
  AccessManager _manager = AccessManager.admin();
  AccessManager get manager => _manager;

  void setAdmin() {
    _manager = AccessManager.admin();
  }

  void setOwner() {
    _manager = AccessManager.owner();
  }

  void setCollaborator(StaffMember member) {
    getLogger('AccessService').i(
        'setCollaborator => ${member.userName} with role ${member.role} and permissions ${member.permissions}');
    _manager = AccessManager.collaborator(member);
  }
}
