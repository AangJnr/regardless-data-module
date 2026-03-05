import 'package:dart_mappable/dart_mappable.dart';

part 'dashboard_metrics.mapper.dart';

@MappableClass()
class DashboardMetrics with DashboardMetricsMappable {
  final int eventsCount;
  final int appointmentsCount;
  final int communitiesCount;
  final int servicesCount;
  final int notificationsCount;
  final int teamsCount;
  final int collaboratorsCount;
  final int mediaCount;
  final int leaguesCount;
  final int postsCount;

  const DashboardMetrics(
      {this.eventsCount = 0,
      this.appointmentsCount = 0,
      this.notificationsCount = 0,
      this.communitiesCount = 0,
      this.servicesCount = 0,
      this.teamsCount = 0,
      this.collaboratorsCount = 0,
      this.mediaCount = 0,
      this.leaguesCount = 0,
      this.postsCount = 0});

  @override
  String toString() {
    return 'DashboardMetricsApi(eventsCount: $eventsCount, appointmentsCount: $appointmentsCount, notificationsCount: $notificationsCount, communitiesCount: $communitiesCount, postsCount: $postsCount )';
  }
}
