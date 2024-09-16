import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/appointment/appointment_details.dart';
import '../../../domain/model/venue.dart';
import '../venue_api.dart';

class AppointmentDetailApi implements DomainMapper<AppointmentDetail> {
  final String? title;
  final String? description;
  final String? startTime;
  final String? endTime;
  final VenueApi? location;

  const AppointmentDetailApi({
    this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.location,
  });

  @override
  String toString() {
    return 'AppointmentDetails(title: $title, description: $description, startTime: $startTime, endTime: $endTime, location: $location)';
  }

  factory AppointmentDetailApi.fromMap(Map<String, dynamic> data) {
    return AppointmentDetailApi(
      title: data['title'] as String?,
      description: data['description'] as String?,
      startTime: data['startTime'] as String?,
      endTime: data['endTime'] as String?,
      location: data['location'] == null
          ? null
          : VenueApi.fromMap(data['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'startTime': startTime,
        'endTime': endTime,
        'location': location?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppointmentDetailApi].
  factory AppointmentDetailApi.fromJson(String data) {
    return AppointmentDetailApi.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AppointmentDetailApi] to a JSON string.
  String toJson() => json.encode(toMap());

  AppointmentDetailApi copyWith({
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    VenueApi? location,
  }) {
    return AppointmentDetailApi(
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      location: location ?? this.location,
    );
  }

  @override
  AppointmentDetail mapToDomain() => AppointmentDetail(
        title: title ?? '',
        description: description ?? '',
        startTime: startTime ?? '',
        endTime: endTime ?? '',
        location: location?.mapToDomain() ?? const Venue(),
      );
}
