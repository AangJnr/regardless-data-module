import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/results.dart';
import 'results.dart';

class SearchEventResultsApi implements DomainMapper<SearchEventResults> {
  final Results? results;

  const SearchEventResultsApi({this.results});

  @override
  String toString() => 'SearchEventsResults(results: $results)';

  factory SearchEventResultsApi.fromMap(Map<String, dynamic>? data) {
    return SearchEventResultsApi(
      results:
          data == null ? null : Results.fromMap(data),
    );
  }

  Map<String, dynamic> toMap() => {
        'results': results?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchEventResultsApi].
  factory SearchEventResultsApi.fromJson(String data) {
    return SearchEventResultsApi.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchEventResultsApi] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchEventResultsApi copyWith({
    Results? results,
  }) {
    return SearchEventResultsApi(
      results: results ?? this.results,
    );
  }

  @override
  SearchEventResults mapToDomain() => SearchEventResults(
        events: results?.events?.map((e) => e.mapToDomain()).toList() ?? [],
        otherEvents:
            results?.otherEvents?.map((e) => e.mapToDomain()).toList() ?? [],
        communities:
            results?.communities?.map((e) => e.mapToDomain()).toList() ?? [],
        services: results?.services?.map((e) => e.mapToDomain()).toList() ?? [],
        otherServices:
            results?.otherServices?.map((e) => e.mapToDomain()).toList() ?? [],
      );
}
