// ignore_for_file: non_constant_identifier_names

import '../../app/utils/url.dart';

abstract class ApiRoutes {
  final url = Url.shared.base;
}

class Media extends ApiRoutes {
  String get UploadImages => "$url/upload-images";
}

class Auth extends ApiRoutes {
  String get LogoutPath => "$url/auth/logout/";
  String get NameCheck => "$url/user/check-username/";
  String get DeleteAccount => "$url/user/delete";
}

class User extends ApiRoutes {
  String ImageUpload(String profileUid) =>
      "$url/user/profile/photo-upload/$profileUid";
  String PublicProfile(String uid) => "$url/user/public-profile/$uid";
  String get Create => "$url/user/create-account/";
  String MeUpdate(String uid) => "$url/user/$uid";
  String get Me => "$url/user/me";

  String get MeAccounts => "$url/user/me/accounts";
  String DefaultAccount(String profileUid) =>
      "$url/user/me/account/set-default/$profileUid";

  String get Preference => '$url/user-preference/';
  String get UpdatePreference => '$url/user/preference/';
  String get Logout => "$url/user/logout/";
  String get Follow => "$url/user/follow/";
  String GetFollowers(String params) => '$Follow$params';
  String get GetFollowing => '$url/user/following/';
  String get Message => '$url/user/send-notification';
  String NotificationRead(String uid) =>
      '$url/user/notification/mark-as-read/$uid';
  String Notifications(String params) => '$url/user/notification$params';
  String Reviews(String params) => '$url/user/review$params';
  String Subscriptions(String params) => '$url/user/subscription$params';

  String Services(String params) => '$url/user/service$params';

  String get Support => '$url/support-ticket/';
  String Delete(String uid) => '$url/user/me/accounts/delete/$uid';
  String Fcm(String registrationId) => "$url/fcm/$registrationId";
  String get UpdateFcm => "$url/fcm";
  String Review(String uid) => '$url/user/$uid/review';
}

class ProductUrl extends ApiRoutes {
  String get Lookup => '$url/product/barcode-lookup/';
  String get ScanIn => '$url/product/scan-in/';
  String Recycle(String id) => '$url/product/$id/recycle/';
}

class Feed extends ApiRoutes {
  String get Fetch => '$url/event/feed/';
}

class Admin extends ApiRoutes {
  String Metrics(String date) => '$url/provider/dashboard/?date=$date';
  String GetDescriptionSuggessions(String query) =>
      '$url/generate-description?query=$query';
  String get SportsCategories => '$url/admin/sports-category';
}

class Event extends ApiRoutes {
  String get Discovery => '$url/event/discovery/';
  String GetPopular(String params) => '$url/event/popular$params';
  String Get(String uid) => '$url/event/$uid';
  String get All => '$url/event';
  String get Add => '$url/event/';
  String get Purchase => '$url/event/ticket/purchase';
  String get Validate => '$url/event/ticket/validate';
  String get Categories => '$url/admin/category';
  String get Geocode => '$url/admin/geocode';
  String Favorate(String uid) => '$url/event/favorate/$uid';
  String get AllFavorates => '$url/event/favorates/';
  String ProviderEvents(String uid) => '$url/event/provider/$uid';
  String get Link => '$url/event/link-with-community';
  String get UnLink => '$url/event/unlink-with-community';
  String CommunityEvents(String ownerUid, String uid) =>
      '$url/event/community-events/$ownerUid/$uid/';
  String Attend(String eventUid, String recurrenceUid) =>
      '$url/event/attendance/add/$eventUid/$recurrenceUid';
  String UnAttend(String eventUid, String recurrenceUid) =>
      '$url/event/attendance/remove/$eventUid/$recurrenceUid';
  String Attendees(String eventUid, String recurrenceUid) =>
      '$url/event/attendance/$eventUid/$recurrenceUid';
}

class RecurringEvent extends ApiRoutes {
  String Delete(String uid, String recurrenceUid) =>
      '$url/recurring-event/$uid/$recurrenceUid';
  String Get(String uid, String recurrenceUid) =>
      '$url/recurring-event/$uid/$recurrenceUid';
  String All(String recurrenceUid) => '$url/recurring-event/all/$recurrenceUid';
  String get Update => '$url/recurring-event/';
  String Attend(String eventUid, String recurrenceUid) =>
      '$url/recurring-event/attendance/add/$eventUid/$recurrenceUid';
  String UnAttend(String eventUid, String recurrenceUid) =>
      '$url/recurring-event/attendance/remove/$eventUid/$recurrenceUid';
  String Attendees(String eventUid, String recurrenceUid) =>
      '$url/recurring-event/attendance/$eventUid/$recurrenceUid';
}

class AppointmentRoutes extends ApiRoutes {
  String get Add => '$url/appointment';
  String Get(String uid) => '$url/appointment/$uid';
  String Delete(String uid) => '$url/appointment/$uid';
  String get All => '$url/appointment/all';
  String get RequestAll => '$url/appointment/request/all';
  String GetRequest(String uid) => '$url/appointment/request/$uid';
  String get UpdateStatus => '$url/appointment/status/update/';
}

class Service extends ApiRoutes {
  String get Add => '$url/service';
  String Get(String providerUid, String serviceUid) =>
      '$url/service?providerUid=$providerUid&uid=$serviceUid';
  String SetActive(String uid, bool isActive) =>
      '$url/service/active/$uid?isActive=$isActive';
  String Delete(String uid) => '$url/service/$uid';
  String ProviderServices(String providerUid) =>
      '$url/service/provider/$providerUid';
}

class ACommunity extends ApiRoutes {
  String get Add => '$url/community';
  String Delete(String uid) => '$url/community/$uid';
  String Get(String ownerUid, String uid) => '$url/community/$ownerUid/$uid';
  String Leave(String uid) => '$url/community/$uid/leave';
  String RemoveMember(String uid, String memberUid) =>
      '$url/community/$uid/remove-member/$memberUid';

  String Join({required String uid, required String ownerUid}) =>
      '$url/community/$ownerUid/$uid/join';
  String RequestToJoin({required String uid, required String ownerUid}) =>
      '$url/community/request-to-join/$ownerUid/$uid';
  String ApproveRequestToJoin(
          {required String uid, required String ownerUid}) =>
      '$url/community/request-to-join/$ownerUid/$uid/approve';
  String get JoinCommunities => '$url/community/join-communities';
  String CommunitiesJoined(String userUid) =>
      '$url/community/joined/all/$userUid';
  String UsersCommunities(String ownerUid) => '$url/community/all/$ownerUid';
  String Members(String uid) => '$url/community/members/$uid';
  String MemberRequests(String uid) => '$url/community/$uid/join/requests/all';
  String Comments(String uid) => '$url/community/comments/$uid';
  String CommentAdd(String uid) => '$url/community/$uid/comment/add';
  String CommentRemove(String communityUid, String uid) =>
      '$url/community/$communityUid/comment/$uid';
  String Review(String uid) => '$url/community/$uid/review';
}

class Post extends ApiRoutes {
  String get GetPosts => '$url/post';
  String Like(String uid) => '$url/post/like/$uid';
}

class ASearch extends ApiRoutes {
  String SearchCommunities(String params) => '$url/search/community$params';
  String Search(String params) => '$url/search$params';
  String SearchNearbyCommunityEvents(String params) =>
      '$url/search/nearby-community-event$params';
  String SearchNearbyCommunity(String params) =>
      '$url/search/nearby-community$params';
  String SearchTrainers(String params) => '$url/search/personal-trainer$params';
  String SearchUsers(String params) => '$url/search-users$params';
}

class ATeam extends ApiRoutes {
  String get Add => '$url/team';
  String UsersTeams(String ownerUid) => '$url/team/all/$ownerUid';
  String Get(String ownerUid, String uid) => '$url/team/$ownerUid/$uid';
  String Delete(String uid) => '$url/team/$uid';
  String Members(String uid) => '$url/team/$uid/members';
  String RemoveMember(String uid, String memberUid) =>
      '$url/team/$uid/remove-member/$memberUid';
  String Join(String ownerUid, String uid) => '$url/team/$ownerUid/$uid/join';
  String RequestToJoin(String ownerUid, String uid) =>
      '$url/team/request-to-join/$ownerUid/$uid';
  String DeclineRequestToJoin(String requesterUid, String uid) =>
      '$url/team/request-to-join/$uid/$requesterUid/decline';
  String InviteUserToTeam(String uid) => '$url/team/invite/$uid';
  String ApproveRequestToJoin(String ownerUid, String uid) =>
      '$url/team/request-to-join/$ownerUid/$uid/approve';
  String MemberRequests(String uid) => '$url/team/$uid/join/requests/all';
  String InvitePlayers(String uid) => '$url/team/$uid/invite-players-email';
  String Invite(String uid) => '$url/team/$uid/invite'; //:uid/invites/:inviteId
  String Invitees(String uid) => '$url/team/$uid/invited-users';
  String DeleteInvite(String uid, String inviteUid) =>
      '$url/team/$uid/invites/$inviteUid';

  String InviteAccept() => '$url/team/invite/accept';
  String InviteFinalize() => '$url/team/invite/finalize';
  String LinkEvent() => '$url/team/link-with-event';
  String UnlinkEvent() => '$url/team/unlink-with-event';
  String AddManager(String uid) => '$url/team/$uid/manager/add';
  String RemoveManager(String uid) => '$url/team/$uid/manager/remove';
  String UploadMedia(String teamUid) => '$url/team/$teamUid/uploads';
  String GetTeamMedia(String teamUid, {String params = ''}) =>
      '$url/team/$teamUid/media$params';
  String SearchTeams(String params) => '$url/team/search$params';
  String DeleteMedia(String teamUid) => '$url/team/$teamUid/media';
}
