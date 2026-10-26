import 'dart:convert';

import 'package:regardless_data_module/domain/model/results.dart';
import 'package:regardless_data_module/domain/model/service/service.dart';
import 'package:regardless_data_module/domain/model/team/team.dart';
import 'package:regardless_data_module/domain/model/tournament/tournament.dart';
import 'package:regardless_data_module/domain/model/user.dart';

import '../../../domain/model/community/community.dart';
import '../feed_api.dart';

class SearchResults {
  final List<FeedApi>? events;
  final List<FeedApi>? otherEvents;
  final List<Community>? communities;
  final List<Community>? otherCommunities;
  final List<Service>? services;
  final List<Service>? otherServices;
  final List<AUser>? providers;
  final List<AUser>? otherProviders;
  final List<Team>? teams;
  final List<Tournament>? tournaments;

  const SearchResults({
    this.events,
    this.otherEvents,
    this.communities,
    this.otherCommunities,
    this.services,
    this.otherServices,
    this.providers,
    this.otherProviders,
    this.teams,
    this.tournaments,
  });

  @override
  String toString() {
    return 'Results(events: $events, otherEvents: $otherEvents, providers: $providers)';
  }

  factory SearchResults.fromMap(Map<String, dynamic> data) => SearchResults(
    events: (data['events'] as List<dynamic>?)
        ?.map((e) => FeedApi.fromMap(e as Map<String, dynamic>))
        .toList(),
    otherEvents: (data['otherEvents'] as List<dynamic>?)
        ?.map((e) => FeedApi.fromMap(e as Map<String, dynamic>))
        .toList(),
    communities: (data['communities'] as List<dynamic>?)
        ?.map((e) => CommunityMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    otherCommunities: (data['otherCommunities'] as List<dynamic>?)
        ?.map((e) => CommunityMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    otherServices: (data['otherServices'] as List<dynamic>?)
        ?.map((e) => ServiceMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    services: (data['services'] as List<dynamic>?)
        ?.map((e) => ServiceMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    providers: (data['users'] as List<dynamic>?)
        ?.map((e) => AUserMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    otherProviders: (data['otherProviders'] as List<dynamic>?)
        ?.map((e) => AUserMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    teams: (data['teams'] as List<dynamic>?)
        ?.map((e) => TeamMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
    tournaments: (data['tournaments'] as List<dynamic>?)
        ?.map((e) => TournamentMapper.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'events': events?.map((e) => e.toMap()).toList(),
    'otherEvents': otherEvents?.map((e) => e.toMap()).toList(),
    'communities': communities?.map((e) => e.toMap()).toList(),
    'services': services?.map((e) => e.toMap()).toList(),
    'otherServices': otherServices?.map((e) => e.toMap()).toList(),
    'providers': providers?.map((e) => e.toMap()).toList(),
    'otherProviders': otherProviders?.map((e) => e.toJson()).toList(),
    'teams': teams?.map((e) => e.toMap()).toList(),
    'tournaments': tournaments?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchResults].
  factory SearchResults.fromJson(String data) {
    return SearchResults.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchResults] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchEventResults mapToDomain() => SearchEventResults(
    events: events?.map((e) => e.mapToDomain()).toList() ?? [],
    otherEvents: otherEvents?.map((e) => e.mapToDomain()).toList() ?? [],
    communities: communities?.map((e) => e).toList() ?? [],
    otherCommunities: otherCommunities?.map((e) => e).toList() ?? [],
    services: services ?? [],
    otherServices: otherServices ?? [],
    providers: providers ?? [],
    otherProviders: otherProviders ?? [],
    teams: teams ?? [],
    tournaments:tournaments??[]
  );
}
