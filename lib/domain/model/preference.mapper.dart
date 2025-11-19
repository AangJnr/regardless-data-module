// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'preference.dart';

class PreferenceMapper extends ClassMapperBase<Preference> {
  PreferenceMapper._();

  static PreferenceMapper? _instance;
  static PreferenceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreferenceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Preference';

  static String _$id(Preference v) => v.id;
  static const Field<Preference, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: '',
  );
  static String _$createdAt(Preference v) => v.createdAt;
  static const Field<Preference, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
    def: '',
  );
  static String _$updatedAt(Preference v) => v.updatedAt;
  static const Field<Preference, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
    def: '',
  );
  static bool _$isActive(Preference v) => v.isActive;
  static const Field<Preference, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
    def: false,
  );
  static bool _$emailNewFeatureAnnouncement(Preference v) =>
      v.emailNewFeatureAnnouncement;
  static const Field<Preference, bool> _f$emailNewFeatureAnnouncement = Field(
    'emailNewFeatureAnnouncement',
    _$emailNewFeatureAnnouncement,
    opt: true,
    def: false,
  );
  static bool _$emailNewsletterWeekly(Preference v) => v.emailNewsletterWeekly;
  static const Field<Preference, bool> _f$emailNewsletterWeekly = Field(
    'emailNewsletterWeekly',
    _$emailNewsletterWeekly,
    opt: true,
    def: false,
  );
  static bool _$emailRecommendations(Preference v) => v.emailRecommendations;
  static const Field<Preference, bool> _f$emailRecommendations = Field(
    'emailRecommendations',
    _$emailRecommendations,
    opt: true,
    def: false,
  );
  static bool _$pushNewFeatureAnnouncement(Preference v) =>
      v.pushNewFeatureAnnouncement;
  static const Field<Preference, bool> _f$pushNewFeatureAnnouncement = Field(
    'pushNewFeatureAnnouncement',
    _$pushNewFeatureAnnouncement,
    opt: true,
    def: false,
  );
  static bool _$pushNewsletterWeekly(Preference v) => v.pushNewsletterWeekly;
  static const Field<Preference, bool> _f$pushNewsletterWeekly = Field(
    'pushNewsletterWeekly',
    _$pushNewsletterWeekly,
    opt: true,
    def: false,
  );
  static bool _$pushRecommendations(Preference v) => v.pushRecommendations;
  static const Field<Preference, bool> _f$pushRecommendations = Field(
    'pushRecommendations',
    _$pushRecommendations,
    opt: true,
    def: false,
  );
  static bool _$pushNotifications(Preference v) => v.pushNotifications;
  static const Field<Preference, bool> _f$pushNotifications = Field(
    'pushNotifications',
    _$pushNotifications,
    opt: true,
    def: false,
  );
  static bool _$emailNotifications(Preference v) => v.emailNotifications;
  static const Field<Preference, bool> _f$emailNotifications = Field(
    'emailNotifications',
    _$emailNotifications,
    opt: true,
    def: false,
  );
  static bool _$smsNotifications(Preference v) => v.smsNotifications;
  static const Field<Preference, bool> _f$smsNotifications = Field(
    'smsNotifications',
    _$smsNotifications,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<Preference> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #isActive: _f$isActive,
    #emailNewFeatureAnnouncement: _f$emailNewFeatureAnnouncement,
    #emailNewsletterWeekly: _f$emailNewsletterWeekly,
    #emailRecommendations: _f$emailRecommendations,
    #pushNewFeatureAnnouncement: _f$pushNewFeatureAnnouncement,
    #pushNewsletterWeekly: _f$pushNewsletterWeekly,
    #pushRecommendations: _f$pushRecommendations,
    #pushNotifications: _f$pushNotifications,
    #emailNotifications: _f$emailNotifications,
    #smsNotifications: _f$smsNotifications,
  };

  static Preference _instantiate(DecodingData data) {
    return Preference(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      isActive: data.dec(_f$isActive),
      emailNewFeatureAnnouncement: data.dec(_f$emailNewFeatureAnnouncement),
      emailNewsletterWeekly: data.dec(_f$emailNewsletterWeekly),
      emailRecommendations: data.dec(_f$emailRecommendations),
      pushNewFeatureAnnouncement: data.dec(_f$pushNewFeatureAnnouncement),
      pushNewsletterWeekly: data.dec(_f$pushNewsletterWeekly),
      pushRecommendations: data.dec(_f$pushRecommendations),
      pushNotifications: data.dec(_f$pushNotifications),
      emailNotifications: data.dec(_f$emailNotifications),
      smsNotifications: data.dec(_f$smsNotifications),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Preference fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Preference>(map);
  }

  static Preference fromJson(String json) {
    return ensureInitialized().decodeJson<Preference>(json);
  }
}

mixin PreferenceMappable {
  String toJson() {
    return PreferenceMapper.ensureInitialized().encodeJson<Preference>(
      this as Preference,
    );
  }

  Map<String, dynamic> toMap() {
    return PreferenceMapper.ensureInitialized().encodeMap<Preference>(
      this as Preference,
    );
  }

  PreferenceCopyWith<Preference, Preference, Preference> get copyWith =>
      _PreferenceCopyWithImpl<Preference, Preference>(
        this as Preference,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PreferenceMapper.ensureInitialized().stringifyValue(
      this as Preference,
    );
  }

  @override
  bool operator ==(Object other) {
    return PreferenceMapper.ensureInitialized().equalsValue(
      this as Preference,
      other,
    );
  }

  @override
  int get hashCode {
    return PreferenceMapper.ensureInitialized().hashValue(this as Preference);
  }
}

extension PreferenceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Preference, $Out> {
  PreferenceCopyWith<$R, Preference, $Out> get $asPreference =>
      $base.as((v, t, t2) => _PreferenceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PreferenceCopyWith<$R, $In extends Preference, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? createdAt,
    String? updatedAt,
    bool? isActive,
    bool? emailNewFeatureAnnouncement,
    bool? emailNewsletterWeekly,
    bool? emailRecommendations,
    bool? pushNewFeatureAnnouncement,
    bool? pushNewsletterWeekly,
    bool? pushRecommendations,
    bool? pushNotifications,
    bool? emailNotifications,
    bool? smsNotifications,
  });
  PreferenceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PreferenceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Preference, $Out>
    implements PreferenceCopyWith<$R, Preference, $Out> {
  _PreferenceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Preference> $mapper =
      PreferenceMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? createdAt,
    String? updatedAt,
    bool? isActive,
    bool? emailNewFeatureAnnouncement,
    bool? emailNewsletterWeekly,
    bool? emailRecommendations,
    bool? pushNewFeatureAnnouncement,
    bool? pushNewsletterWeekly,
    bool? pushRecommendations,
    bool? pushNotifications,
    bool? emailNotifications,
    bool? smsNotifications,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (isActive != null) #isActive: isActive,
      if (emailNewFeatureAnnouncement != null)
        #emailNewFeatureAnnouncement: emailNewFeatureAnnouncement,
      if (emailNewsletterWeekly != null)
        #emailNewsletterWeekly: emailNewsletterWeekly,
      if (emailRecommendations != null)
        #emailRecommendations: emailRecommendations,
      if (pushNewFeatureAnnouncement != null)
        #pushNewFeatureAnnouncement: pushNewFeatureAnnouncement,
      if (pushNewsletterWeekly != null)
        #pushNewsletterWeekly: pushNewsletterWeekly,
      if (pushRecommendations != null)
        #pushRecommendations: pushRecommendations,
      if (pushNotifications != null) #pushNotifications: pushNotifications,
      if (emailNotifications != null) #emailNotifications: emailNotifications,
      if (smsNotifications != null) #smsNotifications: smsNotifications,
    }),
  );
  @override
  Preference $make(CopyWithData data) => Preference(
    id: data.get(#id, or: $value.id),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    isActive: data.get(#isActive, or: $value.isActive),
    emailNewFeatureAnnouncement: data.get(
      #emailNewFeatureAnnouncement,
      or: $value.emailNewFeatureAnnouncement,
    ),
    emailNewsletterWeekly: data.get(
      #emailNewsletterWeekly,
      or: $value.emailNewsletterWeekly,
    ),
    emailRecommendations: data.get(
      #emailRecommendations,
      or: $value.emailRecommendations,
    ),
    pushNewFeatureAnnouncement: data.get(
      #pushNewFeatureAnnouncement,
      or: $value.pushNewFeatureAnnouncement,
    ),
    pushNewsletterWeekly: data.get(
      #pushNewsletterWeekly,
      or: $value.pushNewsletterWeekly,
    ),
    pushRecommendations: data.get(
      #pushRecommendations,
      or: $value.pushRecommendations,
    ),
    pushNotifications: data.get(
      #pushNotifications,
      or: $value.pushNotifications,
    ),
    emailNotifications: data.get(
      #emailNotifications,
      or: $value.emailNotifications,
    ),
    smsNotifications: data.get(#smsNotifications, or: $value.smsNotifications),
  );

  @override
  PreferenceCopyWith<$R2, Preference, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PreferenceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

