// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'community_settings.dart';

class CommunitySettingsMapper extends ClassMapperBase<CommunitySettings> {
  CommunitySettingsMapper._();

  static CommunitySettingsMapper? _instance;
  static CommunitySettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommunitySettingsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CommunitySettings';

  static bool _$isPublic(CommunitySettings v) => v.isPublic;
  static const Field<CommunitySettings, bool> _f$isPublic = Field(
    'isPublic',
    _$isPublic,
    opt: true,
    def: true,
  );
  static bool _$allowComments(CommunitySettings v) => v.allowComments;
  static const Field<CommunitySettings, bool> _f$allowComments = Field(
    'allowComments',
    _$allowComments,
    opt: true,
    def: true,
  );
  static int _$maxMembers(CommunitySettings v) => v.maxMembers;
  static const Field<CommunitySettings, int> _f$maxMembers = Field(
    'maxMembers',
    _$maxMembers,
    opt: true,
    def: 100,
  );

  @override
  final MappableFields<CommunitySettings> fields = const {
    #isPublic: _f$isPublic,
    #allowComments: _f$allowComments,
    #maxMembers: _f$maxMembers,
  };

  static CommunitySettings _instantiate(DecodingData data) {
    return CommunitySettings(
      isPublic: data.dec(_f$isPublic),
      allowComments: data.dec(_f$allowComments),
      maxMembers: data.dec(_f$maxMembers),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CommunitySettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CommunitySettings>(map);
  }

  static CommunitySettings fromJson(String json) {
    return ensureInitialized().decodeJson<CommunitySettings>(json);
  }
}

mixin CommunitySettingsMappable {
  String toJson() {
    return CommunitySettingsMapper.ensureInitialized()
        .encodeJson<CommunitySettings>(this as CommunitySettings);
  }

  Map<String, dynamic> toMap() {
    return CommunitySettingsMapper.ensureInitialized()
        .encodeMap<CommunitySettings>(this as CommunitySettings);
  }

  CommunitySettingsCopyWith<
    CommunitySettings,
    CommunitySettings,
    CommunitySettings
  >
  get copyWith =>
      _CommunitySettingsCopyWithImpl<CommunitySettings, CommunitySettings>(
        this as CommunitySettings,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CommunitySettingsMapper.ensureInitialized().stringifyValue(
      this as CommunitySettings,
    );
  }

  @override
  bool operator ==(Object other) {
    return CommunitySettingsMapper.ensureInitialized().equalsValue(
      this as CommunitySettings,
      other,
    );
  }

  @override
  int get hashCode {
    return CommunitySettingsMapper.ensureInitialized().hashValue(
      this as CommunitySettings,
    );
  }
}

extension CommunitySettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CommunitySettings, $Out> {
  CommunitySettingsCopyWith<$R, CommunitySettings, $Out>
  get $asCommunitySettings => $base.as(
    (v, t, t2) => _CommunitySettingsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CommunitySettingsCopyWith<
  $R,
  $In extends CommunitySettings,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? isPublic, bool? allowComments, int? maxMembers});
  CommunitySettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CommunitySettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CommunitySettings, $Out>
    implements CommunitySettingsCopyWith<$R, CommunitySettings, $Out> {
  _CommunitySettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CommunitySettings> $mapper =
      CommunitySettingsMapper.ensureInitialized();
  @override
  $R call({bool? isPublic, bool? allowComments, int? maxMembers}) => $apply(
    FieldCopyWithData({
      if (isPublic != null) #isPublic: isPublic,
      if (allowComments != null) #allowComments: allowComments,
      if (maxMembers != null) #maxMembers: maxMembers,
    }),
  );
  @override
  CommunitySettings $make(CopyWithData data) => CommunitySettings(
    isPublic: data.get(#isPublic, or: $value.isPublic),
    allowComments: data.get(#allowComments, or: $value.allowComments),
    maxMembers: data.get(#maxMembers, or: $value.maxMembers),
  );

  @override
  CommunitySettingsCopyWith<$R2, CommunitySettings, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CommunitySettingsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

