// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'time_slot.dart';

class TimeSlotMapper extends ClassMapperBase<TimeSlot> {
  TimeSlotMapper._();

  static TimeSlotMapper? _instance;
  static TimeSlotMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimeSlotMapper._());
      SlotMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TimeSlot';

  static String _$day(TimeSlot v) => v.day;
  static const Field<TimeSlot, String> _f$day = Field(
    'day',
    _$day,
    opt: true,
    def: '',
  );
  static List<Slot> _$slots(TimeSlot v) => v.slots;
  static const Field<TimeSlot, List<Slot>> _f$slots = Field(
    'slots',
    _$slots,
    opt: true,
    def: const [],
  );
  static String _$date(TimeSlot v) => v.date;
  static const Field<TimeSlot, String> _f$date = Field(
    'date',
    _$date,
    opt: true,
    def: '',
  );
  static int _$order(TimeSlot v) => v.order;
  static const Field<TimeSlot, int> _f$order = Field(
    'order',
    _$order,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<TimeSlot> fields = const {
    #day: _f$day,
    #slots: _f$slots,
    #date: _f$date,
    #order: _f$order,
  };

  static TimeSlot _instantiate(DecodingData data) {
    return TimeSlot(
      day: data.dec(_f$day),
      slots: data.dec(_f$slots),
      date: data.dec(_f$date),
      order: data.dec(_f$order),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TimeSlot fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimeSlot>(map);
  }

  static TimeSlot fromJson(String json) {
    return ensureInitialized().decodeJson<TimeSlot>(json);
  }
}

mixin TimeSlotMappable {
  String toJson() {
    return TimeSlotMapper.ensureInitialized().encodeJson<TimeSlot>(
      this as TimeSlot,
    );
  }

  Map<String, dynamic> toMap() {
    return TimeSlotMapper.ensureInitialized().encodeMap<TimeSlot>(
      this as TimeSlot,
    );
  }

  TimeSlotCopyWith<TimeSlot, TimeSlot, TimeSlot> get copyWith =>
      _TimeSlotCopyWithImpl<TimeSlot, TimeSlot>(
        this as TimeSlot,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TimeSlotMapper.ensureInitialized().stringifyValue(this as TimeSlot);
  }

  @override
  bool operator ==(Object other) {
    return TimeSlotMapper.ensureInitialized().equalsValue(
      this as TimeSlot,
      other,
    );
  }

  @override
  int get hashCode {
    return TimeSlotMapper.ensureInitialized().hashValue(this as TimeSlot);
  }
}

extension TimeSlotValueCopy<$R, $Out> on ObjectCopyWith<$R, TimeSlot, $Out> {
  TimeSlotCopyWith<$R, TimeSlot, $Out> get $asTimeSlot =>
      $base.as((v, t, t2) => _TimeSlotCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TimeSlotCopyWith<$R, $In extends TimeSlot, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Slot, SlotCopyWith<$R, Slot, Slot>> get slots;
  $R call({String? day, List<Slot>? slots, String? date, int? order});
  TimeSlotCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimeSlotCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimeSlot, $Out>
    implements TimeSlotCopyWith<$R, TimeSlot, $Out> {
  _TimeSlotCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimeSlot> $mapper =
      TimeSlotMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Slot, SlotCopyWith<$R, Slot, Slot>> get slots =>
      ListCopyWith(
        $value.slots,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(slots: v),
      );
  @override
  $R call({String? day, List<Slot>? slots, String? date, int? order}) => $apply(
    FieldCopyWithData({
      if (day != null) #day: day,
      if (slots != null) #slots: slots,
      if (date != null) #date: date,
      if (order != null) #order: order,
    }),
  );
  @override
  TimeSlot $make(CopyWithData data) => TimeSlot(
    day: data.get(#day, or: $value.day),
    slots: data.get(#slots, or: $value.slots),
    date: data.get(#date, or: $value.date),
    order: data.get(#order, or: $value.order),
  );

  @override
  TimeSlotCopyWith<$R2, TimeSlot, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TimeSlotCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

