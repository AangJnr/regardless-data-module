import 'appointment/appointment.dart';

class DashboardMetrics {
  final int eventsCount;
  final int appointmentsCount;
  final int notificationsCount;
  final List<Appointment> todaysBookings;

  const DashboardMetrics({
    this.eventsCount = 0,
    this.appointmentsCount = 0,
    this.notificationsCount = 0,
    this.todaysBookings = const [],
  });

  @override
  String toString() {
    return 'DashboardMetricsApi(eventsCount: $eventsCount, appointmentsCount: $appointmentsCount, notificationsCount: $notificationsCount, todaysBookings: $todaysBookings)';
  }
}
