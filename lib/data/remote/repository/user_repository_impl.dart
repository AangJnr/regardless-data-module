import 'dart:convert';
import 'dart:io' show Platform;

//import 'package:custom_platform_device_id/platform_device_id.dart';
import 'package:cross_file/cross_file.dart' show XFile;
import 'package:flutter/foundation.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/app/app.locator.dart';
import 'package:regardless_data_module/app/services/cache_service.dart';
import 'package:regardless_data_module/domain/model/accounts.dart';
import 'package:regardless_data_module/domain/model/collaborator/collaborator_invite.dart';
import 'package:regardless_data_module/domain/model/collaborator/staff_member.dart';
import 'package:regardless_data_module/domain/model/dashboard_metrics.dart';
import 'package:regardless_data_module/domain/model/service/time_slot.dart';
import '../../../domain/media.dart';
import '../../../domain/model/collaborator/collaborator_role.dart';

import '../../../app/app.logger.dart';
import '../../../domain/model/follower.dart';
import '../../../domain/model/hash_image.dart';
import '../../../domain/model/membership.dart';
import '../../../domain/model/new_user.dart';
import '../../../domain/model/notification.dart';
import '../../../domain/model/pagination.dart';
import '../../../domain/model/preference.dart';
import '../../../domain/model/review/review.dart';
import '../../../domain/model/update_user.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../local/session_manager_service.dart';
import '../../model/membership_a.dart';
import '../../model/notification_a.dart';
import '../../model/notification_request.dart';
import '../../model/paginated_response.dart';
import '../../model/search_filter.dart';
import '../../model/user_follower.dart';
import 'base_repository.dart';

class UserRepositoryImpl with BaseRepository implements UserRepository {
  @override
  Future<Result<AUser, Exception>> createUserAccount(NewUser user) async {
    var data = await processRequest(() => apiService.createUserAccount(user));
    if (data.isSuccess()) {
      await getUserAccounts(true);
      return Success(AUserMapper.fromMap(data.tryGetSuccess()!));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> getUser() async {
    var data = await processRequest(() => apiService.getUser());

    if (data.isSuccess()) {
      final user = AUserMapper.fromMap(data.tryGetSuccess()!);
      sessionManager.setUser(user);
      return Success(user);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<Accounts, Exception>> getUserAccounts(
      [bool refresh = false]) async {
    final cache = module<CacheService>();

    if (refresh) {
      cache.clear('user_accounts');
    }
    try {
      final accounts = await cache.execute<Accounts?>(() async {
        var data = await processRequest(() => apiService.getUserAccounts());
        if (data.isSuccess()) {
          return AccountsMapper.fromMap(data.tryGetSuccess()!);
        }
        return null;
      }, 'user_accounts');
      if (accounts != null) {
        return Success(accounts);
      } else {
        cache.clear('user_accounts');
        return Future.value(Error(Exception("Unable to fetch accounts")));
      }
    } catch (e) {
      cache.clear('user_accounts');

      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<bool, Exception>> setDefaultUserAccount(
      String profileUid) async {
    var data = await processRequest(
        () => apiService.setDefaultUserAccount(profileUid));

    if (data.isSuccess()) return Success(data.isSuccess());
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> getPublicUser(String uid) async {
    var data = await processRequest(() => apiService.getPublicUser(uid));
    if (data.isSuccess()) {
      return Success(AUserMapper.fromMap(data.tryGetSuccess()!));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> deleteAccount(String uid,
      {String title = 'None', String reason = 'Not provided'}) async {
    var data = await processRequest(
        () => apiService.deleteAccount(uid, title: title, reason: reason));
    if (data.isSuccess()) {

      return Future.value(const Success(true));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<bool> deleteUserData() async {
    try {
      var data = await processRequest(() => apiService.deleteUserData());
      if (data.isSuccess()) {
        sessionManager.invalidate();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Result<bool, Exception>> updateDeviceToken(String token) async {
    if (!sessionManager.isLoggedIn()) {
      return Success(false);
    }
    final mobileDeviceIdentifier = base64Encode(utf8.encode(
        await MobileDeviceIdentifier().getDeviceId() ??
            'regardless_mobile_app'));

    final notificationRequest = (kIsWeb)
        ? NotificationRequest(
            deviceId: sessionManager.getUserProfile().uid,
            token: token,
            active: true,
            type: 'web')
        : NotificationRequest(
            deviceId: mobileDeviceIdentifier,
            token: token,
            active: true,
            type: Platform.isIOS ? 'ios' : 'android');
    var data = await processRequest(() => apiService.updateFCMTokekn(
          notificationRequest,
        ));
    if (data.isSuccess()) {
      sessionManager.set(NotificationKey, token);
      return Future.value(const Success(true));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<NotificationRequest?> getDeviceToken(String token) async {
    try {
      var data = await processRequest(() => apiService.getFCMToken(token));
      if (data.isSuccess()) {
        sessionManager.set(NotificationKey, token);
        return Future.value(NotificationRequest.fromMap(data.tryGetSuccess()));
      }
    } catch (e) {
      return Future.value(null);
    }
    return null;
  }

  @override
  Future<Result<AUser, Exception>> updateUserProfile(UpdateUser profile) async {
    var data =
        await processRequest(() => apiService.updateUserProfile(profile));
    if (data.isSuccess()) {
      final user = AUserMapper.fromMap(data.tryGetSuccess()!);
      sessionManager.setUser(user);
      return Success(user);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> updateUserName(String userName) async {
    var data = await processRequest(() => apiService.updateUserName(
        userName: userName, profileUid: sessionManager.getUserProfile().uid));
    if (data.isSuccess()) {
      return await getUser();
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<HashImage, Exception>> updateProfilePhoto(
      String profileUid, XFile file) async {
    final data = await processMultiPartRequest(
        () => apiService.uploadPhoto(profileUid, file));
    if (data.isSuccess()) {
      return Success(HashImageMapper.fromMap(data.tryGetSuccess()!));
    }
    return Future.value(Error(Exception('Error occurred uploading image')));
  }

  @override
  Future<Result<Pagination<Notification>, Exception>> getNotifications(
      {PaginationRequest? request}) async {
    try {
      bool hasNext = false;
      List<Notification> allData = [];
      var data = await processRequest(
          () => apiService.getNotifications(request: request));
      if (data.isSuccess()) {
        final paginatedResults =
            PaginatedResponse.fromMap(data.tryGetSuccess()!);
        if (paginatedResults.data != null) {
          try {
            allData.addAll(paginatedResults.data!
                .map((e) => NotificationA.fromMap(e).mapToDomain()));
          } catch (e) {
            //
          }
          hasNext = paginatedResults.hasNext;
        }
      }
      return Future.value(
          Success(Pagination<Notification>(data: allData, hasNext: hasNext)));
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<bool, Exception>> markNotificationAsread(String uid) async {
    try {
      var data =
          await processRequest(() => apiService.markNotificationAsRead(uid));
      return Future.value(Success(data.isSuccess()));
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<Pagination<Review>, Exception>> getReviews(
      {PaginationRequest? request, String userUid = ''}) async {
    try {
      bool hasNext = false;
      List<Review> allData = [];
      var data = await processRequest(
          () => apiService.getReviews(request: request, userUid: userUid));
      if (data.isSuccess()) {
        final paginatedResults =
            PaginatedResponse.fromMap(data.tryGetSuccess()!);

        if (paginatedResults.data != null) {
          try {
            allData.addAll(
                paginatedResults.data!.map((e) => ReviewMapper.fromMap(e)));
          } catch (e) {
            //
          }
          hasNext = paginatedResults.hasNext;
        }
      }
      return Future.value(
          Success(Pagination<Review>(data: allData, hasNext: hasNext)));
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<Pagination<Membership>, Exception>> getSubscriptions(
      {PaginationRequest? request, String userUid = ''}) async {
    try {
      bool hasNext = false;
      List<Membership> allData = [];
      var data = await processRequest(() =>
          apiService.getSubscriptions(request: request, userUid: userUid));
      if (data.isSuccess()) {
        final paginatedResults =
            PaginatedResponse.fromMap(data.tryGetSuccess()!);
        if (paginatedResults.data != null) {
          try {
            allData.addAll(paginatedResults.data!
                .map((e) => MembershipA.fromMap(e).mapToDomain()));
            // ignore: empty_catches
          } catch (e) {}
          hasNext = paginatedResults.hasNext;
        }
      }
      return Future.value(
          Success(Pagination<Membership>(data: allData, hasNext: hasNext)));
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<Follower, Exception>> followUser(String uid) async {
    final response = await processRequest(() => apiService.followUser(uid));
    if (response.isSuccess()) {
      final data =
          FollowerResponse.fromMap(response.tryGetSuccess()!).mapToDomain();
      return Success(data);
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> unfollowUser(String uid) async {
    final response = await processRequest(() => apiService.unfollowUser(uid));
    if (response.isSuccess()) {
      return const Success(true);
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<AUser>, Exception>> getFollowers(
      {PaginationRequest? request, String userUid = ''}) async {
    List<AUser> allData = [];
    bool hasNext = false;
    var data =
        await processRequest(() => apiService.getFollowers(request: request));
    if (data.isSuccess()) {
      final paginatedResults = PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        allData.addAll(
            paginatedResults.data?.map((e) => AUserMapper.fromMap(e)) ?? []);
      } catch (e) {
        getLogger("UserRepo").e(e);
      }
      hasNext = paginatedResults.hasNext;
    }
    return Success(Pagination(data: allData, hasNext: hasNext));
  }

  @override
  Future<Result<Pagination<Follower>, Exception>> getFollowing(
      {PaginationRequest? request, String userUid = ''}) async {
    List<Follower> allData = [];
    bool hasNext = false;
    var data =
        await processRequest(() => apiService.getFollowing(request: request));
    if (data.isSuccess()) {
      final paginatedResults = PaginatedResponse.fromMap(data.tryGetSuccess()!);

      if (paginatedResults.data != null) {
        try {
          allData.addAll(paginatedResults.data!
              .map((e) => FollowerResponse.fromMap(e).mapToDomain()));
        } catch (e) {
          //
        }
      }
      hasNext = paginatedResults.hasNext;
    }
    return Future.value(
        Success(Pagination<Follower>(data: allData, hasNext: hasNext)));
  }

  @override
  Future<Result<String, Exception>> sendNotificationMessage(
      String userUid, String message) async {
    var data =
        await processRequest(() => apiService.sendMessage(userUid, message));

    if (data.isSuccess()) {
      return Success(data.tryGetSuccess());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<DashboardMetrics, Exception>> getDashboardMetrics(
      String date) async {
    var data = await processRequest(() => apiService.getDashboardMetrics(date));
    if (data.isSuccess()) {
      return Success(DashboardMetricsMapper.fromMap(data.tryGetSuccess()));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<Preference, Exception>> getUserPreference() async {
    var data = await processRequest(() => apiService.getUserPreferences());
    if (data.isSuccess()) {
      final prefData = (data.tryGetSuccess()! as Map<String, dynamic>);
      final preference = PreferenceMapper.fromMap(prefData);
      return Future.value(Success(preference));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> updatePreference(
      Preference preference) async {
    var data =
        await processRequest(() => apiService.updatePreferences(preference));
    if (data.isSuccess()) {
      return Future.value(const Success(true));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<Pagination<Review>, Exception>> getProviderReviews(
      {PaginationRequest? request, String uid = ''}) async {
    try {
      var data = await processRequest(
          () => apiService.getProviderReviews(request: request, uid: uid));
      if (data.isSuccess()) {
        final paginationResponse =
            PaginatedResponse.fromMap(data.tryGetSuccess()!);
        final parsed = paginationResponse.data
            ?.map((e) => ReviewMapper.fromMap(e))
            .toList();
        return Success(Pagination<Review>(
            data: parsed ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } else {
        return Error(data.tryGetError()!);
      }
    } catch (e) {
      return Future.value(Error(Exception(e)));
    }
  }

  @override
  Future<Result<Review, Exception>> addProviderReview(
      {required Review review, String uid = ''}) async {
    var response = await processRequest(
        () => apiService.addProviderReview(review: review, uid: uid));
    if (response.isSuccess()) {
      return Success(ReviewMapper.fromMap(response.tryGetSuccess()!));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<List<AUser>, Exception>> searchUsers(
      SearchEventParams params) async {
    var data = await processRequest(() => apiService.searchUsers(params));
    if (data.isSuccess()) {
      final results = (data.tryGetSuccess()! as List<dynamic>)
          .map((data) => AUserMapper.fromMap(data))
          .toList();
      return Success(results);
    }
    return Success([]);
  }

  @override
  Future<Result<List<Media>, Exception>> uploadProviderMedia(
      String uid, List<XFile> files) async {
    final response = await processMultiPartRequest(
        () => apiService.uploadProviderMedia(uid, files));
    if (response.isSuccess()) {
      return Success((response.tryGetSuccess()! as List)
          .map((data) => MediaMapper.fromMap(data))
          .toList());
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Media>, Exception>> getProviderMedia(String uid,
      {PaginationRequest? request}) async {
    final response = await processRequest(
        () => apiService.getProviderMedia(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      final parsed =
          paginationResponse.data?.map((e) => MediaMapper.fromMap(e)).toList();
      return Success(Pagination<Media>(
          data: parsed ?? [],
          hasNext: paginationResponse.hasNext,
          last: paginationResponse.last));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteProviderMedia(
      String uid, List<String> uids) async {
    final response =
        await processRequest(() => apiService.deleteProviderMedia(uid, uids));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> inviteCollaborators(List<AUser> users,
      String uid, CollaboratorRole role, List<String> permissions) async {
    final response = await processRequest(() => apiService.inviteCollaborators(
        users,
        uid,
        role.name[0].toUpperCase() + role.name.substring(1),
        permissions));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> updateCollaboratorPermissions(
      String uid,
      String collaboratorUid,
      CollaboratorRole role,
      List<String> permissions) async {
    final response = await processRequest(() =>
        apiService.updateCollaboratorPermissions(uid, collaboratorUid,
            role.name[0].toUpperCase() + role.name.substring(1), permissions));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<CollaboratorInvite>, Exception>>
      getInvitedCollaborators(String uid, {PaginationRequest? request}) async {
    final response = await processRequest(
        () => apiService.getInvitedCollaborators(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      final parsed = paginationResponse.data
          ?.map((e) => CollaboratorInviteMapper.fromMap(e))
          .toList();
      return Success(Pagination<CollaboratorInvite>(
          data: parsed ?? [],
          hasNext: paginationResponse.hasNext,
          last: paginationResponse.last));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteCollaboratorInvite(
      String uid, String inviteId) async {
    final response = await processRequest(
        () => apiService.deleteCollaboratorInvite(uid, inviteId));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<CollaboratorInvite, Exception>> acceptCollaboratorInvite(
      {required String token, required String providerUid}) async {
    final response = await processRequest(
        () => apiService.acceptCollaboratorInvite(token, providerUid));
    if (response.isSuccess()) {
      return Success(
          CollaboratorInviteMapper.fromMap(response.tryGetSuccess()!));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> finalizeCollaboratorInvite(
      {required String token, required String providerUid}) async {
    final response = await processRequest(
        () => apiService.finalizeCollaboratorInvite(token, providerUid));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<StaffMember>, Exception>> getCollaborators(
      String uid,
      {PaginationRequest? request}) async {
    final response = await processRequest(
        () => apiService.getCollaborators(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      final parsed = paginationResponse.data
          ?.map((e) => StaffMemberMapper.fromMap(e))
          .toList();
      return Success(Pagination<StaffMember>(
          data: parsed ?? [],
          hasNext: paginationResponse.hasNext,
          last: paginationResponse.last));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<StaffMember, Exception>> getCollaborator(String uid) async {
    final response =
        await processRequest(() => apiService.getCollaborator(uid));
    if (response.isSuccess()) {
      return Success(StaffMemberMapper.fromMap(response.tryGetSuccess()!));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> removeCollaborator(
      String uid, String collaboratorUid) async {
    final response = await processRequest(
        () => apiService.removeCollaborator(uid, collaboratorUid));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> updateUserSchedule(
      String uid, List<TimeSlot> schedule) async {
    final response = await processRequest(() => apiService.updateUserSchedule(
        uid, schedule.map((e) => e.toApi()).toList()));
    if (response.isSuccess()) {
      // Refresh user to update local session
      await getUser();
      return const Success(true);
    }
    return Error(response.tryGetError()!);
  }
}
