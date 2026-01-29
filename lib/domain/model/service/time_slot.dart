import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/data/model/service_api/slot_api.dart';

import '../../../data/model/service_api/time_slot_api.dart';
import 'slot.dart';

part 'time_slot.mapper.dart';

@MappableClass()
class TimeSlot with TimeSlotMappable {
  final int order;
  final String day;
  final String date;

  final List<Slot> slots;

  const TimeSlot(
      {this.day = '', this.slots = const [], this.date = '', this.order = 0});

  @override
  String toString() => 'TimeSlot(day: $day, slots: $slots)';

  String toSinglularString() => '$day @ ${slots.first.toString()}';

  bool isValid() {
    return slots.where((e) => e.endTime == null).isEmpty;
  }

  TimeSlotApi toApi() {
    return TimeSlotApi(
      day: day,
      slots: slots
          .map((e) => SlotApi(
              startTime: e.startTime?.toIso8601String(),
              endTime: e.endTime?.toIso8601String()))
          .toList(),
    );
  }
}
