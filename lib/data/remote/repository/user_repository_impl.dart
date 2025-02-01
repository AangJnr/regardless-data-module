import 'dart:io' show Platform;

//import 'package:custom_platform_device_id/platform_device_id.dart';
import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/dashboard_metrics_api.dart';
import 'package:regardless_data_module/domain/model/dashboard_metrics.dart';

import '../../../app/app.logger.dart';
import '../../../domain/model/follower.dart';
import '../../../domain/model/membership.dart';
import '../../../domain/model/notification.dart';
import '../../../domain/model/pagination.dart';
import '../../../domain/model/review/review.dart';
import '../../../domain/model/user.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../local/session_manager_service.dart';
import '../../model/a_review/a_review.dart';
import '../../model/membership_a.dart';
import '../../model/notification_a.dart';
import '../../model/notification_request.dart';
import '../../model/paginated_response.dart';
import '../../model/user_follower.dart';
import '../../model/user_response/user_response.dart';
import 'base_repository.dart';

class UserRepositoryImpl with BaseRepository implements UserRepository {
  @override
  Future<Result<AUser, Exception>> getUser() async {
    var data = await processRequest(() => apiService.getUser());

    if (data.isSuccess()) {
      final user = UserResponse.fromMap(data.tryGetSuccess()!).mapToDomain();
      sessionManager.setUserProfile(user);
      return Success(user);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> getPublicUser(String uid) async {
    var data = await processRequest(() => apiService.getPublicUser(uid));
    if (data.isSuccess()) {
      return Success(UserResponse.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> deleteAccount(
      String title, String message) async {
    var data =
        await processRequest(() => apiService.deleteAccount(title, message));
    if (data.isSuccess()) {
      return Future.value(const Success(true));
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<bool, Exception>> updateDeviceToken(String token) async {
    const deviceId =
        "regardlessWebApp"; //(await PlatformDeviceId.getDeviceId)?.trim();

    final notificationRequest = (kIsWeb)
        ? NotificationRequest(
            deviceId: sessionManager.getUserProfile().uid,
            token: token,
            active: true,
            type: 'web')
        : NotificationRequest(
            deviceId: deviceId,
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
  Future<Result<AUser, Exception>> updateProfile(AUser profile) async {
    var data =
        await processRequest(() => apiService.updateUserProfile(profile));
    if (data.isSuccess()) {
      return await getUser();
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> updateUserName(String userName) async {
    var data = await processRequest(() => apiService.updateUserName(userName));
    if (data.isSuccess()) {
      return await getUser();
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<AUser, Exception>> updateProfilePhoto(String base64Data) async {
    final data = await processRequest(() => apiService.uploadPhoto(base64Data));
    if (data.isSuccess()) {
      return await getUser();
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
            allData.addAll(paginatedResults.data!
                .map((e) => AReview.fromMap(e).mapToDomain()));
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
  Future<Result<Follower, Exception>> followUser(Follower follower) async {
    var response = await processRequest(() => apiService.followUser(follower));
    if (response.isSuccess()) {
      final data =
          FollowerResponse.fromMap(response.tryGetSuccess()!).mapToDomain();
      return Success(data);
    }
    return Future.value(Error(response.tryGetError()!));
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
        allData.addAll(paginatedResults.data
                ?.map((e) => UserResponse.fromMap(e).mapToDomain()) ??
            []);
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
      return Success(
          DashboardMetricsApi.fromMap(data.tryGetSuccess()).mapToDomain());
    }
    return Future.value(Error(data.tryGetError()!));
  }
}
