// ignore_for_file: non_constant_identifier_names

import '../../app/utils/url.dart';

abstract class ApiRoutes {
  final url = Url.shared.base;
}

class Auth extends ApiRoutes {
  get LogoutPath => "$url/auth/logout/";
  get NameCheck => "$url/user/check-username/";
  get DeleteAccount => "$url/user/delete";
}

class User extends ApiRoutes {
  get ImageUpload => "$url/user/profile/photo-upload/";
  get Profile => "$url/user/me/";
  String PublicProfile(String uid) => "$url/user/public-profile/$uid";
  get ProfileUpdate => "$url/user/me/";
  String get Preference => '$url/user-preference/';
  String UpdatePreference(String uid) => '$url/user-preference/$uid/';
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
  String Delete(String id) => '$url/user/$id/';
  get Fcm => "$url/fcm/";
  get UpdateFcm => "$url/fcm/";
}

class ProductUrl extends ApiRoutes {
  String get Lookup => '$url/product/barcode-lookup/';
  String get ScanIn => '$url/product/scan-in/';
  String Recycle(String id) => '$url/product/$id/recycle/';
}

class Feed extends ApiRoutes {
  get Fetch => '$url/event/feed/';
}

class Admin extends ApiRoutes {
  String Metrics(String date) => '$url/provider/dashboard/?date=$date';
}

class Event extends ApiRoutes {
  String get Discovery => '$url/event/discovery/';
  String Search(String params) => '$url/search$params';
  String SearchNearbyCommunities(String params) => '$url/nearby-community$params';
  String GetPopular(String params) => '$url/event/popular$params';
  String Get(String uid) => '$url/event/$uid';
  get All => '$url/event';
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
  String CommunityEvents(String uid) => '$url/event/community-events/$uid/';
  String Attend(String eventUid) => '$url/event/attendance/add/$eventUid';
  String UnAttend(String eventUid) => '$url/event/attendance/remove/$eventUid';
  String Attendees(String eventUid) => '$url/event/attendance/$eventUid';
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
  String Join(String uid) => '$url/community/$uid/join';
  String RequestToJoin(String uid) => '$url/community/request-to-join/$uid';
  String ApproveRequestToJoin(String uid) =>
      '$url/community/request-to-join/$uid/approve';
  String get CommunitiesJoined => '$url/community/joined/all';
  String UsersCommunities(String ownerUid) => '$url/community/all/$ownerUid';
  String Members(String uid) => '$url/community/members/$uid';
  String MemberRequests(String uid) => '$url/community/$uid/join/requests/all';
  String Comments(String uid) => '$url/community/comments/$uid';
  String CommentAdd(String uid) => '$url/community/$uid/comment/add';
  String CommentRemove(String communityUid, String uid) =>
      '$url/community/$communityUid/comment/$uid';
}
