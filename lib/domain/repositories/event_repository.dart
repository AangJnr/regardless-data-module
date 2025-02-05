import 'package:multiple_result/multiple_result.dart';

import '../../data/model/new_event_api.dart';
import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../model/category.dart';
import '../model/community/community.dart';
import '../model/community/member.dart';
import '../model/community_and_event.dart';
import '../model/event.dart';
import '../model/feed.dart';
import '../model/pagination.dart';
import '../model/results.dart';
import '../model/venue.dart';

enum EventActionType { one, all }

abstract class EventRepository {
  Future<Result<Pagination<Feed>, Exception>> searchEvent(SearchFilter filter);
  Future<Result<SearchEventResults, Exception>> searchEventsV2(
      SearchEventParams params);
  Future<Result<List<Feed>, Exception>> getPopularEvents(
      SearchEventParams params);
  Future<Result<List<CommunityAndEvent>, Exception>> searchNearByCommunities(
      SearchEventParams params);

//recurring
  Future<Result<Pagination<Feed>, Exception>> getRecurringEvents(String uid,
      {PaginationRequest? request});
  Future<Result<Event, Exception>> getRecurringEvent(
      String uid, String recurrenceUid);
  Future<Result<Event, Exception>> updateRecurringEvent(
      NewEventRequest e, EventActionType actionType);

  Future<Result<bool, Exception>> deleteRecurringEvent(
      String eventUid, String recurrenceUid, EventActionType actionType);
  Future<Result<bool, Exception>> attendRecurring(
      String eventUid, String recurrenceUid);
  Future<Result<bool, Exception>> unAttendRecurring(
      String eventUid, String recurrenceUid);
  Future<Result<Pagination<Member>, Exception>> getRecurringEventAttendees(
      String uid, String recurrenceUid,
      {PaginationRequest? request});
  //
  Future<Result<Event, Exception>> getEvent(String uid);
  Future<Result<Event, Exception>> addEvent(NewEventRequest e);
  Future<Result<Event, Exception>> updateEvent(
      NewEventRequest e, EventActionType actionType);
  Future<Result<Pagination<Event>, Exception>> getEvents(
      {PaginationRequest? request});
  Future<Result<bool, Exception>> deleteEvent(
      String eventUid, EventActionType actionType);
  Future<Result<bool, Exception>> attend(String eventUid);
  Future<Result<bool, Exception>> unAttend(String eventUid);
  Future<Result<Pagination<Member>, Exception>> getEventAttendees(String uid,
      {PaginationRequest? request});

  Future<Result<Pagination<Feed>, Exception>> getFeedData(
      {PaginationRequest? request});
  Future<Result<Pagination<Category>, Exception>> getCategories();

  Future<Venue> geocode(double lat, double lng);
  Future<Result<Pagination<Feed>, Exception>> getFavorateEvents(
      {PaginationRequest? request});
  Future<Result<bool, Exception>> favorateEvent(String eventUid);
  Future<Result<bool, Exception>> removeFromFavorates(String eventUid);

  Future<Result<Pagination<Feed>, Exception>> getProviderEvents(
      String providerUid,
      {PaginationRequest? request});
  Future<Result<Pagination<Feed>, Exception>> getCommunityEvents(
      String communityUid,
      {PaginationRequest? request});
  Future<Result<bool, Exception>> linkToCommunity(
      String eventUid, Community community);
  Future<Result<bool, Exception>> unlinkFromCommunity(
      String eventUid, Community community);
  Future<Result<bool, Exception>> joinCommunitites(
      {List<String> private, List<String> public});
}
