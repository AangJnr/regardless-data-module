// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'reminder.dart';

class ReminderMapper extends ClassMapperBase<Reminder> {
  ReminderMapper._();

  static ReminderMapper? _instance;
  static ReminderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReminderMapper._());
      MapperContainer.globals.useAll([DurationMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'Reminder';

  static String _$uid(Reminder v) => v.uid;
  static const Field<Reminder, String> _f$uid = Field('uid', _$uid);
  static String _$title(Reminder v) => v.title;
  static const Field<Reminder, String> _f$title = Field('title', _$title);
  static String _$description(Reminder v) => v.description;
  static const Field<Reminder, String> _f$description = Field(
    'description',
    _$description,
  );
  static DateTime _$date(Reminder v) => v.date;
  static const Field<Reminder, DateTime> _f$date = Field('date', _$date);
  static String? _$recurrenceUid(Reminder v) => v.recurrenceUid;
  static const Field<Reminder, String> _f$recurrenceUid = Field(
    'recurrenceUid',
    _$recurrenceUid,
    opt: true,
  );
  static Map<String, dynamic>? _$metaData(Reminder v) => v.metaData;
  static const Field<Reminder, Map<String, dynamic>> _f$metaData = Field(
    'metaData',
    _$metaData,
    opt: true,
  );
  static Duration? _$duration(Reminder v) => v.duration;
  static const Field<Reminder, Duration> _f$duration = Field(
    'duration',
    _$duration,
    opt: true,
  );

  @override
  final MappableFields<Reminder> fields = const {
    #uid: _f$uid,
    #title: _f$title,
    #description: _f$description,
    #date: _f$date,
    #recurrenceUid: _f$recurrenceUid,
    #metaData: _f$metaData,
    #duration: _f$duration,
  };

  static Reminder _instantiate(DecodingData data) {
    return Reminder(
      uid: data.dec(_f$uid),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      date: data.dec(_f$date),
      recurrenceUid: data.dec(_f$recurrenceUid),
      metaData: data.dec(_f$metaData),
      duration: data.dec(_f$duration),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Reminder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Reminder>(map);
  }

  static Reminder fromJson(String json) {
    return ensureInitialized().decodeJson<Reminder>(json);
  }
}

mixin ReminderMappable {
  String toJson() {
    return ReminderMapper.ensureInitialized().encodeJson<Reminder>(
      this as Reminder,
    );
  }

  Map<String, dynamic> toMap() {
    return ReminderMapper.ensureInitialized().encodeMap<Reminder>(
      this as Reminder,
    );
  }

  ReminderCopyWith<Reminder, Reminder, Reminder> get copyWith =>
      _ReminderCopyWithImpl<Reminder, Reminder>(
        this as Reminder,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ReminderMapper.ensureInitialized().stringifyValue(this as Reminder);
  }

  @override
  bool operator ==(Object other) {
    return ReminderMapper.ensureInitialized().equalsValue(
      this as Reminder,
      other,
    );
  }

  @override
  int get hashCode {
    return ReminderMapper.ensureInitialized().hashValue(this as Reminder);
  }
}

extension ReminderValueCopy<$R, $Out> on ObjectCopyWith<$R, Reminder, $Out> {
  ReminderCopyWith<$R, Reminder, $Out> get $asReminder =>
      $base.as((v, t, t2) => _ReminderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ReminderCopyWith<$R, $In extends Reminder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get metaData;
  $R call({
    String? uid,
    String? title,
    String? description,
    DateTime? date,
    String? recurrenceUid,
    Map<String, dynamic>? metaData,
    Duration? duration,
  });
  ReminderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReminderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Reminder, $Out>
    implements ReminderCopyWith<$R, Reminder, $Out> {
  _ReminderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Reminder> $mapper =
      ReminderMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get metaData => $value.metaData != null
      ? MapCopyWith(
          $value.metaData!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(metaData: v),
        )
      : null;
  @override
  $R call({
    String? uid,
    String? title,
    String? description,
    DateTime? date,
    Object? recurrenceUid = $none,
    Object? metaData = $none,
    Object? duration = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (title != null) #title: title,
      if (description != null) #description: description,
      if (date != null) #date: date,
      if (recurrenceUid != $none) #recurrenceUid: recurrenceUid,
      if (metaData != $none) #metaData: metaData,
      if (duration != $none) #duration: duration,
    }),
  );
  @override
  Reminder $make(CopyWithData data) => Reminder(
    uid: data.get(#uid, or: $value.uid),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    date: data.get(#date, or: $value.date),
    recurrenceUid: data.get(#recurrenceUid, or: $value.recurrenceUid),
    metaData: data.get(#metaData, or: $value.metaData),
    duration: data.get(#duration, or: $value.duration),
  );

  @override
  ReminderCopyWith<$R2, Reminder, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ReminderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

