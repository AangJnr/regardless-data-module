import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';
import '../venue.dart';

part 'appointment_details.mapper.dart';

@MappableClass()
class AppointmentDetail with AppointmentDetailMappable {
  final String title;
  final String description;
  final String startTime;
  final String endTime;
  final Venue? location;
  final String? serviceUid;

  /// Optional. When user subscribes, they can propose when the subscription should start. If set, backend uses this when provider accepts; otherwise start is set at confirmation time.
  final String? proposedStartTime;

  const AppointmentDetail({
    this.title = '',
    this.description = '',
    this.startTime = '',
    this.endTime = '',
    this.serviceUid,
    this.location,
    this.proposedStartTime,
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
      if (proposedStartTime != null) {
        return DateTime.parse(proposedStartTime!);
      }
      return null;
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
}
