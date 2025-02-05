import 'package:http/http.dart' show Response;
import 'package:regardless_data_module/app/config/enums.dart';

import '../../data/model/appointment_api/appointment_api.dart';
import '../../data/model/community_api/comment_api.dart';
import '../../data/model/community_api/community_api.dart';
import '../../data/model/new_event_api.dart';
import '../../data/model/notification_request.dart';
import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../../data/model/service_api/service_api.dart';
import '../model/appointment/appointment.dart';
import '../model/community/community.dart';
import '../model/community/member.dart';
import '../model/follower.dart';
import '../model/user.dart';
import '../repositories/event_repository.dart';

abstract class ApiService {
  Future<Response> attemptLogout();
  Future<Response> checkUserName(String name);
  Future<Response> updateUserProfile(AUser profile);
  Future<Response> getUser();
  Future<Response> getPublicUser(String uid);
  Future<Response> deleteUser(String id);
  Future<dynamic> uploadPhoto(String base64Data);
  Future<Response> deleteAccount(String title, String message);
  Future<Response> updateFCMTokekn(NotificationRequest request,
      {bool isUpdate = false});
  Future<Response> getFCMToken(String registrationId);
  Future<Response> updateUserName(String userName);
  Future<Response> getCategories();
  Future<Response> getFeed({PaginationRequest? request});
  @Deprecated('Use searchEventsV2 instead')
  Future<Response> searchEvents(SearchFilter filter);
  Future<Response> searchEventsV2(SearchEventParams params);
  Future<Response> getPopularEvents(SearchEventParams params);
  Future<Response> searchNearbyCommunities(SearchEventParams params);

  Future<Response> getProviderEvents(String providerUid,
      {PaginationRequest? request});
  Future<Response> linkToCommunity(String eventUid, Community community);
  Future<Response> unlinkFromCommunity(String eventUid, Community community);

  Future<Response> getEvent(String uid);
  Future<Response> getEvents({PaginationRequest? request});
  Future<Response> addEvent(NewEventRequest e);
  Future<Response> attendEvent(String eventUid);
  Future<Response> unattendEvent(String eventUid);
  Future<Response> getEventAttendees(String uid, {PaginationRequest? request});
  Future<Response> deleteEvent(String eventUid, EventActionType actionType);
  Future<Response> updateEvent(NewEventRequest e, EventActionType actionType);

  Future<Response> getRecurringEvent(String uid, String recurrenceUid);
  Future<Response> getRecurringEvents(String recurrenceUid, {PaginationRequest? request});
  Future<Response> updateRecurringEvent(NewEventRequest e, EventActionType actionType);
  Future<Response> attendRecurringEvent(String eventUid,String recurrenceUid);
  Future<Response> unattendRecurringEvent(String eventUid,String recurrenceUid);
  Future<Response> getRecurringEventAttendees(String uid, String recurrenceUid,
      {PaginationRequest? request});
  Future<Response> deleteRecurringEvent(
      String eventUid, String recurrenceUid, EventActionType actionType);

  Future<Response> getNotifications({PaginationRequest? request});
  Future<Response> markNotificationAsRead(String uid);
  Future<Response> getReviews(
      {String userUid = '', PaginationRequest? request});
  Future<Response> getSubscriptions(
      {String userUid = '', PaginationRequest? request});
  Future<Response> reverseGeoLocation(double lat, double lng);
  Future<Response> logout();
  Future<Response> followUser(Follower f);
  Future<Response> getFollowers({PaginationRequest? request});
  Future<Response> getFollowing({PaginationRequest? request});
  Future<Response> followEvent(String eventUid);
  Future<Response> getFavorateEvents();
  Future<Response> addEventToFavorates(String eventUid);
  Future<Response> removeEventFromFavorates(String eventUid);
  Future<Response> sendMessage(String user, String message);
  Future<Response> getCommunityEvents(String communityUid,
      {PaginationRequest? request});
  Future<Response> addAppointment(AppointmentApi appointment);
  Future<Response> getAppointment(String uid);
  Future<Response> deleteAppointment(String uid);
  Future<Response> getAppointments({PaginationRequest? request});
  Future<Response> getAppointmentRequests({PaginationRequest? request});
  Future<Response> getAppointmentRequest(String uid);

  Future<Response> addService(ServiceApi service);
  Future<Response> getService(String providerUid, String serviceUid);
  Future<Response> setServiceAsActive(String serviceUid, {bool isActive});
  Future<Response> deleteService(String uid);
  Future<Response> getProviderServices(String providerUid);

  Future<Response> addCommunity(CommunityApi e);
  Future<Response> getCommunity(String ownerUid, String uid);
  Future<Response> deleteCommunity(String uid);
  Future<Response> addAComment(String uid, CommentApi comment);
  Future<Response> deleteComment(String communityUid, String uid);
  Future<Response> joinCommunity(String uid);
  Future<Response> requestToJoin(String uid, {required String userUid});
  Future<Response> approveRequestToJoinCommunity(String uid, Member member);
  Future<Response> leaveCommunity(String uid);
  Future<Response> getUserJoinedCommunities();
    Future<Response> joinCommunities(List<String> private, List<String> public);

  Future<Response> getUserCommunities(String ownerUid,
      {PaginationRequest? request});
  Future<Response> getCommunityComments(String uid,
      {PaginationRequest? request});
  Future<Response> getCommunityMembers(String uid,
      {PaginationRequest? request});
  Future<Response> getCommunityMemberRequests(String uid,
      {PaginationRequest? request});
  Future<Response> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointment);
  Future<Response> getDashboardMetrics(String date);
}
