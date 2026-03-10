// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appointment_details.dart';

class AppointmentDetailMapper extends ClassMapperBase<AppointmentDetail> {
  AppointmentDetailMapper._();

  static AppointmentDetailMapper? _instance;
  static AppointmentDetailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppointmentDetailMapper._());
      VenueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppointmentDetail';

  static String _$title(AppointmentDetail v) => v.title;
  static const Field<AppointmentDetail, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
    def: '',
  );
  static String _$description(AppointmentDetail v) => v.description;
  static const Field<AppointmentDetail, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$startTime(AppointmentDetail v) => v.startTime;
  static const Field<AppointmentDetail, String> _f$startTime = Field(
    'startTime',
    _$startTime,
    opt: true,
    def: '',
  );
  static String _$endTime(AppointmentDetail v) => v.endTime;
  static const Field<AppointmentDetail, String> _f$endTime = Field(
    'endTime',
    _$endTime,
    opt: true,
    def: '',
  );
  static String? _$serviceUid(AppointmentDetail v) => v.serviceUid;
  static const Field<AppointmentDetail, String> _f$serviceUid = Field(
    'serviceUid',
    _$serviceUid,
    opt: true,
  );
  static Venue? _$location(AppointmentDetail v) => v.location;
  static const Field<AppointmentDetail, Venue> _f$location = Field(
    'location',
    _$location,
    opt: true,
  );
  static String? _$proposedStartTime(AppointmentDetail v) =>
      v.proposedStartTime;
  static const Field<AppointmentDetail, String> _f$proposedStartTime = Field(
    'proposedStartTime',
    _$proposedStartTime,
    opt: true,
  );

  @override
  final MappableFields<AppointmentDetail> fields = const {
    #title: _f$title,
    #description: _f$description,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
    #serviceUid: _f$serviceUid,
    #location: _f$location,
    #proposedStartTime: _f$proposedStartTime,
  };

  static AppointmentDetail _instantiate(DecodingData data) {
    return AppointmentDetail(
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      startTime: data.dec(_f$startTime),
      endTime: data.dec(_f$endTime),
      serviceUid: data.dec(_f$serviceUid),
      location: data.dec(_f$location),
      proposedStartTime: data.dec(_f$proposedStartTime),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppointmentDetail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppointmentDetail>(map);
  }

  static AppointmentDetail fromJson(String json) {
    return ensureInitialized().decodeJson<AppointmentDetail>(json);
  }
}

mixin AppointmentDetailMappable {
  String toJson() {
    return AppointmentDetailMapper.ensureInitialized()
        .encodeJson<AppointmentDetail>(this as AppointmentDetail);
  }

  Map<String, dynamic> toMap() {
    return AppointmentDetailMapper.ensureInitialized()
        .encodeMap<AppointmentDetail>(this as AppointmentDetail);
  }

  AppointmentDetailCopyWith<AppointmentDetail, AppointmentDetail,
          AppointmentDetail>
      get copyWith =>
          _AppointmentDetailCopyWithImpl<AppointmentDetail, AppointmentDetail>(
            this as AppointmentDetail,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return AppointmentDetailMapper.ensureInitialized().stringifyValue(
      this as AppointmentDetail,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppointmentDetailMapper.ensureInitialized().equalsValue(
      this as AppointmentDetail,
      other,
    );
  }

  @override
  int get hashCode {
    return AppointmentDetailMapper.ensureInitialized().hashValue(
      this as AppointmentDetail,
    );
  }
}

extension AppointmentDetailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppointmentDetail, $Out> {
  AppointmentDetailCopyWith<$R, AppointmentDetail, $Out>
      get $asAppointmentDetail => $base.as(
            (v, t, t2) => _AppointmentDetailCopyWithImpl<$R, $Out>(v, t, t2),
          );
}

abstract class AppointmentDetailCopyWith<$R, $In extends AppointmentDetail,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  VenueCopyWith<$R, Venue, Venue>? get location;
  $R call({
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    String? serviceUid,
    Venue? location,
    String? proposedStartTime,
  });
  AppointmentDetailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppointmentDetailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppointmentDetail, $Out>
    implements AppointmentDetailCopyWith<$R, AppointmentDetail, $Out> {
  _AppointmentDetailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppointmentDetail> $mapper =
      AppointmentDetailMapper.ensureInitialized();
  @override
  VenueCopyWith<$R, Venue, Venue>? get location =>
      $value.location?.copyWith.$chain((v) => call(location: v));
  @override
  $R call({
    String? title,
    String? description,
    String? startTime,
    String? endTime,
    Object? serviceUid = $none,
    Object? location = $none,
    Object? proposedStartTime = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (title != null) #title: title,
          if (description != null) #description: description,
          if (startTime != null) #startTime: startTime,
          if (endTime != null) #endTime: endTime,
          if (serviceUid != $none) #serviceUid: serviceUid,
          if (location != $none) #location: location,
          if (proposedStartTime != $none) #proposedStartTime: proposedStartTime,
        }),
      );
  @override
  AppointmentDetail $make(CopyWithData data) => AppointmentDetail(
        title: data.get(#title, or: $value.title),
        description: data.get(#description, or: $value.description),
        startTime: data.get(#startTime, or: $value.startTime),
        endTime: data.get(#endTime, or: $value.endTime),
        serviceUid: data.get(#serviceUid, or: $value.serviceUid),
        location: data.get(#location, or: $value.location),
        proposedStartTime: data.get(
          #proposedStartTime,
          or: $value.proposedStartTime,
        ),
      );

  @override
  AppointmentDetailCopyWith<$R2, AppointmentDetail, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _AppointmentDetailCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
