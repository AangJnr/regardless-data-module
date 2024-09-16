import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/dashboard_metrics.dart';
import '../../data/model/notification_request.dart';
import '../../data/model/paginated_response.dart';
import '../model/follower.dart';
import '../model/membership.dart';
import '../model/notification.dart';
import '../model/pagination.dart';
import '../model/review/review.dart';
import '../model/user.dart';

abstract class UserRepository {
  Future<Result<AUser, Exception>> getUser();
  Future<Result<AUser, Exception>> getPublicUser(String uid);
  Future<Result<AUser, Exception>> updateProfile(AUser profile);
  Future<Result<AUser, Exception>> updateProfilePhoto(String base64Data);
  Future<Result<bool, Exception>> deleteAccount(String title, String message);
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
  Future<Result<Follower, Exception>> followUser(Follower follower);
  Future<Result<String, Exception>> sendNotificationMessage(
      String userUid, String message);
    Future<Result<DashboardMetrics, Exception>> getDashboardMetrics(String date);

}
