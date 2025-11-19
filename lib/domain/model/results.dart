import 'community/community.dart';
import 'feed.dart';
import 'service/service.dart';

class SearchEventResults {
  final List<Feed> events;
  final List<Feed> otherEvents;
  final List<Community> communities;
    final List<Community> otherCommunities;

  final List<Service> services;
  final List<Service> otherServices;

  const SearchEventResults(
      {this.events = const [],
      this.otherEvents = const [],
      this.communities = const [],
      this.otherCommunities = const [],
      this.services = const [],
      this.otherServices = const []});

  @override
  String toString() {
    return 'Results(events: $events, otherEvents: $otherEvents)';
  }
}
