// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'slot.dart';

class SlotMapper extends ClassMapperBase<Slot> {
  SlotMapper._();

  static SlotMapper? _instance;
  static SlotMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SlotMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Slot';

  static DateTime? _$startTime(Slot v) => v.startTime;
  static const Field<Slot, DateTime> _f$startTime = Field(
    'startTime',
    _$startTime,
    opt: true,
  );
  static DateTime? _$endTime(Slot v) => v.endTime;
  static const Field<Slot, DateTime> _f$endTime = Field(
    'endTime',
    _$endTime,
    opt: true,
  );

  @override
  final MappableFields<Slot> fields = const {
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static Slot _instantiate(DecodingData data) {
    return Slot(
      startTime: data.dec(_f$startTime),
      endTime: data.dec(_f$endTime),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Slot fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Slot>(map);
  }

  static Slot fromJson(String json) {
    return ensureInitialized().decodeJson<Slot>(json);
  }
}

mixin SlotMappable {
  String toJson() {
    return SlotMapper.ensureInitialized().encodeJson<Slot>(this as Slot);
  }

  Map<String, dynamic> toMap() {
    return SlotMapper.ensureInitialized().encodeMap<Slot>(this as Slot);
  }

  SlotCopyWith<Slot, Slot, Slot> get copyWith =>
      _SlotCopyWithImpl<Slot, Slot>(this as Slot, $identity, $identity);
  @override
  String toString() {
    return SlotMapper.ensureInitialized().stringifyValue(this as Slot);
  }

  @override
  bool operator ==(Object other) {
    return SlotMapper.ensureInitialized().equalsValue(this as Slot, other);
  }

  @override
  int get hashCode {
    return SlotMapper.ensureInitialized().hashValue(this as Slot);
  }
}

extension SlotValueCopy<$R, $Out> on ObjectCopyWith<$R, Slot, $Out> {
  SlotCopyWith<$R, Slot, $Out> get $asSlot =>
      $base.as((v, t, t2) => _SlotCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SlotCopyWith<$R, $In extends Slot, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({DateTime? startTime, DateTime? endTime});
  SlotCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SlotCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Slot, $Out>
    implements SlotCopyWith<$R, Slot, $Out> {
  _SlotCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Slot> $mapper = SlotMapper.ensureInitialized();
  @override
  $R call({Object? startTime = $none, Object? endTime = $none}) => $apply(
    FieldCopyWithData({
      if (startTime != $none) #startTime: startTime,
      if (endTime != $none) #endTime: endTime,
    }),
  );
  @override
  Slot $make(CopyWithData data) => Slot(
    startTime: data.get(#startTime, or: $value.startTime),
    endTime: data.get(#endTime, or: $value.endTime),
  );

  @override
  SlotCopyWith<$R2, Slot, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SlotCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

