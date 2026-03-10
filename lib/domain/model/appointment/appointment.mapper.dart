// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appointment.dart';

class AppointmentStatusMapper extends EnumMapper<AppointmentStatus> {
  AppointmentStatusMapper._();

  static AppointmentStatusMapper? _instance;
  static AppointmentStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppointmentStatusMapper._());
    }
    return _instance!;
  }

  static AppointmentStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AppointmentStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return AppointmentStatus.pending;

      case r'active':
        return AppointmentStatus.active;
      case r'rejected':
        return AppointmentStatus.rejected;
      case r'cancelled':
        return AppointmentStatus.cancelled;
      case r'expired':
        return AppointmentStatus.expired;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AppointmentStatus self) {
    switch (self) {
      case AppointmentStatus.pending:
        return r'pending';

      case AppointmentStatus.active:
        return r'active';
      case AppointmentStatus.rejected:
        return r'rejected';
      case AppointmentStatus.cancelled:
        return r'cancelled';
      case AppointmentStatus.expired:
        return r'expired';
    }
  }
}

extension AppointmentStatusMapperExtension on AppointmentStatus {
  String toValue() {
    AppointmentStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AppointmentStatus>(this) as String;
  }
}

class AppointmentMapper extends ClassMapperBase<Appointment> {
  AppointmentMapper._();

  static AppointmentMapper? _instance;
  static AppointmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppointmentMapper._());
      ProviderDetailsMapper.ensureInitialized();
      PriceMapper.ensureInitialized();
      AppointmentDetailMapper.ensureInitialized();
      ParticipantDetailMapper.ensureInitialized();
      AppointmentStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Appointment';

  static String _$uid(Appointment v) => v.uid;
  static const Field<Appointment, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$ownerUid(Appointment v) => v.ownerUid;
  static const Field<Appointment, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static String _$providerUid(Appointment v) => v.providerUid;
  static const Field<Appointment, String> _f$providerUid = Field(
    'providerUid',
    _$providerUid,
    opt: true,
    def: '',
  );
  static String _$serviceType(Appointment v) => v.serviceType;
  static const Field<Appointment, String> _f$serviceType = Field(
    'serviceType',
    _$serviceType,
    opt: true,
    def: '',
  );
  static ProviderDetails? _$provider(Appointment v) => v.provider;
  static const Field<Appointment, ProviderDetails> _f$provider = Field(
    'provider',
    _$provider,
    opt: true,
  );
  static Price? _$price(Appointment v) => v.price;
  static const Field<Appointment, Price> _f$price = Field(
    'price',
    _$price,
    opt: true,
  );
  static AppointmentDetail _$appointmentDetails(Appointment v) =>
      v.appointmentDetails;
  static const Field<Appointment, AppointmentDetail> _f$appointmentDetails =
      Field(
    'appointmentDetails',
    _$appointmentDetails,
    opt: true,
    def: const AppointmentDetail(),
  );
  static ParticipantDetail _$participantDetails(Appointment v) =>
      v.participantDetails;
  static const Field<Appointment, ParticipantDetail> _f$participantDetails =
      Field(
    'participantDetails',
    _$participantDetails,
    opt: true,
    def: const ParticipantDetail(),
  );
  static AppointmentStatus _$status(Appointment v) => v.status;
  static const Field<Appointment, AppointmentStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: AppointmentStatus.pending,
  );
  static String _$createdAt(Appointment v) => v.createdAt;
  static const Field<Appointment, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
    def: '',
  );
  static String _$updatedAt(Appointment v) => v.updatedAt;
  static const Field<Appointment, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
    def: '',
  );
  static String _$additionalNotes(Appointment v) => v.additionalNotes;
  static const Field<Appointment, String> _f$additionalNotes = Field(
    'additionalNotes',
    _$additionalNotes,
    opt: true,
    def: '',
  );
  static String _$cancellationReason(Appointment v) => v.cancellationReason;
  static const Field<Appointment, String> _f$cancellationReason = Field(
    'cancellationReason',
    _$cancellationReason,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<Appointment> fields = const {
    #uid: _f$uid,
    #ownerUid: _f$ownerUid,
    #providerUid: _f$providerUid,
    #serviceType: _f$serviceType,
    #provider: _f$provider,
    #price: _f$price,
    #appointmentDetails: _f$appointmentDetails,
    #participantDetails: _f$participantDetails,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #additionalNotes: _f$additionalNotes,
    #cancellationReason: _f$cancellationReason,
  };

  static Appointment _instantiate(DecodingData data) {
    return Appointment(
      uid: data.dec(_f$uid),
      ownerUid: data.dec(_f$ownerUid),
      providerUid: data.dec(_f$providerUid),
      serviceType: data.dec(_f$serviceType),
      provider: data.dec(_f$provider),
      price: data.dec(_f$price),
      appointmentDetails: data.dec(_f$appointmentDetails),
      participantDetails: data.dec(_f$participantDetails),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      additionalNotes: data.dec(_f$additionalNotes),
      cancellationReason: data.dec(_f$cancellationReason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Appointment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Appointment>(map);
  }

  static Appointment fromJson(String json) {
    return ensureInitialized().decodeJson<Appointment>(json);
  }
}

mixin AppointmentMappable {
  String toJson() {
    return AppointmentMapper.ensureInitialized().encodeJson<Appointment>(
      this as Appointment,
    );
  }

  Map<String, dynamic> toMap() {
    return AppointmentMapper.ensureInitialized().encodeMap<Appointment>(
      this as Appointment,
    );
  }

  AppointmentCopyWith<Appointment, Appointment, Appointment> get copyWith =>
      _AppointmentCopyWithImpl<Appointment, Appointment>(
        this as Appointment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppointmentMapper.ensureInitialized().stringifyValue(
      this as Appointment,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppointmentMapper.ensureInitialized().equalsValue(
      this as Appointment,
      other,
    );
  }

  @override
  int get hashCode {
    return AppointmentMapper.ensureInitialized().hashValue(this as Appointment);
  }
}

extension AppointmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Appointment, $Out> {
  AppointmentCopyWith<$R, Appointment, $Out> get $asAppointment =>
      $base.as((v, t, t2) => _AppointmentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppointmentCopyWith<$R, $In extends Appointment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ProviderDetailsCopyWith<$R, ProviderDetails, ProviderDetails>? get provider;
  PriceCopyWith<$R, Price, Price>? get price;
  AppointmentDetailCopyWith<$R, AppointmentDetail, AppointmentDetail>
      get appointmentDetails;
  ParticipantDetailCopyWith<$R, ParticipantDetail, ParticipantDetail>
      get participantDetails;
  $R call({
    String? uid,
    String? ownerUid,
    String? providerUid,
    String? serviceType,
    ProviderDetails? provider,
    Price? price,
    AppointmentDetail? appointmentDetails,
    ParticipantDetail? participantDetails,
    AppointmentStatus? status,
    String? createdAt,
    String? updatedAt,
    String? additionalNotes,
    String? cancellationReason,
  });
  AppointmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppointmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Appointment, $Out>
    implements AppointmentCopyWith<$R, Appointment, $Out> {
  _AppointmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Appointment> $mapper =
      AppointmentMapper.ensureInitialized();
  @override
  ProviderDetailsCopyWith<$R, ProviderDetails, ProviderDetails>? get provider =>
      $value.provider?.copyWith.$chain((v) => call(provider: v));
  @override
  PriceCopyWith<$R, Price, Price>? get price =>
      $value.price?.copyWith.$chain((v) => call(price: v));
  @override
  AppointmentDetailCopyWith<$R, AppointmentDetail, AppointmentDetail>
      get appointmentDetails => $value.appointmentDetails.copyWith.$chain(
            (v) => call(appointmentDetails: v),
          );
  @override
  ParticipantDetailCopyWith<$R, ParticipantDetail, ParticipantDetail>
      get participantDetails => $value.participantDetails.copyWith.$chain(
            (v) => call(participantDetails: v),
          );
  @override
  $R call({
    String? uid,
    String? ownerUid,
    String? providerUid,
    String? serviceType,
    Object? provider = $none,
    Object? price = $none,
    AppointmentDetail? appointmentDetails,
    ParticipantDetail? participantDetails,
    AppointmentStatus? status,
    String? createdAt,
    String? updatedAt,
    String? additionalNotes,
    String? cancellationReason,
  }) =>
      $apply(
        FieldCopyWithData({
          if (uid != null) #uid: uid,
          if (ownerUid != null) #ownerUid: ownerUid,
          if (providerUid != null) #providerUid: providerUid,
          if (serviceType != null) #serviceType: serviceType,
          if (provider != $none) #provider: provider,
          if (price != $none) #price: price,
          if (appointmentDetails != null)
            #appointmentDetails: appointmentDetails,
          if (participantDetails != null)
            #participantDetails: participantDetails,
          if (status != null) #status: status,
          if (createdAt != null) #createdAt: createdAt,
          if (updatedAt != null) #updatedAt: updatedAt,
          if (additionalNotes != null) #additionalNotes: additionalNotes,
          if (cancellationReason != null)
            #cancellationReason: cancellationReason,
        }),
      );
  @override
  Appointment $make(CopyWithData data) => Appointment(
        uid: data.get(#uid, or: $value.uid),
        ownerUid: data.get(#ownerUid, or: $value.ownerUid),
        providerUid: data.get(#providerUid, or: $value.providerUid),
        serviceType: data.get(#serviceType, or: $value.serviceType),
        provider: data.get(#provider, or: $value.provider),
        price: data.get(#price, or: $value.price),
        appointmentDetails: data.get(
          #appointmentDetails,
          or: $value.appointmentDetails,
        ),
        participantDetails: data.get(
          #participantDetails,
          or: $value.participantDetails,
        ),
        status: data.get(#status, or: $value.status),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        updatedAt: data.get(#updatedAt, or: $value.updatedAt),
        additionalNotes: data.get(#additionalNotes, or: $value.additionalNotes),
        cancellationReason: data.get(
          #cancellationReason,
          or: $value.cancellationReason,
        ),
      );

  @override
  AppointmentCopyWith<$R2, Appointment, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _AppointmentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
