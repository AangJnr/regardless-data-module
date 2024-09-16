import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/service/time_slot.dart';
import 'slot_api.dart';

class TimeSlotApi implements DomainMapper<TimeSlot> {
  final String? day;
  final List<SlotApi>? slots;

  const TimeSlotApi({this.day, this.slots});

  @override
  String toString() => 'TimeSlot(day: $day, slots: $slots)';

  factory TimeSlotApi.fromMap(Map<String, dynamic> data) => TimeSlotApi(
        day: data['day'] as String?,
        slots: (data['slots'] as List<dynamic>?)
            ?.map((e) => SlotApi.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'slots': slots?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TimeSlotApi].
  factory TimeSlotApi.fromJson(String data) {
    return TimeSlotApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TimeSlotApi] to a JSON string.
  String toJson() => json.encode(toMap());

  TimeSlotApi copyWith({
    String? day,
    List<SlotApi>? slots,
  }) {
    return TimeSlotApi(
      day: day ?? this.day,
      slots: slots ?? this.slots,
    );
  }

  @override
  TimeSlot mapToDomain() {
    return TimeSlot(
      day: day ?? '',
      slots: slots?.map((e) => e.mapToDomain()).toList() ?? const [],
    );
  }
}
