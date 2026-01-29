// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'service.dart';

class ServiceMapper extends ClassMapperBase<Service> {
  ServiceMapper._();

  static ServiceMapper? _instance;
  static ServiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ServiceMapper._());
      PriceMapper.ensureInitialized();
      TimeSlotMapper.ensureInitialized();
      VenueMapper.ensureInitialized();
      AUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Service';

  static DateTime? _$createdAt(Service v) => v.createdAt;
  static const Field<Service, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String _$uid(Service v) => v.uid;
  static const Field<Service, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static List<String> _$keywords(Service v) => v.keywords;
  static const Field<Service, List<String>> _f$keywords = Field(
    'keywords',
    _$keywords,
    opt: true,
    def: const [],
  );
  static List<Price> _$prices(Service v) => v.prices;
  static const Field<Service, List<Price>> _f$prices = Field(
    'prices',
    _$prices,
    opt: true,
    def: const [],
  );
  static String _$name(Service v) => v.name;
  static const Field<Service, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$description(Service v) => v.description;
  static const Field<Service, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static List<TimeSlot> _$timeSlots(Service v) => v.timeSlots;
  static const Field<Service, List<TimeSlot>> _f$timeSlots = Field(
    'timeSlots',
    _$timeSlots,
    opt: true,
    def: const [],
  );
  static Venue _$location(Service v) => v.location;
  static const Field<Service, Venue> _f$location = Field(
    'location',
    _$location,
    opt: true,
    def: const Venue(),
  );
  static String _$ownerUid(Service v) => v.ownerUid;
  static const Field<Service, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static DateTime? _$updatedAt(Service v) => v.updatedAt;
  static const Field<Service, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static bool _$isActive(Service v) => v.isActive;
  static const Field<Service, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
    def: false,
  );
  static String _$categoryUid(Service v) => v.categoryUid;
  static const Field<Service, String> _f$categoryUid = Field(
    'categoryUid',
    _$categoryUid,
    opt: true,
    def: '',
  );
  static AUser? _$provider(Service v) => v.provider;
  static const Field<Service, AUser> _f$provider = Field(
    'provider',
    _$provider,
    opt: true,
  );

  @override
  final MappableFields<Service> fields = const {
    #createdAt: _f$createdAt,
    #uid: _f$uid,
    #keywords: _f$keywords,
    #prices: _f$prices,
    #name: _f$name,
    #description: _f$description,
    #timeSlots: _f$timeSlots,
    #location: _f$location,
    #ownerUid: _f$ownerUid,
    #updatedAt: _f$updatedAt,
    #isActive: _f$isActive,
    #categoryUid: _f$categoryUid,
    #provider: _f$provider,
  };

  static Service _instantiate(DecodingData data) {
    return Service(
      createdAt: data.dec(_f$createdAt),
      uid: data.dec(_f$uid),
      keywords: data.dec(_f$keywords),
      prices: data.dec(_f$prices),
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      timeSlots: data.dec(_f$timeSlots),
      location: data.dec(_f$location),
      ownerUid: data.dec(_f$ownerUid),
      updatedAt: data.dec(_f$updatedAt),
      isActive: data.dec(_f$isActive),
      categoryUid: data.dec(_f$categoryUid),
      provider: data.dec(_f$provider),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Service fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Service>(map);
  }

  static Service fromJson(String json) {
    return ensureInitialized().decodeJson<Service>(json);
  }
}

mixin ServiceMappable {
  String toJson() {
    return ServiceMapper.ensureInitialized().encodeJson<Service>(
      this as Service,
    );
  }

  Map<String, dynamic> toMap() {
    return ServiceMapper.ensureInitialized().encodeMap<Service>(
      this as Service,
    );
  }

  ServiceCopyWith<Service, Service, Service> get copyWith =>
      _ServiceCopyWithImpl<Service, Service>(
        this as Service,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ServiceMapper.ensureInitialized().stringifyValue(this as Service);
  }

  @override
  bool operator ==(Object other) {
    return ServiceMapper.ensureInitialized().equalsValue(
      this as Service,
      other,
    );
  }

  @override
  int get hashCode {
    return ServiceMapper.ensureInitialized().hashValue(this as Service);
  }
}

extension ServiceValueCopy<$R, $Out> on ObjectCopyWith<$R, Service, $Out> {
  ServiceCopyWith<$R, Service, $Out> get $asService =>
      $base.as((v, t, t2) => _ServiceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ServiceCopyWith<$R, $In extends Service, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get keywords;
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices;
  ListCopyWith<$R, TimeSlot, TimeSlotCopyWith<$R, TimeSlot, TimeSlot>>
  get timeSlots;
  VenueCopyWith<$R, Venue, Venue> get location;
  AUserCopyWith<$R, AUser, AUser>? get provider;
  $R call({
    DateTime? createdAt,
    String? uid,
    List<String>? keywords,
    List<Price>? prices,
    String? name,
    String? description,
    List<TimeSlot>? timeSlots,
    Venue? location,
    String? ownerUid,
    DateTime? updatedAt,
    bool? isActive,
    String? categoryUid,
    AUser? provider,
  });
  ServiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ServiceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Service, $Out>
    implements ServiceCopyWith<$R, Service, $Out> {
  _ServiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Service> $mapper =
      ServiceMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get keywords =>
      ListCopyWith(
        $value.keywords,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(keywords: v),
      );
  @override
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices =>
      ListCopyWith(
        $value.prices,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(prices: v),
      );
  @override
  ListCopyWith<$R, TimeSlot, TimeSlotCopyWith<$R, TimeSlot, TimeSlot>>
  get timeSlots => ListCopyWith(
    $value.timeSlots,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(timeSlots: v),
  );
  @override
  VenueCopyWith<$R, Venue, Venue> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  AUserCopyWith<$R, AUser, AUser>? get provider =>
      $value.provider?.copyWith.$chain((v) => call(provider: v));
  @override
  $R call({
    Object? createdAt = $none,
    String? uid,
    List<String>? keywords,
    List<Price>? prices,
    String? name,
    String? description,
    List<TimeSlot>? timeSlots,
    Venue? location,
    String? ownerUid,
    Object? updatedAt = $none,
    bool? isActive,
    String? categoryUid,
    Object? provider = $none,
  }) => $apply(
    FieldCopyWithData({
      if (createdAt != $none) #createdAt: createdAt,
      if (uid != null) #uid: uid,
      if (keywords != null) #keywords: keywords,
      if (prices != null) #prices: prices,
      if (name != null) #name: name,
      if (description != null) #description: description,
      if (timeSlots != null) #timeSlots: timeSlots,
      if (location != null) #location: location,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (isActive != null) #isActive: isActive,
      if (categoryUid != null) #categoryUid: categoryUid,
      if (provider != $none) #provider: provider,
    }),
  );
  @override
  Service $make(CopyWithData data) => Service(
    createdAt: data.get(#createdAt, or: $value.createdAt),
    uid: data.get(#uid, or: $value.uid),
    keywords: data.get(#keywords, or: $value.keywords),
    prices: data.get(#prices, or: $value.prices),
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    timeSlots: data.get(#timeSlots, or: $value.timeSlots),
    location: data.get(#location, or: $value.location),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isActive: data.get(#isActive, or: $value.isActive),
    categoryUid: data.get(#categoryUid, or: $value.categoryUid),
    provider: data.get(#provider, or: $value.provider),
  );

  @override
  ServiceCopyWith<$R2, Service, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ServiceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

