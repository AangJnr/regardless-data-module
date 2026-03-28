import 'package:regardless_data_module/domain/model/user.dart';

import 'collaborator_role.dart';

// Sections
const kManageSchedule = 'manage_schedule';
const kManageActivities = 'manage_activities';
const kManagePackages = 'manage_packages';
const kManageMedia = 'manage_media';
const kManageCollaborators = 'manage_collaborators';
const kManageConversations = 'manage_conversations';
const kManagePosts = 'manage_posts';
const kManageTeams = 'manage_teams';
const kManageLeagues = 'manage_leagues';
const kManageCommunities = 'manage_communities';

// Actions
const kView = 'view';
const kEdit = 'edit';
const kDelete = 'delete';

const kActions = [kView, kEdit, kDelete];

// Helper to build permission string
String permission(String section, String action) => '$section:$action';

List<String> getPermissionsForAccountType(AUser user) =>
    user.isSportsTeamAccount
        ? [
            kManageTeams,
            kManageActivities,
            kManageMedia,
            kManageCollaborators,
            kManageConversations,
            kManagePosts,
          ]
        : user.isLeagueManagerAccount
            ? [
                kManageActivities,
                kManageMedia,
                kManageCollaborators,
                kManagePosts,
                kManageTeams,
                kManageLeagues,
              ]
            : user.isGymAccount
                ? [
                    kManageSchedule,
                    kManagePackages,
                    kManageActivities,
                    kManageMedia,
                    kManageCollaborators,
                    kManageConversations,                kManagePosts,

                  ]
                : [
                    kManageActivities,
                    kManagePackages,
                    kManageMedia,
                    kManageCollaborators,
                    kManageConversations,
                    kManageCommunities,                kManagePosts,

                  ];

// Default permissions per role
List<String> defaultPermissionsForRole(AUser account, CollaboratorRole role) {
  final permissions = <String>[];
  final accountPermissions = getPermissionsForAccountType(account);

  switch (role) {
    case CollaboratorRole.admin:
      for (final section in accountPermissions) {
        for (final action in kActions) {
          permissions.add(permission(section, action));
        }
      }
      break;
    case CollaboratorRole.manager:
      for (final section in accountPermissions) {
        permissions.add(permission(section, kView));
        permissions.add(permission(section, kEdit));
      }
      break;
    case CollaboratorRole.staff:
      for (final section in accountPermissions) {
        permissions.add(permission(section, kView));
      }
      break;
  }

  return permissions;
}

// List<String> getPermissionsForAccountType(AUser user) {
//   // Implementation for getting permissions based on user account type
//   return [];
// }
