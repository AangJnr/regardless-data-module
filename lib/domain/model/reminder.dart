import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';

part 'reminder.mapper.dart';

@MappableClass(includeCustomMappers: [DurationMapper()])
class Reminder with ReminderMappable {
  final String uid;
  final String? recurrenceUid;
  final String title;
  final String description;
  final DateTime date;
  final Duration? duration;
  final Map<String, dynamic>? metaData;
  Reminder(
      {required this.uid,
      required this.title,
      required this.description,
      required this.date,
      this.recurrenceUid, this.metaData,
      this.duration});

  String getParsedDate() {
    try {
      if (isToday()) {
        return 'Today at: ${DateFormat('h:mm a').format(date)}';
      }
      if (isYesterday()) {
        return 'Yesterday, ${DateFormat('h:mm a').format(date)}';
      }
      return DateFormat('E, MMMM dd @ h:mm a').format(date);
    } catch (e) {
      return '';
    }
  }

  String formatOnlyTime() {
    try {
      return DateFormat('EMd h:mm a').format(date);
    } catch (e) {
      return "--";
    }
  }

  String formatMonthYear() {
    try {
      if (isToday()) {
        return "Today";
      }
      if (isWithinThisMonth()) {
        return "This month";
      }
      return DateFormat.yMMMM().format(date).toString();
    } catch (e) {
      return '$date';
    }
  }

  bool isWithinThisMonth() {
    try {
      return DateFormat.yM().format(date) ==
          DateFormat.yM().format(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  bool isToday() {
    try {
      return DateFormat.yMd().format(date) ==
          DateFormat.yMd().format(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  bool isYesterday() {
    try {
      return DateFormat.yMd().format(date) ==
          DateFormat.yMd().format(DateTime.now().subtract(Duration(days: 1)));
    } catch (e) {
      return false;
    }
  }
}

class DurationMapper extends SimpleMapper<Duration> {
  const DurationMapper();

  @override
  Duration decode(dynamic value) {
    return Duration(microseconds: value as int);
  }

  @override
  dynamic encode(Duration self) {
    return self.inMicroseconds;
  }
}
