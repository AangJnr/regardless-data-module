// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:cross_file/cross_file.dart';
import 'package:http/http.dart' as http;
import 'package:regardless_data_module/app/config/enums.dart';
import 'package:regardless_data_module/data/model/community_api/comment_api.dart';
import 'package:regardless_data_module/data/model/community_api/community_api.dart';
import 'package:regardless_data_module/domain/model/community/community.dart';
import 'package:regardless_data_module/domain/model/community/member.dart';
import '../../domain/api/api_service.dart';
import '../../domain/model/appointment/appointment.dart';
import '../../domain/model/follower.dart';
import '../../domain/model/user.dart';
import '../../domain/repositories/event_repository.dart';
import '../model/appointment_api/appointment_api.dart';
import '../model/new_event_api.dart';
import '../model/notification_request.dart';
import '../model/paginated_response.dart';
import '../model/search_filter.dart';
import '../model/service_api/service_api.dart';
import 'repository/api_helpers.dart';
import 'routes.dart';

class ApiServiceImpl with ApiHelpers implements ApiService {
  @override
  Future<http.Response> attemptLogout() async {
    var response = post(Auth().LogoutPath,
        headers: await getHeaders(),
        body: jsonEncode({'refresh': sessionManager.getRefreshToken()}));
    return response;
  }

  @override
  Future<http.Response> checkUserName(String name) async {
    var response = post(Auth().NameCheck,
        headers: await getHeaders(isSecure: false),
        body: jsonEncode({"username": name}));
    return response;
  }

  @override
  Future<http.Response> updateUserProfile(AUser profile) async {
    final body = profile.mapToApi().toMap();
    var response = post(User().ProfileUpdate,
        headers: await getHeaders(), body: json.encode(body));
    return response;
  }

  @override
  Future<http.Response> updateUserName(String userName) async {
    var response = post(User().ProfileUpdate,
        headers: await getHeaders(), body: json.encode({"userName": userName}));
    return response;
  }

  @override
  Future<http.Response> getUser() async {
    var response = get(
      User().Profile,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getPublicUser(String uid) async {
    var response = get(
      User().PublicProfile(uid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> deleteUser(String id) async {
    var response = delete(
      Auth().DeleteAccount(sessionManager.getUserProfile().uid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<dynamic> uploadPhoto(String base64Data) async {
    var response = post(User().ImageUpload,
        headers: await getHeaders(),
        body: jsonEncode({'imageData': base64Data}));
    return response;
  }

  @override
  Future<http.Response> deleteAccount(String title, String message) async {
    var response = delete(User().Delete(sessionManager.getUserProfile().uid),
        headers: await getHeaders(),
        body: jsonEncode({
          'deletion_reason_title': title,
          'deletion_reason_detail': message
        }));
    return response;
  }

  @override
  Future<http.Response> updateFCMTokekn(NotificationRequest request,
      {bool isUpdate = false}) async {
    var response = post(User().UpdateFcm,
        headers: await getHeaders(), body: request.toJson());

    return response;
  }

  @override
  Future<http.Response> getFCMToken(String registrationId) async {
    var response = get(
      User().UpdateFcm(registrationId),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getCategories() async {
    var response = get(Event().Categories, headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> addEvent(NewEventRequest e) async {
    var response =
        post(Event().Add, headers: await getHeaders(), body: e.toJson());
    return response;
  }

  @override
  Future<http.Response> getEvent(String uid) async {
    var response = get(
      Event().Get(uid),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> getEvents({PaginationRequest? request}) async {
    var response = get(
      Event().All + request?.toQueryParams(),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getProviderEvents(String providerUid,
      {PaginationRequest? request}) async {
    var response = get(
      Event().ProviderEvents(providerUid) + (request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> searchEvents(SearchFilter filter) async {
    var response = get(
      Event().Search(toQueryParams(filter.toMap())),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> searchEventsV2(SearchEventParams params) async {
    var response = get(
      Event().Search(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> searchNearbyCommunities(SearchEventParams params) async {
    var response = get(
      Event().SearchNearbyCommunities(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> getPopularEvents(SearchEventParams params) async {
    var response = get(
      Event().GetPopular(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> getNotifications({PaginationRequest? request}) async {
    var response = get(
      User().Notifications(request?.toQueryParams() ?? ""),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> markNotificationAsRead(String uid) async {
    var response = get(
      User().NotificationRead(uid),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> getReviews(
      {String userUid = '', PaginationRequest? request}) async {
    var response = get(
      User().Reviews(
          request?.toQueryParams(additionalData: '&userUid=$userUid') ?? ""),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> getSubscriptions(
      {String userUid = '', PaginationRequest? request}) async {
    var response = get(
      User().Subscriptions(
          request?.toQueryParams(additionalData: '&userUid=$userUid') ?? ''),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> getFeed({PaginationRequest? request}) async {
    var response = get(
      Feed().Fetch + request?.toQueryParams(),
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override
  Future<http.Response> reverseGeoLocation(double lat, double lng) async {
    var response = post(Event().Geocode,
        headers: await getHeaders(),
        body: jsonEncode({'lat': lat, 'lng': lng}));
    return response;
  }

  @override
  Future<http.Response> logout() async {
    var response = get(
      User().Logout,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> followUser(Follower f) async {
    var response = post(User().Follow,
        headers: await getHeaders(), body: f.toApi().toJson());
    return response;
  }

  @override
  Future<http.Response> getFollowers({PaginationRequest? request}) async {
    var response = get(
      User().GetFollowers(request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getFollowing({PaginationRequest? request}) async {
    var response = get(
      User().GetFollowing,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> addEventToFavorates(String eventUid) async {
    var response = get(
      Event().Favorate(eventUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> removeEventFromFavorates(String eventUid) async {
    var response = delete(
      Event().Favorate(eventUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> linkToCommunity(
      String eventUid, Community community) async {
    var response = post(Event().Link,
        headers: await getHeaders(),
        body: jsonEncode({
          "ownerUid": community.ownerUid,
          "communityUid": community.uid,
          "eventUid": eventUid
        }));
    return response;
  }

  @override
  Future<http.Response> getCommunityEvents(String communityUid,
      {PaginationRequest? request}) async {
    var response = get(
      Event().CommunityEvents(communityUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> unlinkFromCommunity(
      String eventUid, Community community) async {
    var response = post(Event().Favorate(eventUid),
        headers: await getHeaders(),
        body: jsonEncode({
          "ownerUid": community.ownerUid,
          "communityUid": community.uid,
          "eventUid": eventUid
        }));
    return response;
  }

  @override
  Future<http.Response> followEvent(String eventUid) async {
    var response = post(User().Follow,
        headers: await getHeaders(),
        body: jsonEncode({"followerUid": eventUid}));
    return response;
  }

  @override
  Future<http.Response> getFavorateEvents() async {
    var response = get(
      Event().AllFavorates,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> deleteEvent(
      String eventUid, EventActionType actionType) async {
    var response = delete(
      Event().Get(eventUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> sendMessage(String userUid, String message) async {
    var response = post(User().Message,
        headers: await getHeaders(),
        body: jsonEncode({'message': message, 'receiverUid': userUid}));
    return response;
  }

  @override
  Future<http.Response> addAppointment(AppointmentApi appointment) async {
    var response = post(AppointmentRoutes().Add,
        headers: await getHeaders(), body: appointment.toJson());
    return response;
  }

  @override
  Future<http.Response> addService(ServiceApi service) async {
    var response = post(Service().Add,
        headers: await getHeaders(), body: service.toJson());
    return response;
  }

  @override
  Future<http.Response> deleteAppointment(String uid) async {
    var response =
        delete(AppointmentRoutes().Delete(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> deleteService(String uid) async {
    var response = delete(Service().Delete(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getAppointment(String uid) async {
    var response =
        get(AppointmentRoutes().Get(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getAppointmentRequest(String uid) async {
    var response =
        get(AppointmentRoutes().GetRequest(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getAppointmentRequests(
      {PaginationRequest? request}) async {
    var response = get(
      AppointmentRoutes().RequestAll + (request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getAppointments({PaginationRequest? request}) async {
    var response = get(
      AppointmentRoutes().All + (request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getProviderServices(String providerUid) async {
    var response = get(
      Service().ProviderServices(providerUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getService(
      String providerUid, String serviceUid) async {
    var response = get(
      Service().Get(providerUid, serviceUid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> setServiceAsActive(String serviceUid,
      {bool isActive = false}) async {
    var response = get(
      Service().SetActive(serviceUid, isActive),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> addAComment(String uid, CommentApi comment) async {
    var response = post(ACommunity().CommentAdd(uid),
        headers: await getHeaders(), body: comment.toJson());
    return response;
  }

  @override
  Future<http.Response> addCommunity(CommunityApi e) async {
    var response =
        post(ACommunity().Add, headers: await getHeaders(), body: e.toJson());
    return response;
  }

  @override
  Future<http.Response> deleteComment(String communityUid, String uid) async {
    var response = get(ACommunity().CommentRemove(communityUid, uid),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> deleteCommunity(String uid) async {
    var response =
        delete(ACommunity().Delete(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getCommunity(String ownerUid, String uid) async {
    var response =
        get(ACommunity().Get(ownerUid, uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getCommunityComments(String uid,
      {PaginationRequest? request}) async {
    var response = get(
      ACommunity().Comments(uid) + (request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getCommunityMembers(String uid,
      {PaginationRequest? request}) async {
    var response = get(
        ACommunity().Members(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getCommunityMemberRequests(String uid,
      {PaginationRequest? request}) async {
    var response = get(
        ACommunity().MemberRequests(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getUserCommunities(String ownerUid,
      {PaginationRequest? request}) async {
    var response = get(
      ACommunity().UsersCommunities(ownerUid) +
          (request?.toQueryParams() ?? ''),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getUserJoinedCommunities() async {
    var response =
        get(ACommunity().CommunitiesJoined, headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> joinCommunity(String uid) async {
    var response = get(ACommunity().Join(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> leaveCommunity(String uid) async {
    var response = get(ACommunity().Leave(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> attendEvent(String eventUid) async {
    return get(Event().Attend(eventUid), headers: await getHeaders());
  }

  @override
  Future<http.Response> unattendEvent(String eventUid) async {
    return delete(Event().UnAttend(eventUid), headers: await getHeaders());
  }

  @override
  Future<http.Response> getEventAttendees(String uid,
      {PaginationRequest? request}) async {
    var response = get(
        Event().Attendees(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> requestToJoin(String uid,
      {required String userUid}) async {
    var response =
        get(ACommunity().RequestToJoin(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> approveRequestToJoinCommunity(
      String uid, Member member) async {
    var response = post(ACommunity().ApproveRequestToJoin(uid),
        headers: await getHeaders(),
        body: jsonEncode({"requesterUid": member.uid}));
    return response;
  }

  @override
  Future<http.Response> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointment) async {
    var response = post(AppointmentRoutes().UpdateStatus,
        headers: await getHeaders(),
        body: jsonEncode({
          "statusUpdate": status.name,
          "userUid": appointment.ownerUid,
          "providerUid": appointment.providerUid,
          "appointmentUid": appointment.uid,
          "cancellationReason": appointment.cancellationReason
        }));
    return response;
  }

  @override
  Future<http.Response> getDashboardMetrics(String date) async {
    var response = get(Admin().Metrics(date), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> attendRecurringEvent(
      String eventUid, String recurrenceUid) async {
    return get(RecurringEvent().Attend(eventUid, recurrenceUid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> deleteRecurringEvent(
      String eventUid, String recurrenceUid, EventActionType actionType) async {
    return delete(
        "${RecurringEvent().Delete(eventUid, recurrenceUid)}?action=${actionType.name}",
        headers: await getHeaders());
  }

  @override
  Future<http.Response> getRecurringEvent(
      String uid, String recurrenceUid) async {
    var response = get(RecurringEvent().Get(uid, recurrenceUid),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getRecurringEventAttendees(
      String uid, String recurrenceUid,
      {PaginationRequest? request}) async {
    var response = get(
        RecurringEvent().Attendees(uid, recurrenceUid) +
            (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getRecurringEvents(String recurrenceUid,
      {PaginationRequest? request}) async {
    var response = get(
        RecurringEvent().All(recurrenceUid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> unattendRecurringEvent(
      String eventUid, String recurrenceUid) async {
    return delete(RecurringEvent().UnAttend(eventUid, recurrenceUid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> updateEvent(
      NewEventRequest e, EventActionType actionType) async {
    var response = put("${Event().Add}?action=${actionType.name}",
        headers: await getHeaders(), body: e.toJson());
    return response;
  }

  @override
  Future<http.Response> updateRecurringEvent(
      NewEventRequest e, EventActionType actionType) async {
    var response = put("${RecurringEvent().Update}?action=${actionType.name}",
        headers: await getHeaders(), body: e.toJson());
    return response;
  }
}

class ImageProperties {
  String? uuid;
  String key;
  XFile file;
  ImageProperties(this.key, this.file, {this.uuid = ''});
}
