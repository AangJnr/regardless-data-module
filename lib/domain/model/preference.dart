import 'package:dart_mappable/dart_mappable.dart';

part 'preference.mapper.dart';

@MappableClass()
class Preference with PreferenceMappable {
  final String id;
  final String createdAt;
  final String updatedAt;
  final bool isActive;
  final bool emailNewFeatureAnnouncement;
  final bool emailNewsletterWeekly;
  final bool emailRecommendations;
  final bool pushNewFeatureAnnouncement;
  final bool pushNewsletterWeekly;
  final bool pushRecommendations;
  final bool pushNotifications;
  final bool smsNotifications;
  final bool emailNotifications;

  Preference(
      {this.id = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.isActive = false,
      this.emailNewFeatureAnnouncement = false,
      this.emailNewsletterWeekly = false,
      this.emailRecommendations = false,
      this.pushNewFeatureAnnouncement = false,
      this.pushNewsletterWeekly = false,
      this.pushRecommendations = false,
      this.pushNotifications = false,
      this.emailNotifications = false,
      this.smsNotifications = false});

  @override
  String toString() {
    return 'PreferenceA(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, emailNewFeatureAnnouncement: $emailNewFeatureAnnouncement, emailNewsletterWeekly: $emailNewsletterWeekly, emailRecommendations: $emailRecommendations, pushNewFeatureAnnouncement: $pushNewFeatureAnnouncement, pushNewsletterWeekly: $pushNewsletterWeekly, pushRecommendations: $pushRecommendations)';
  }
}
