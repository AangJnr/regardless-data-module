// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:cross_file/cross_file.dart';
import 'package:http/http.dart' as http;
import 'package:regardless_data_module/domain/model/community/community.dart';
import 'package:regardless_data_module/domain/model/community/member.dart';
import 'package:regardless_data_module/domain/model/review/review.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import '../../domain/api/api_service.dart';
import '../../domain/model/appointment/appointment.dart';
import '../../domain/model/community/comment.dart';
import '../../domain/model/follower.dart';
import '../../domain/model/new_user.dart';
import '../../domain/model/preference.dart';
import '../../domain/model/update_user.dart';
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
  Future<http.Response> updateUserProfile(UpdateUser user) async {
    var response = patch(User().MeUpdate(user.uid),
        headers: await getHeaders(), body: user.toJson());
    return response;
  }

  @override
  Future<http.Response> createUserAccount(NewUser user) async {
    var response =
        post(User().Create, headers: await getHeaders(), body: user.toJson());
    return response;
  }

  @override
  Future<http.Response> updateUserName(
      {required String profileUid, required String userName}) async {
    var response = patch(User().MeUpdate(profileUid),
        headers: await getHeaders(), body: json.encode({"userName": userName}));
    return response;
  }

  @override
  Future<http.Response> setDefaultUserAccount(String profileUid) async {
    var response =
        get(User().DefaultAccount(profileUid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> getUser() async {
    var response = get(
      User().Me,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> getUserAccounts() async {
    var response = get(
      User().MeAccounts,
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
      Auth().DeleteAccount,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<dynamic> uploadPhoto(String profileUid, XFile file) async {
    var response = postMultipart(User().ImageUpload(profileUid),
        headers: await getHeaders(),
        dataList: [ImageProperties("images", file)]);

    return response;
  }

  @override
  Future<http.Response> deleteAccount(String uid,
      {String title = 'None', String reason = 'Not provided'}) async {
    return delete(User().Delete(uid), headers: await getHeaders());
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
      User().Fcm(registrationId),
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
      '${Event().All}${request?.toQueryParams()}',
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
      ASearch().Search(toQueryParams(filter.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchEventsV2(SearchEventParams params) async {
    var response = get(
      ASearch().Search(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchNearbyCommunitiesAndEvents(
      SearchEventParams params) async {
    var response = get(
      ASearch().SearchNearbyCommunityEvents(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchNearbyCommunities(
      SearchEventParams params) async {
    var response = get(
      ASearch().SearchNearbyCommunity(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchCommunitiesViaQuery(
      SearchEventParams params) async {
    var response = get(
      ASearch().SearchCommunities(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchTrainersViaQuery(SearchEventParams params) async {
    var response = get(
      ASearch().SearchTrainers(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
    );
    return response;
  }

  @override
  Future<http.Response> searchUsers(SearchEventParams params) async {
    var response = get(
      ASearch().SearchUsers(toQueryParams(params.toMap())),
      headers: await getHeaders(isSecure: true),
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
      '${Feed().Fetch}${request?.toQueryParams()}',
      headers: await getHeaders(isSecure: false),
    );
    return response;
  }

  @override

  /// Reverse geocoding endpoint.
  ///
  /// Takes latitude and longitude and returns a place name.
  ///
  /// Used for getting the user's location.
  ///
  /// Example:
  ///
  ///
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
  Future<http.Response> getCommunityEvents(
      {PaginationRequest? request,
      required String uid,
      required String ownerUid}) async {
    var response = get(
      Event().CommunityEvents(ownerUid, uid) + (request?.toQueryParams() ?? ''),
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
  Future<http.Response> addAComment(String uid, Comment comment) async {
    var response = post(ACommunity().CommentAdd(uid),
        headers: await getHeaders(), body: comment.toJson());
    return response;
  }

  @override
  Future<http.Response> addCommunity(Community e) async {
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
  Future<http.Response> deleteCommunity({required String uid}) async {
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
  Future<http.Response> getUserJoinedCommunities(
      {required String userUid, PaginationRequest? request}) async {
    var response = get(
        ACommunity().CommunitiesJoined(userUid) +
            (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> joinCommunity(
      {required String uid, required String ownerUid}) async {
    var response = get(ACommunity().Join(uid: uid, ownerUid: ownerUid),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> joinCommunities(
      List<String> private, List<String> public) async {
    return post(ACommunity().JoinCommunities,
        headers: await getHeaders(),
        body: jsonEncode({'private': private, 'public': public}));
  }

  @override
  Future<http.Response> leaveCommunity(String uid) async {
    var response = get(ACommunity().Leave(uid), headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> attendEvent(
      {required String eventUid, required String recurrenceUid}) async {
    return get(Event().Attend(eventUid, recurrenceUid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> unattendEvent(
      {required String eventUid, required String recurrenceUid}) async {
    return delete(Event().UnAttend(eventUid, recurrenceUid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> getEventAttendees(
      {required String eventUid,
      required String recurrenceUid,
      PaginationRequest? request}) async {
    var response = get(
        Event().Attendees(eventUid, recurrenceUid) +
            (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> requestToJoin(
      {required String uid,
      required String ownerUid,
      required String userUid}) async {
    var response = get(ACommunity().RequestToJoin(uid: uid, ownerUid: ownerUid),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> approveRequestToJoinCommunity(
      {required String uid,
      required String ownerUid,
      required Member member}) async {
    var response = post(
        ACommunity().ApproveRequestToJoin(uid: uid, ownerUid: ownerUid),
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

  @override
  Future<http.Response> getPosts({PaginationRequest? request}) async {
    var response = get(Post().GetPosts + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> likePost(String uid) async {
    var response = get(
      Post().Like(uid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> unlikePost(String uid) async {
    var response = delete(
      Post().Like(uid),
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<dynamic> uploadImages(List<XFile> images) async {
    var response = postMultipart(Media().UploadImages,
        headers: await getHeaders(),
        dataList:
            images.map((file) => ImageProperties("images", file)).toList());
    return response;
  }

  @override
  Future<http.Response> getUserPreferences() async {
    var response = get(
      User().Preference,
      headers: await getHeaders(),
    );
    return response;
  }

  @override
  Future<http.Response> updatePreferences(Preference prefs) async {
    var response = patch(User().UpdatePreference,
        headers: await getHeaders(), body: prefs.toJson());
    return response;
  }

  @override
  Future<http.Response> addCommunityReview(
      {String uid = '', required Review review}) async {
    var response = post(ACommunity().Review(uid),
        headers: await getHeaders(), body: review.toJson());
    return response;
  }

  @override
  Future<http.Response> getCommunityReviews(
      {String uid = '', PaginationRequest? request}) async {
    var response = get(
        ACommunity().Review(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> addProviderReview(
      {String uid = '', required Review review}) async {
    var response = post(User().Review(uid),
        headers: await getHeaders(), body: review.toJson());
    return response;
  }

  @override
  Future<http.Response> getProviderReviews(
      {String uid = '', PaginationRequest? request}) async {
    var response = get(User().Review(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> generateDescriptionSuggestions(String text) async {
    var response = get(Admin().GetDescriptionSuggessions(text),
        headers: await getHeaders());
    return response;
  }

  @override
  Future<http.Response> removeCommunityMember(
      {required String uid, required String memberUid}) async {
    var response = delete(ACommunity().RemoveMember(uid, memberUid),
        headers: await getHeaders());
    return response;
  }

  // Teams
  @override
  Future<dynamic> addTeam(Team team, {XFile? logo, XFile? headerImage}) async {
    return postWithFiles(ATeam().Add,
        headers: await getHeaders(),
        body: team.toJson(),
        dataList: [
          if (logo != null) ImageProperties("logo", logo),
          if (headerImage != null) ImageProperties("headerImage", headerImage),
        ]);
  }

  @override
  Future<http.Response> getUsersTeams(String ownerUid,
      {PaginationRequest? request}) async {
    return get(ATeam().UsersTeams(ownerUid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> getTeam(String ownerUid, String uid) async {
    return get(ATeam().Get(ownerUid, uid), headers: await getHeaders());
  }

  @override
  Future<http.Response> deleteTeam(String uid) async {
    return delete(ATeam().Delete(uid), headers: await getHeaders());
  }

  @override
  Future<http.Response> getTeamMembers(String uid,
      {PaginationRequest? request}) async {
    return get(ATeam().Members(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> removeTeamMember(String uid, String memberUid) async {
    return delete(ATeam().RemoveMember(uid, memberUid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> requestToJoinTeam(String ownerUid, String uid) async {
    return post(ATeam().RequestToJoin(ownerUid, uid),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> inviteUserToTeam(List<AUser> users, String uid) async {
    return post(ATeam().InviteUserToTeam(uid),
        headers: await getHeaders(),
        body: jsonEncode(users
            .map(
              (e) => {
                "uid": e.uid,
                "userName": e.userName,
                "email": e.email,
              },
            )
            .toList()));
  }

  @override
  Future<http.Response> approveRequestToJoinTeam(
      {required String ownerUid,
      required String uid,
      required String requesterUid,
      String? role}) async {
    return post(ATeam().ApproveRequestToJoin(ownerUid, uid),
        headers: await getHeaders(),
        body: jsonEncode(
            {"requesterUid": requesterUid, if (role != null) "role": role}));
  }

  @override
  Future<http.Response> getTeamJoinRequests(String uid,
      {PaginationRequest? request}) async {
    return get(ATeam().MemberRequests(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> inviteMemberByEmail(String uid,
      {required String email, String? name, String? role}) async {
    return post(ATeam().Invite(uid),
        headers: await getHeaders(),
        body: jsonEncode({
          "email": email,
          if (name != null) "name": name,
          if (role != null) "role": role
        }));
  }

  @override
  Future<http.Response> invitePlayersByEmail(String teamUid,
      {required List<String> emails}) async {
    return post(ATeam().InvitePlayers(teamUid),
        headers: await getHeaders(),
        body: jsonEncode({
          "emails": emails,
        }));
  }

  @override
  Future<http.Response> acceptTeamInvite(String token, String teamUid) async {
    return post(ATeam().InviteAccept(),
        headers: await getHeaders(isSecure: false),
        body: jsonEncode({"token": token, "teamUid": teamUid}));
  }

  @override
  Future<http.Response> finalizeTeamInvite(String token, String teamUid) async {
    return post(ATeam().InviteFinalize(),
        headers: await getHeaders(),
        body: jsonEncode({"token": token, "teamUid": teamUid}));
  }

  @override
  Future<http.Response> linkTeamWithEvent(
      String ownerUid, String teamUid, String eventUid) async {
    return post(ATeam().LinkEvent(),
        headers: await getHeaders(),
        body: jsonEncode(
            {"ownerUid": ownerUid, "teamUid": teamUid, "eventUid": eventUid}));
  }

  @override
  Future<http.Response> unlinkTeamWithEvent(
      String ownerUid, String teamUid, String eventUid) async {
    return post(ATeam().UnlinkEvent(),
        headers: await getHeaders(),
        body: jsonEncode(
            {"ownerUid": ownerUid, "teamUid": teamUid, "eventUid": eventUid}));
  }

  @override
  Future<http.Response> addTeamManager(
      String teamUid, String managerUid) async {
    return post(ATeam().AddManager(teamUid),
        headers: await getHeaders(),
        body: jsonEncode({"managerUid": managerUid}));
  }

  @override
  Future<http.Response> removeTeamManager(
      String teamUid, String managerUid) async {
    return post(ATeam().RemoveManager(teamUid),
        headers: await getHeaders(),
        body: jsonEncode({"managerUid": managerUid}));
  }

  @override
  Future<http.Response> getSportsCategories() async {
    return get(Admin().SportsCategories,
        headers: await getHeaders(isSecure: false));
  }

  @override
  Future<http.Response> getTeamInvitees(String uid,
      {PaginationRequest? request}) async {
    return get(ATeam().Invitees(uid) + (request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> deleteTeamInvite(
      String teamUid, String inviteeUid) async {
    return delete(
      ATeam().DeleteInvite(teamUid, inviteeUid),
      headers: await getHeaders(),
    );
  }

  @override
  Future<http.Response> declineTeamJoinRequest(
      String requesterUid, String teamUid) async {
    return delete(
      ATeam().DeclineRequestToJoin(requesterUid, teamUid),
      headers: await getHeaders(),
    );
  }

  @override
  Future<http.Response> deleteTeamMedia(
      String teamUid, List<String> uids) async {
    return delete(
      ATeam().DeleteMedia(teamUid),
      headers: await getHeaders(),
      body: jsonEncode({"uids": uids}),
    );
  }

  @override
  Future<http.Response> getTeamMedia(String teamUid,
      {PaginationRequest? request}) async {
    return get(
        ATeam().GetTeamMedia(teamUid, params: request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future<http.Response> searchTeams(String teamUid,
      {PaginationRequest? request}) async {
    return get(ATeam().SearchTeams(request?.toQueryParams() ?? ''),
        headers: await getHeaders());
  }

  @override
  Future uploadTeamMedia(String teamUid, List<XFile> files) async {
    var response = postMultipart(ATeam().UploadMedia(teamUid),
        headers: await getHeaders(),
        dataList:
            files.map((file) => ImageProperties("images", file)).toList());
    return response;
  }
}
