import 'package:regardless_data_module/domain/model/collaborator/staff_member.dart';

import 'model/collaborator/collaborator_role.dart';
import 'model/collaborator/collaborator_permission.dart';

class AccessManager {
  final bool _isOwner;
  final List<String> _permissions;
  final CollaboratorRole _role;

  AccessManager.admin()
      : _isOwner = true,
        _permissions = [],
        _role = CollaboratorRole.admin;

  AccessManager.owner()
      : _isOwner = true,
        _permissions = [],
        _role = CollaboratorRole.admin;
  AccessManager.collaborator(StaffMember member)
      : _isOwner = false,
        _role = member.role,
        _permissions = member.permissions;

  bool can(String permission) => _isOwner || _permissions.contains(permission);
  bool canView(String section) => can('$section:view');
  bool canEdit(String section) => can('$section:edit');
  bool canDelete(String section) => can('$section:delete');

  bool get canManageSchedule => canView(kManageSchedule);
  bool get canEditSchedule => canEdit(kManageSchedule);
  bool get canDeleteSchedule => canDelete(kManageSchedule);

  bool get canManageActivities => canView(kManageActivities);
  bool get canEditActivities => canEdit(kManageActivities);
  bool get canDeleteActivities => canDelete(kManageActivities);

  bool get canManagePackages => canView(kManagePackages);
  bool get canEditPackages => canEdit(kManagePackages);
  bool get canDeletePackages => canDelete(kManagePackages);

  bool get canManageMedia => canView(kManageMedia);
  bool get canEditMedia => canEdit(kManageMedia);
  bool get canDeleteMedia => canDelete(kManageMedia);

  bool get canManageCollaborators => canView(kManageCollaborators);
  bool get canEditCollaborators => canEdit(kManageCollaborators);
  bool get canDeleteCollaborators => canDelete(kManageCollaborators);

  bool get canManageConversations => canView(kManageConversations);
  bool get canEditConversations => canEdit(kManageConversations);
  bool get canDeleteConversations => canDelete(kManageConversations);

  bool get canManagePosts => canView(kManagePosts);
  bool get canEditPosts => canEdit(kManagePosts);
  bool get canDeletePosts => canDelete(kManagePosts);

  bool get canManageTeams => canView(kManageTeams);
  bool get canEditTeams => canEdit(kManageTeams);
  bool get canDeleteTeams => canDelete(kManageTeams);

  bool get canManageLeagues => canView(kManageLeagues);
  bool get canEditLeagues => canEdit(kManageLeagues);
  bool get canDeleteLeagues => canDelete(kManageLeagues);

  bool get canManageCommunities => canView(kManageCommunities);
  bool get canEditCommunities => canEdit(kManageCommunities);
  bool get canDeleteCommunities => canDelete(kManageCommunities);

  CollaboratorRole get role => _role;
  bool get isOwner => _isOwner;
}
