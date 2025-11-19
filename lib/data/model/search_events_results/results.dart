import 'dart:convert';

import '../../../domain/model/community/community.dart';
import '../feed_api.dart';
import '../service_api/service_api.dart';

class Results {
  final List<FeedApi>? events;
  final List<FeedApi>? otherEvents;
  final List<Community>? communities;
  final List<ServiceApi>? services;
  final List<ServiceApi>? otherServices;

  const Results(
      {this.events,
      this.otherEvents,
      this.communities,
      this.services,
      this.otherServices});

  @override
  String toString() {
    return 'Results(events: $events, otherEvents: $otherEvents)';
  }

  factory Results.fromMap(Map<String, dynamic> data) => Results(
        events: (data['events'] as List<dynamic>?)
            ?.map((e) => FeedApi.fromMap(e as Map<String, dynamic>))
            .toList(),
        otherEvents: (data['otherEvents'] as List<dynamic>?)
            ?.map((e) => FeedApi.fromMap(e as Map<String, dynamic>))
            .toList(),
        communities: (data['communities'] as List<dynamic>?)
            ?.map((e) => CommunityMapper.fromMap(e as Map<String, dynamic>))
            .toList(),
        otherServices: (data['otherServices'] as List<dynamic>?)
            ?.map((e) => ServiceApi.fromMap(e as Map<String, dynamic>))
            .toList(),
        services: (data['services'] as List<dynamic>?)
            ?.map((e) => ServiceApi.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'events': events?.map((e) => e.toMap()).toList(),
        'otherEvents': otherEvents?.map((e) => e.toMap()).toList(),
        'communities': communities?.map((e) => e.toMap()).toList(),
        'services': services?.map((e) => e.toMap()).toList(),
        'otherServices': otherServices?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Results].
  factory Results.fromJson(String data) {
    return Results.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Results] to a JSON string.
  String toJson() => json.encode(toMap());
}
