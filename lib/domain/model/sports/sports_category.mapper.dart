// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sports_category.dart';

class SportsCategoryMapper extends ClassMapperBase<SportsCategory> {
  SportsCategoryMapper._();

  static SportsCategoryMapper? _instance;
  static SportsCategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SportsCategoryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SportsCategory';

  static String _$uid(SportsCategory v) => v.uid;
  static const Field<SportsCategory, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$name(SportsCategory v) => v.name;
  static const Field<SportsCategory, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static bool _$isActive(SportsCategory v) => v.isActive;
  static const Field<SportsCategory, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
    def: true,
  );
  static String? _$iconUrl(SportsCategory v) => v.iconUrl;
  static const Field<SportsCategory, String> _f$iconUrl = Field(
    'iconUrl',
    _$iconUrl,
    opt: true,
  );
  static String? _$hexColor(SportsCategory v) => v.hexColor;
  static const Field<SportsCategory, String> _f$hexColor = Field(
    'hexColor',
    _$hexColor,
    opt: true,
  );

  @override
  final MappableFields<SportsCategory> fields = const {
    #uid: _f$uid,
    #name: _f$name,
    #isActive: _f$isActive,
    #iconUrl: _f$iconUrl,
    #hexColor: _f$hexColor,
  };

  static SportsCategory _instantiate(DecodingData data) {
    return SportsCategory(
      uid: data.dec(_f$uid),
      name: data.dec(_f$name),
      isActive: data.dec(_f$isActive),
      iconUrl: data.dec(_f$iconUrl),
      hexColor: data.dec(_f$hexColor),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SportsCategory fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SportsCategory>(map);
  }

  static SportsCategory fromJson(String json) {
    return ensureInitialized().decodeJson<SportsCategory>(json);
  }
}

mixin SportsCategoryMappable {
  String toJson() {
    return SportsCategoryMapper.ensureInitialized().encodeJson<SportsCategory>(
      this as SportsCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return SportsCategoryMapper.ensureInitialized().encodeMap<SportsCategory>(
      this as SportsCategory,
    );
  }

  SportsCategoryCopyWith<SportsCategory, SportsCategory, SportsCategory>
  get copyWith => _SportsCategoryCopyWithImpl<SportsCategory, SportsCategory>(
    this as SportsCategory,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SportsCategoryMapper.ensureInitialized().stringifyValue(
      this as SportsCategory,
    );
  }

  @override
  bool operator ==(Object other) {
    return SportsCategoryMapper.ensureInitialized().equalsValue(
      this as SportsCategory,
      other,
    );
  }

  @override
  int get hashCode {
    return SportsCategoryMapper.ensureInitialized().hashValue(
      this as SportsCategory,
    );
  }
}

extension SportsCategoryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SportsCategory, $Out> {
  SportsCategoryCopyWith<$R, SportsCategory, $Out> get $asSportsCategory =>
      $base.as((v, t, t2) => _SportsCategoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SportsCategoryCopyWith<$R, $In extends SportsCategory, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? name,
    bool? isActive,
    String? iconUrl,
    String? hexColor,
  });
  SportsCategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SportsCategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SportsCategory, $Out>
    implements SportsCategoryCopyWith<$R, SportsCategory, $Out> {
  _SportsCategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SportsCategory> $mapper =
      SportsCategoryMapper.ensureInitialized();
  @override
  $R call({
    String? uid,
    String? name,
    bool? isActive,
    Object? iconUrl = $none,
    Object? hexColor = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (name != null) #name: name,
      if (isActive != null) #isActive: isActive,
      if (iconUrl != $none) #iconUrl: iconUrl,
      if (hexColor != $none) #hexColor: hexColor,
    }),
  );
  @override
  SportsCategory $make(CopyWithData data) => SportsCategory(
    uid: data.get(#uid, or: $value.uid),
    name: data.get(#name, or: $value.name),
    isActive: data.get(#isActive, or: $value.isActive),
    iconUrl: data.get(#iconUrl, or: $value.iconUrl),
    hexColor: data.get(#hexColor, or: $value.hexColor),
  );

  @override
  SportsCategoryCopyWith<$R2, SportsCategory, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SportsCategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

