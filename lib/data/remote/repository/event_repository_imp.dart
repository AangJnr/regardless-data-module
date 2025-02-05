import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/attendee_api.dart';
import 'package:regardless_data_module/domain/model/community/community.dart';
import 'package:regardless_data_module/domain/model/community/member.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/services/cache_service.dart';
import '../../../domain/model/category.dart';
import '../../../domain/model/community_and_event.dart';
import '../../../domain/model/event.dart';
import '../../../domain/model/feed.dart';
import '../../../domain/model/pagination.dart';
import '../../../domain/model/results.dart';
import '../../../domain/model/venue.dart';
import '../../../domain/repositories/event_repository.dart';
import '../../model/category_api.dart';
import '../../model/community_and_event.dart/community_and_event.dart';
import '../../model/event_api.dart';
import '../../model/feed_api.dart';
import '../../model/new_event_api.dart';
import '../../model/paginated_response.dart';
import '../../model/search_events_results/search_events_results.dart';
import '../../model/search_filter.dart';
import '../../model/venue_api.dart';
import 'base_repository.dart';

class EventRepositoryImpl with BaseRepository implements EventRepository {
  @override
  Future<Result<SearchEventResults, Exception>> searchEventsV2(
      SearchEventParams params) async {
    var data = await processRequest(() => apiService.searchEventsV2(params));
    if (data.isSuccess()) {
      final results = SearchEventResultsApi.fromMap(data.tryGetSuccess()!);
      return Success(results.mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<List<CommunityAndEvent>, Exception>> searchNearByCommunities(
      SearchEventParams params) async {
    var data =
        await processRequest(() => apiService.searchNearbyCommunities(params));
    if (data.isSuccess()) {
      final results = (data.tryGetSuccess()! as List<dynamic>)
          .map((data) => CommunityAndEventApi.fromMap(data).mapToDomain())
          .toList();
      return Success(results);
    }
    return Success([]);
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> searchEvent(
      SearchFilter filter) async {
    // ignore: deprecated_member_use_from_same_package
    var data = await processRequest(() => apiService.searchEvents(filter));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);
      try {
        final feeds = paginationResponse.data
            ?.map((e) => FeedApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Feed>(
            data: feeds ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> getFeedData(
      {PaginationRequest? request}) async {
    var data = await processRequest(() => apiService.getFeed(request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);

      try {
        final feeds = paginationResponse.data
                ?.map((e) => FeedApi.fromMap(e).mapToDomain())
                .toList() ??
            [];
        return Success(Pagination<Feed>(
            data: feeds,
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<Pagination<Category>, Exception>> getCategories() async {
    final cache = module<CacheService>();

    final categories =
        await cache.execute(fetchAndCacheCategories, "categories");
    if (categories.isEmpty) {
      cache.clear('categories');
    }

    return Success(Pagination<Category>(data: categories));
  }

  Future<List<Category>> fetchAndCacheCategories() async {
    var results = await processRequest(() => apiService.getCategories());
    List<Category> list = [];
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) =>
              CategoryApi.fromMap(e as Map<String, dynamic>).mapToDomain())
          .toList();
      list = data;
    } else {
      getLogger('EventRepositoryImpl').e("fetchCategoriesWasNotSuccessfull!");
    }
    return list;
  }

  @override
  Future<Venue> geocode(double lat, double lng) async {
    var data =
        await processRequest(() => apiService.reverseGeoLocation(lat, lng));
    if (data.isSuccess()) {
      return VenueApi.fromMap(data.tryGetSuccess()!).mapToDomain();
    }
    return Venue(address: "N/a", lat: lat, lng: lng);
  }

  @override
  Future<Result<bool, Exception>> favorateEvent(String eventUid) async {
    var res =
        await processRequest(() => apiService.addEventToFavorates(eventUid));
    if (res.isSuccess()) {
      final user = sessionManager.getUserProfile();
      user.profile.favoratesUids.add(eventUid);
      sessionManager.setUserProfile(user);
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> getFavorateEvents(
      {PaginationRequest? request}) async {
    var response = await processRequest(() => apiService.getFavorateEvents());
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => FeedApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Feed>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<bool, Exception>> linkToCommunity(
      String eventUid, Community community) async {
    var res = await processRequest(
        () => apiService.linkToCommunity(eventUid, community));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> unlinkFromCommunity(
      String eventUid, Community community) async {
    var res = await processRequest(
        () => apiService.unlinkFromCommunity(eventUid, community));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> getCommunityEvents(
      String communityUid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getCommunityEvents(communityUid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => FeedApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Feed>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<bool, Exception>> joinCommunitites(
      {List<String> private = const [], List<String> public = const []}) async {
    var response =
        await processRequest(() => apiService.joinCommunities(private, public));
    return Success(response.isSuccess());
  }

  @override
  Future<Result<bool, Exception>> removeFromFavorates(String eventUid) async {
    var res = await processRequest(
        () => apiService.removeEventFromFavorates(eventUid));
    if (res.isSuccess()) {
      final user = sessionManager.getUserProfile();
      user.profile.favoratesUids.remove(eventUid);
      sessionManager.setUserProfile(user);

      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> getProviderEvents(
      String providerUid,
      {PaginationRequest? request}) async {
    var data = await processRequest(
        () => apiService.getProviderEvents(providerUid, request: request));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!);

      try {
        final feeds = paginationResponse.data
                ?.map((e) => FeedApi.fromMap(e).mapToDomain())
                .toList() ??
            [];
        return Success(Pagination<Feed>(
            data: feeds,
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<List<Feed>, Exception>> getPopularEvents(
      SearchEventParams params) async {
    var data = await processRequest(() => apiService.getPopularEvents(params));
    if (data.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(data.tryGetSuccess()!, label: 'events');
      try {
        final feeds = paginationResponse.data
                ?.map((e) => FeedApi.fromMap(e).mapToDomain())
                .toList() ??
            [];
        return Success(feeds);
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success([]);
  }

  @override
  Future<Result<Event, Exception>> getEvent(String uid) async {
    var data = await processRequest(() => apiService.getEvent(uid));
    if (data.isSuccess()) {
      try {
        return Success(EventApi.fromMap(data.tryGetSuccess()!).mapToDomain());
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Event, Exception>> addEvent(NewEventRequest e) async {
    var data = await processRequest(() => apiService.addEvent(e));
    if (data.isSuccess()) {
      return Success(EventApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Event, Exception>> updateEvent(
      NewEventRequest e, EventActionType actionType) async {
    var data =
        await processRequest(() => apiService.updateEvent(e, actionType));
    if (data.isSuccess()) {
      return Success(EventApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Event>, Exception>> getEvents(
      {PaginationRequest? request}) async {
    var response =
        await processRequest(() => apiService.getEvents(request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);

      try {
        final data = paginationResponse.data
            ?.map((e) => EventApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Event>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Event>());
  }

  @override
  Future<Result<bool, Exception>> attend(String eventUid) async {
    var res = await processRequest(() => apiService.attendEvent(eventUid));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> unAttend(String eventUid) async {
    var res = await processRequest(() => apiService.unattendEvent(eventUid));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteEvent(
      String eventUid, EventActionType actionType) async {
    var res = await processRequest(
        () => apiService.deleteEvent(eventUid, actionType));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Member>, Exception>> getEventAttendees(String uid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getEventAttendees(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AttendeeApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Member>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
        // ignore: empty_catches
      } catch (e) {}
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> attendRecurring(
      String eventUid, String recurrenceUid) async {
    var res = await processRequest(
        () => apiService.attendRecurringEvent(eventUid, recurrenceUid));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteRecurringEvent(
      String eventUid, String recurrenceUid, EventActionType actionType) async {
    var res = await processRequest(() =>
        apiService.deleteRecurringEvent(eventUid, recurrenceUid, actionType));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Event, Exception>> getRecurringEvent(
      String uid, String recurrenceUid) async {
    getLogger('EventRepositoryImpl').e('getRecurringEvent');

    var data = await processRequest(
        () => apiService.getRecurringEvent(uid, recurrenceUid));
    if (data.isSuccess()) {
      try {
        return Success(EventApi.fromMap(data.tryGetSuccess()!).mapToDomain());
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Member>, Exception>> getRecurringEventAttendees(
      String uid, String recurrenceUid,
      {PaginationRequest? request}) async {
    var response = await processRequest(() => apiService
        .getRecurringEventAttendees(uid, recurrenceUid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AttendeeApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Member>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
        // ignore: empty_catches
      } catch (e) {}
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Feed>, Exception>> getRecurringEvents(String uid,
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getRecurringEvents(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);

      try {
        final data = paginationResponse.data
            ?.map((e) => FeedApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Feed>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('EventRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Feed>());
  }

  @override
  Future<Result<bool, Exception>> unAttendRecurring(
      String eventUid, String recurrenceUid) async {
    var res = await processRequest(
        () => apiService.unattendRecurringEvent(eventUid, recurrenceUid));
    if (res.isSuccess()) {
      return const Success(true);
    }
    return Error(res.tryGetError()!);
  }

  @override
  Future<Result<Event, Exception>> updateRecurringEvent(
      NewEventRequest e, EventActionType actionType) async {
    var data = await processRequest(
        () => apiService.updateRecurringEvent(e, actionType));
    if (data.isSuccess()) {
      return Success(EventApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }
}
