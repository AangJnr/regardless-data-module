import 'package:intl/intl.dart';
import '../venue.dart';

class AppointmentDetail {
  final String title;
  final String description;
  final String startTime;
  final String endTime;
  final Venue location;

  const AppointmentDetail({
    this.title = '',
    this.description = '',
    this.startTime = '',
    this.endTime = '',
    this.location = const Venue(),
  });

  @override
  String toString() {
    return 'AppointmentDetails(title: $title, description: $description, startTime: $startTime, endTime: $endTime, location: $location)';
  }

  String timeline() {
    var displayTime = '';
    final dateFormat = DateFormat("EEE, dd MMM h:mm a");
    displayTime += 'Start : ${dateFormat.format(DateTime.parse(startTime))}\n';

    displayTime += 'End : ${dateFormat.format(DateTime.parse(endTime))}';
    return displayTime.trim();
  }

  DateTime? getStartTime() {
    try {
      return DateTime.parse(startTime);
    } catch (e) {
      return null;
    }
  }

  DateTime? getEndTime() {
    try {
      return DateTime.parse(endTime);
    } catch (e) {
      return null;
    }
  }

  AppointmentDetail copyWith({
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    Venue? location,
  }) {
    return AppointmentDetail(
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      location: location ?? this.location,
    );
  }
}
