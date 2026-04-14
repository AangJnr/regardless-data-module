import 'package:cross_file/cross_file.dart' show XFile;
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/accounts.dart';
import 'package:regardless_data_module/domain/model/collaborator/collaborator_invite.dart';
import 'package:regardless_data_module/domain/model/collaborator/staff_member.dart';
import 'package:regardless_data_module/domain/model/dashboard_metrics.dart';
import 'package:regardless_data_module/domain/model/timeline/timeline_item.dart';
import '../model/service/time_slot.dart';
import '../model/collaborator/collaborator_role.dart';
import '../../data/model/notification_request.dart';
import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../model/follower.dart';
import '../model/hash_image.dart';
import '../model/membership.dart';
import '../model/new_user.dart';
import '../model/notification.dart';
import '../model/pagination.dart';
import '../model/preference.dart';
import '../model/review/review.dart';
import '../model/activity_alert.dart';
import '../model/update_user.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<Result<AUser, Exception>> getUser();
  Future<Result<Accounts, Exception>> getUserAccounts([bool refresh = false]);
  Future<Result<AUser, Exception>> getPublicUser(String uid);
  Future<Result<Pagination<TimelineItem>, Exception>> getProviderTimeline(
      String uid,
      {PaginationRequest? request});
  Future<Result<AUser, Exception>> createUserAccount(NewUser user);
  Future<Result<AUser, Exception>> updateUserProfile(UpdateUser profile);
  Future<Result<bool, Exception>> setDefaultUserAccount(String profileUid);
  Future<Result<HashImage, Exception>> updateProfilePhoto(
      String profileUid, XFile file);
  Future<Result<bool, Exception>> deleteAccount(String uid,
      {String title = 'None', String reason = 'Not provided'});
  Future<bool> deleteUserData();

  Future<Result<bool, Exception>> updateDeviceToken(String token);
  Future<NotificationRequest?> getDeviceToken(String token);
  Future<Result<AUser, Exception>> updateUserName(String userName);
  Future<Result<Pagination<Notification>, Exception>> getNotifications(
      {PaginationRequest? request});
  Future<Result<bool, Exception>> markNotificationAsread(String uid);
  Future<Result<Pagination<Review>, Exception>> getReviews(
      {PaginationRequest? request, String userUid = ''});
  Future<Result<Pagination<Membership>, Exception>> getSubscriptions(
      {PaginationRequest? request, String userUid = ''});
  Future<Result<Pagination<AUser>, Exception>> getFollowers(
      {PaginationRequest? request, String userUid = ''});
  Future<Result<Pagination<Follower>, Exception>> getFollowing(
      {PaginationRequest? request, String userUid = ''});
  Future<Result<Follower, Exception>> followUser(String uid);
  Future<Result<bool, Exception>> unfollowUser(String uid);
  Future<Result<String, Exception>> sendNotificationMessage(
      String userUid, String message);
  Future<Result<DashboardMetrics, Exception>> getDashboardMetrics(String date);
  Future<Result<Preference, Exception>> getUserPreference();
  Future<Result<bool, Exception>> updatePreference(Preference preference);

  Future<Result<Pagination<Review>, Exception>> getProviderReviews(
      {PaginationRequest? request, String uid = ''});
  Future<Result<Review, Exception>> addProviderReview(
      {required Review review, String uid = ''});
  Future<Result<List<AUser>, Exception>> searchUsers(SearchEventParams params);

  Future<Result<bool, Exception>> inviteCollaborators(List<AUser> users,
      String uid, CollaboratorRole role, List<String> permissions);
  Future<Result<bool, Exception>> updateCollaboratorPermissions(String uid,
      String collaboratorUid, CollaboratorRole role, List<String> permissions);
  Future<Result<Pagination<CollaboratorInvite>, Exception>>
      getInvitedCollaborators(String uid, {PaginationRequest? request});
  Future<Result<bool, Exception>> deleteCollaboratorInvite(
      String uid, String inviteId);

  Future<Result<CollaboratorInvite, Exception>> acceptCollaboratorInvite(
      {required String token, required String providerUid});
  Future<Result<bool, Exception>> finalizeCollaboratorInvite(
      {required String token, required String providerUid});

  Future<Result<Pagination<StaffMember>, Exception>> getCollaborators(
      String uid,
      {PaginationRequest? request});
  Future<Result<StaffMember, Exception>> getCollaborator(
    String uid,
  );
  Future<Result<bool, Exception>> removeCollaborator(
      String uid, String collaboratorUid);
  Future<Result<bool, Exception>> updateUserSchedule(
      String uid, List<TimeSlot> schedule);

}
