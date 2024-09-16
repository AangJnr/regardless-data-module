import 'package:intl/intl.dart';

class Slot {
  final DateTime? startTime;
  final DateTime? endTime;

  const Slot({this.startTime, this.endTime});

  @override
  String toString() {
    String displayTime = '';
    final dateFormat = DateFormat("h:mm a");
    if (startTime != null) {
      displayTime += '${dateFormat.format(startTime!)} - ';
    }

    if (endTime != null) {
      displayTime += dateFormat.format(endTime!);
    }
    return displayTime;
  }

  Slot copyWith({
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return Slot(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Slot &&
        other._timeWithoutSeconds(startTime) ==
            _timeWithoutSeconds(startTime) &&
        other._timeWithoutSeconds(endTime) == _timeWithoutSeconds(endTime);
  }

  @override
  int get hashCode =>
      _timeWithoutSeconds(startTime).hashCode ^
      _timeWithoutSeconds(endTime).hashCode;

  // Helper method to get the hour and minute as a string
  String _timeWithoutSeconds(DateTime? dateTime) {
    if (dateTime == null) return '';
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
