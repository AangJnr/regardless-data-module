import 'package:cross_file/cross_file.dart';
import 'package:http/http.dart' show Response, StreamedResponse;
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/user.dart';

import '../../data/model/appointment_api/appointment_api.dart';
import '../../data/model/new_event_api.dart';
import '../../data/model/notification_request.dart';
import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../../data/model/service_api/service_api.dart';
import '../model/appointment/appointment.dart';
import '../model/community/comment.dart';
import '../model/community/community.dart';
import '../model/community/member.dart';
import '../model/follower.dart';
import '../model/new_user.dart';
import '../model/preference.dart';
import '../model/review/review.dart';
import '../model/update_user.dart';
import '../repositories/event_repository.dart';

abstract class ApiService {
  Future<Response> attemptLogout();
  Future<Response> checkUserName(String name);
  Future<Response> createUserAccount(NewUser user);
  Future<Response> updateUserProfile(UpdateUser user);
  Future<Response> getUser();
  Future<Response> getUserAccounts();
  Future<Response> setDefaultUserAccount(String profileUid);
  Future<Response> getPublicUser(String uid);
  Future<Response> deleteUser(String id);
  Future<dynamic> uploadPhoto(String profileUid, XFile file);
  Future<Response> deleteAccount(String uid,
      {String title = 'None', String reason = 'Not provided'});
  Future<Response> updateFCMTokekn(NotificationRequest request,
      {bool isUpdate = false});
  Future<Response> getFCMToken(String registrationId);
  Future<Response> updateUserName(
      {required String profileUid, required String userName});
  Future<Response> getUserPreferences();
  Future<Response> updatePreferences(Preference prefs);

  Future<Response> getCategories();
  Future<Response> getFeed({PaginationRequest? request});
  @Deprecated('Use searchEventsV2 instead')
  Future<Response> searchEvents(SearchFilter filter);
  Future<Response> searchEventsV2(SearchEventParams params);
  Future<Response> getPopularEvents(SearchEventParams params);
  Future<Response> searchNearbyCommunitiesAndEvents(SearchEventParams params);
  Future<Response> searchNearbyCommunities(SearchEventParams params);
  Future<Response> searchCommunitiesViaQuery(SearchEventParams params);
  Future<Response> searchUsers(SearchEventParams params);
  Future<Response> getProviderEvents(String providerUid,
      {PaginationRequest? request});
  Future<Response> linkToCommunity(String eventUid, Community community);
  Future<Response> unlinkFromCommunity(String eventUid, Community community);

  Future<Response> getEvent(String uid);
  Future<Response> getEvents({PaginationRequest? request});
  Future<Response> addEvent(NewEventRequest e);
  Future<Response> attendEvent({
    required String eventUid,
    required String recurrenceUid,
  });
  Future<Response> unattendEvent(
      {required String eventUid, required String recurrenceUid});
  Future<Response> getEventAttendees(
      {required String eventUid,
      required String recurrenceUid,
      PaginationRequest? request});
  Future<Response> deleteEvent(String eventUid, EventActionType actionType);
  Future<Response> updateEvent(NewEventRequest e, EventActionType actionType);

  Future<Response> getRecurringEvent(String uid, String recurrenceUid);
  Future<Response> getRecurringEvents(String recurrenceUid,
      {PaginationRequest? request});
  Future<Response> updateRecurringEvent(
      NewEventRequest e, EventActionType actionType);
  Future<Response> attendRecurringEvent(String eventUid, String recurrenceUid);
  Future<Response> unattendRecurringEvent(
      String eventUid, String recurrenceUid);
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
  Future<Response> getCommunityEvents({
    PaginationRequest? request,
    required String uid,
    required String ownerUid,
  });
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

  Future<Response> addCommunity(Community e);
  Future<Response> getCommunity(String ownerUid, String uid);
  Future<Response> deleteCommunity({required String uid});
  Future<Response> addAComment(String uid, Comment comment);
  Future<Response> deleteComment(String communityUid, String uid);
  Future<Response> joinCommunity(
      {required String uid, required String ownerUid});
  Future<Response> requestToJoin(
      {required String uid, required String ownerUid, required String userUid});
  Future<Response> approveRequestToJoinCommunity(
      {required String uid, required String ownerUid, required Member member});
  Future<Response> leaveCommunity(String uid);
  Future<Response> removeCommunityMember(
      {required String uid, required String memberUid});
  Future<Response> getUserJoinedCommunities(
      {required String userUid, PaginationRequest? request});
  Future<Response> joinCommunities(List<String> private, List<String> public);

  Future<Response> searchTrainersViaQuery(SearchEventParams params);

  Future<Response> getUserCommunities(String ownerUid,
      {PaginationRequest? request});
  Future<Response> getCommunityComments(String uid,
      {PaginationRequest? request});
  Future<Response> getCommunityMembers(String uid,
      {PaginationRequest? request});
  Future<Response> getCommunityMemberRequests(String uid,
      {PaginationRequest? request});
  Future<Response> getCommunityReviews(
      {String uid = '', PaginationRequest? request});
  Future<Response> addCommunityReview(
      {String uid = '', required Review review});
  Future<Response> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointment);
  Future<Response> getDashboardMetrics(String date);

  Future<Response> getPosts({PaginationRequest? request});
  Future<Response> likePost(String uid);
  Future<Response> unlikePost(String uid);
  Future<dynamic> uploadImages(List<XFile> images);

  Future<Response> getProviderReviews(
      {String uid = '', PaginationRequest? request});
  Future<Response> addProviderReview({String uid = '', required Review review});
  Future<Response> generateDescriptionSuggestions(String text);

  // Teams
  Future<dynamic> addTeam(Team team, {XFile? logo, XFile? headerImage});
  Future<Response> getUsersTeams(String ownerUid, {PaginationRequest? request});
  Future<Response> getTeam(String ownerUid, String uid);
  Future<Response> deleteTeam(String uid);
  Future<Response> getTeamMembers(String uid, {PaginationRequest? request});
  Future<Response> removeTeamMember(String uid, String memberUid);
  Future<Response> requestToJoinTeam(String ownerUid, String uid);
  Future<Response> inviteUserToTeam(List<AUser> users, String uid);

  Future<Response> approveRequestToJoinTeam(
      {required String ownerUid,
      required String uid,
      required String requesterUid,
      String? role});
  Future<Response> getTeamJoinRequests(String uid,
      {PaginationRequest? request});
  Future<Response> inviteMemberByEmail(String uid,
      {required String email, String? name, String? role});
  Future<Response> invitePlayersByEmail(String teamUid,
      {required List<String> emails});
  Future<Response> acceptTeamInvite(String token, String teamUid);
  Future<Response> finalizeTeamInvite(String token, String teamUid);
  Future<Response> linkTeamWithEvent(
      String ownerUid, String teamUid, String eventUid);
  Future<Response> unlinkTeamWithEvent(
      String ownerUid, String teamUid, String eventUid);
  Future<Response> addTeamManager(String teamUid, String managerUid);
  Future<Response> removeTeamManager(String teamUid, String managerUid);
  Future<Response> getTeamInvitees(String uid, {PaginationRequest? request});
  Future<Response> deleteTeamInvite(String teamUid, String inviteeUid);
  Future<Response> declineTeamJoinRequest(String requesterUid, String teamUid);
  Future<dynamic> uploadTeamMedia(String teamUid, List<XFile> files);
  Future<Response> getTeamMedia(String teamUid, {PaginationRequest? request});
  Future<Response> searchTeams(String teamUid, {PaginationRequest? request});
  Future<Response> deleteTeamMedia(String teamUid, List<String>  uids);

  // Sports Categories
  Future<Response> getSportsCategories();
}
