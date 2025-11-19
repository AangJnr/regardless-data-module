// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'venue.dart';

class VenueMapper extends ClassMapperBase<Venue> {
  VenueMapper._();

  static VenueMapper? _instance;
  static VenueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VenueMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Venue';

  static String _$placeId(Venue v) => v.placeId;
  static const Field<Venue, String> _f$placeId = Field(
    'placeId',
    _$placeId,
    opt: true,
    def: '',
  );
  static String _$country(Venue v) => v.country;
  static const Field<Venue, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
    def: "",
  );
  static String _$address(Venue v) => v.address;
  static const Field<Venue, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
    def: "",
  );
  static String _$otherAddress(Venue v) => v.otherAddress;
  static const Field<Venue, String> _f$otherAddress = Field(
    'otherAddress',
    _$otherAddress,
    opt: true,
    def: "",
  );
  static double _$lng(Venue v) => v.lng;
  static const Field<Venue, double> _f$lng = Field(
    'lng',
    _$lng,
    opt: true,
    def: 0.0,
  );
  static String _$city(Venue v) => v.city;
  static const Field<Venue, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
    def: "",
  );
  static String _$countryIso(Venue v) => v.countryIso;
  static const Field<Venue, String> _f$countryIso = Field(
    'countryIso',
    _$countryIso,
    opt: true,
    def: '',
  );
  static String _$name(Venue v) => v.name;
  static const Field<Venue, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: "",
  );
  static String _$state(Venue v) => v.state;
  static const Field<Venue, String> _f$state = Field(
    'state',
    _$state,
    opt: true,
    def: "",
  );
  static double _$lat(Venue v) => v.lat;
  static const Field<Venue, double> _f$lat = Field(
    'lat',
    _$lat,
    opt: true,
    def: -0.0,
  );

  @override
  final MappableFields<Venue> fields = const {
    #placeId: _f$placeId,
    #country: _f$country,
    #address: _f$address,
    #otherAddress: _f$otherAddress,
    #lng: _f$lng,
    #city: _f$city,
    #countryIso: _f$countryIso,
    #name: _f$name,
    #state: _f$state,
    #lat: _f$lat,
  };

  static Venue _instantiate(DecodingData data) {
    return Venue(
      placeId: data.dec(_f$placeId),
      country: data.dec(_f$country),
      address: data.dec(_f$address),
      otherAddress: data.dec(_f$otherAddress),
      lng: data.dec(_f$lng),
      city: data.dec(_f$city),
      countryIso: data.dec(_f$countryIso),
      name: data.dec(_f$name),
      state: data.dec(_f$state),
      lat: data.dec(_f$lat),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Venue fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Venue>(map);
  }

  static Venue fromJson(String json) {
    return ensureInitialized().decodeJson<Venue>(json);
  }
}

mixin VenueMappable {
  String toJson() {
    return VenueMapper.ensureInitialized().encodeJson<Venue>(this as Venue);
  }

  Map<String, dynamic> toMap() {
    return VenueMapper.ensureInitialized().encodeMap<Venue>(this as Venue);
  }

  VenueCopyWith<Venue, Venue, Venue> get copyWith =>
      _VenueCopyWithImpl<Venue, Venue>(this as Venue, $identity, $identity);
  @override
  String toString() {
    return VenueMapper.ensureInitialized().stringifyValue(this as Venue);
  }

  @override
  bool operator ==(Object other) {
    return VenueMapper.ensureInitialized().equalsValue(this as Venue, other);
  }

  @override
  int get hashCode {
    return VenueMapper.ensureInitialized().hashValue(this as Venue);
  }
}

extension VenueValueCopy<$R, $Out> on ObjectCopyWith<$R, Venue, $Out> {
  VenueCopyWith<$R, Venue, $Out> get $asVenue =>
      $base.as((v, t, t2) => _VenueCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VenueCopyWith<$R, $In extends Venue, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? placeId,
    String? country,
    String? address,
    String? otherAddress,
    double? lng,
    String? city,
    String? countryIso,
    String? name,
    String? state,
    double? lat,
  });
  VenueCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VenueCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Venue, $Out>
    implements VenueCopyWith<$R, Venue, $Out> {
  _VenueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Venue> $mapper = VenueMapper.ensureInitialized();
  @override
  $R call({
    String? placeId,
    String? country,
    String? address,
    String? otherAddress,
    double? lng,
    String? city,
    String? countryIso,
    String? name,
    String? state,
    double? lat,
  }) => $apply(
    FieldCopyWithData({
      if (placeId != null) #placeId: placeId,
      if (country != null) #country: country,
      if (address != null) #address: address,
      if (otherAddress != null) #otherAddress: otherAddress,
      if (lng != null) #lng: lng,
      if (city != null) #city: city,
      if (countryIso != null) #countryIso: countryIso,
      if (name != null) #name: name,
      if (state != null) #state: state,
      if (lat != null) #lat: lat,
    }),
  );
  @override
  Venue $make(CopyWithData data) => Venue(
    placeId: data.get(#placeId, or: $value.placeId),
    country: data.get(#country, or: $value.country),
    address: data.get(#address, or: $value.address),
    otherAddress: data.get(#otherAddress, or: $value.otherAddress),
    lng: data.get(#lng, or: $value.lng),
    city: data.get(#city, or: $value.city),
    countryIso: data.get(#countryIso, or: $value.countryIso),
    name: data.get(#name, or: $value.name),
    state: data.get(#state, or: $value.state),
    lat: data.get(#lat, or: $value.lat),
  );

  @override
  VenueCopyWith<$R2, Venue, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VenueCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

