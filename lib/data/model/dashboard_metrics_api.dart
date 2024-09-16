import 'dart:convert';

import '../../domain/domain_mapper.dart';
import '../../domain/model/dashboard_metrics.dart';
import 'appointment_api/appointment_api.dart';

class DashboardMetricsApi implements DomainMapper<DashboardMetrics> {
  final int? eventsCount;
  final int? appointmentsCount;
  final int? notificationsCount;
  final List<AppointmentApi>? todaysBookings;

  const DashboardMetricsApi({
    this.eventsCount,
    this.appointmentsCount,
    this.notificationsCount,
    this.todaysBookings,
  });

  @override
  String toString() {
    return 'DashboardMetricsApi(eventsCount: $eventsCount, appointmentsCount: $appointmentsCount, notificationsCount: $notificationsCount, todaysBookings: $todaysBookings)';
  }

  factory DashboardMetricsApi.fromMap(Map<String, dynamic> data) {
    return DashboardMetricsApi(
      eventsCount: data['eventsCount'] as int?,
      appointmentsCount: data['appointmentsCount'] as int?,
      notificationsCount: data['notificationsCount'] as int?,
      todaysBookings: (data['todaysBookings'] as List<dynamic>?)
          ?.map((e) => AppointmentApi.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'eventsCount': eventsCount,
        'appointmentsCount': appointmentsCount,
        'notificationsCount': notificationsCount,
        'todaysBookings': todaysBookings?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DashboardMetricsApi].
  factory DashboardMetricsApi.fromJson(String data) {
    return DashboardMetricsApi.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DashboardMetricsApi] to a JSON string.
  String toJson() => json.encode(toMap());

  DashboardMetricsApi copyWith({
    int? eventsCount,
    int? appointmentsCount,
    int? notificationsCount,
    List<AppointmentApi>? todaysBookings,
  }) {
    return DashboardMetricsApi(
      eventsCount: eventsCount ?? this.eventsCount,
      appointmentsCount: appointmentsCount ?? this.appointmentsCount,
      notificationsCount: notificationsCount ?? this.notificationsCount,
      todaysBookings: todaysBookings ?? this.todaysBookings,
    );
  }

  @override
  DashboardMetrics mapToDomain() => DashboardMetrics(
        eventsCount: eventsCount ?? 0,
        appointmentsCount: appointmentsCount ?? 0,
        notificationsCount: notificationsCount ?? 0,
        todaysBookings:
            todaysBookings?.map((e) => e.mapToDomain()).toList() ?? const [],
      );
}
