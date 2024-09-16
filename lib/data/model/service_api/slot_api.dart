import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/service/slot.dart';

class SlotApi implements DomainMapper<Slot> {
  final String? startTime;
  final String? endTime;

  const SlotApi({this.startTime, this.endTime});

  @override
  String toString() => 'Slot(startTime: $startTime, endTime: $endTime)';

  factory SlotApi.fromMap(Map<String, dynamic> data) => SlotApi(
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'startTime': startTime,
        'endTime': endTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SlotApi].
  factory SlotApi.fromJson(String data) {
    return SlotApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SlotApi] to a JSON string.
  String toJson() => json.encode(toMap());

  SlotApi copyWith({
    String? startTime,
    String? endTime,
  }) {
    return SlotApi(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Slot mapToDomain() {
    return Slot(
      startTime: DateTime.tryParse(startTime ?? ''),
      endTime: DateTime.tryParse(endTime ?? ''),
    );
  }
}
