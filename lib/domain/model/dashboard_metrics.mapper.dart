// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dashboard_metrics.dart';

class DashboardMetricsMapper extends ClassMapperBase<DashboardMetrics> {
  DashboardMetricsMapper._();

  static DashboardMetricsMapper? _instance;
  static DashboardMetricsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DashboardMetricsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DashboardMetrics';

  static int _$eventsCount(DashboardMetrics v) => v.eventsCount;
  static const Field<DashboardMetrics, int> _f$eventsCount = Field(
    'eventsCount',
    _$eventsCount,
    opt: true,
    def: 0,
  );
  static int _$appointmentsCount(DashboardMetrics v) => v.appointmentsCount;
  static const Field<DashboardMetrics, int> _f$appointmentsCount = Field(
    'appointmentsCount',
    _$appointmentsCount,
    opt: true,
    def: 0,
  );
  static int _$notificationsCount(DashboardMetrics v) => v.notificationsCount;
  static const Field<DashboardMetrics, int> _f$notificationsCount = Field(
    'notificationsCount',
    _$notificationsCount,
    opt: true,
    def: 0,
  );
  static int _$communitiesCount(DashboardMetrics v) => v.communitiesCount;
  static const Field<DashboardMetrics, int> _f$communitiesCount = Field(
    'communitiesCount',
    _$communitiesCount,
    opt: true,
    def: 0,
  );
  static int _$servicesCount(DashboardMetrics v) => v.servicesCount;
  static const Field<DashboardMetrics, int> _f$servicesCount = Field(
    'servicesCount',
    _$servicesCount,
    opt: true,
    def: 0,
  );
  static int _$teamsCount(DashboardMetrics v) => v.teamsCount;
  static const Field<DashboardMetrics, int> _f$teamsCount = Field(
    'teamsCount',
    _$teamsCount,
    opt: true,
    def: 0,
  );
  static int _$collaboratorsCount(DashboardMetrics v) => v.collaboratorsCount;
  static const Field<DashboardMetrics, int> _f$collaboratorsCount = Field(
    'collaboratorsCount',
    _$collaboratorsCount,
    opt: true,
    def: 0,
  );
  static int _$mediaCount(DashboardMetrics v) => v.mediaCount;
  static const Field<DashboardMetrics, int> _f$mediaCount = Field(
    'mediaCount',
    _$mediaCount,
    opt: true,
    def: 0,
  );
  static int _$leaguesCount(DashboardMetrics v) => v.leaguesCount;
  static const Field<DashboardMetrics, int> _f$leaguesCount = Field(
    'leaguesCount',
    _$leaguesCount,
    opt: true,
    def: 0,
  );
  static int _$announcementsCount(DashboardMetrics v) => v.announcementsCount;
  static const Field<DashboardMetrics, int> _f$announcementsCount = Field(
    'announcementsCount',
    _$announcementsCount,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<DashboardMetrics> fields = const {
    #eventsCount: _f$eventsCount,
    #appointmentsCount: _f$appointmentsCount,
    #notificationsCount: _f$notificationsCount,
    #communitiesCount: _f$communitiesCount,
    #servicesCount: _f$servicesCount,
    #teamsCount: _f$teamsCount,
    #collaboratorsCount: _f$collaboratorsCount,
    #mediaCount: _f$mediaCount,
    #leaguesCount: _f$leaguesCount,
    #announcementsCount: _f$announcementsCount,
  };

  static DashboardMetrics _instantiate(DecodingData data) {
    return DashboardMetrics(
      eventsCount: data.dec(_f$eventsCount),
      appointmentsCount: data.dec(_f$appointmentsCount),
      notificationsCount: data.dec(_f$notificationsCount),
      communitiesCount: data.dec(_f$communitiesCount),
      servicesCount: data.dec(_f$servicesCount),
      teamsCount: data.dec(_f$teamsCount),
      collaboratorsCount: data.dec(_f$collaboratorsCount),
      mediaCount: data.dec(_f$mediaCount),
      leaguesCount: data.dec(_f$leaguesCount),
      announcementsCount: data.dec(_f$announcementsCount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DashboardMetrics fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DashboardMetrics>(map);
  }

  static DashboardMetrics fromJson(String json) {
    return ensureInitialized().decodeJson<DashboardMetrics>(json);
  }
}

mixin DashboardMetricsMappable {
  String toJson() {
    return DashboardMetricsMapper.ensureInitialized()
        .encodeJson<DashboardMetrics>(this as DashboardMetrics);
  }

  Map<String, dynamic> toMap() {
    return DashboardMetricsMapper.ensureInitialized()
        .encodeMap<DashboardMetrics>(this as DashboardMetrics);
  }

  DashboardMetricsCopyWith<DashboardMetrics, DashboardMetrics, DashboardMetrics>
  get copyWith =>
      _DashboardMetricsCopyWithImpl<DashboardMetrics, DashboardMetrics>(
        this as DashboardMetrics,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DashboardMetricsMapper.ensureInitialized().stringifyValue(
      this as DashboardMetrics,
    );
  }

  @override
  bool operator ==(Object other) {
    return DashboardMetricsMapper.ensureInitialized().equalsValue(
      this as DashboardMetrics,
      other,
    );
  }

  @override
  int get hashCode {
    return DashboardMetricsMapper.ensureInitialized().hashValue(
      this as DashboardMetrics,
    );
  }
}

extension DashboardMetricsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DashboardMetrics, $Out> {
  DashboardMetricsCopyWith<$R, DashboardMetrics, $Out>
  get $asDashboardMetrics =>
      $base.as((v, t, t2) => _DashboardMetricsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DashboardMetricsCopyWith<$R, $In extends DashboardMetrics, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? eventsCount,
    int? appointmentsCount,
    int? notificationsCount,
    int? communitiesCount,
    int? servicesCount,
    int? teamsCount,
    int? collaboratorsCount,
    int? mediaCount,
    int? leaguesCount,
    int? announcementsCount,
  });
  DashboardMetricsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DashboardMetricsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DashboardMetrics, $Out>
    implements DashboardMetricsCopyWith<$R, DashboardMetrics, $Out> {
  _DashboardMetricsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DashboardMetrics> $mapper =
      DashboardMetricsMapper.ensureInitialized();
  @override
  $R call({
    int? eventsCount,
    int? appointmentsCount,
    int? notificationsCount,
    int? communitiesCount,
    int? servicesCount,
    int? teamsCount,
    int? collaboratorsCount,
    int? mediaCount,
    int? leaguesCount,
    int? announcementsCount,
  }) => $apply(
    FieldCopyWithData({
      if (eventsCount != null) #eventsCount: eventsCount,
      if (appointmentsCount != null) #appointmentsCount: appointmentsCount,
      if (notificationsCount != null) #notificationsCount: notificationsCount,
      if (communitiesCount != null) #communitiesCount: communitiesCount,
      if (servicesCount != null) #servicesCount: servicesCount,
      if (teamsCount != null) #teamsCount: teamsCount,
      if (collaboratorsCount != null) #collaboratorsCount: collaboratorsCount,
      if (mediaCount != null) #mediaCount: mediaCount,
      if (leaguesCount != null) #leaguesCount: leaguesCount,
      if (announcementsCount != null) #announcementsCount: announcementsCount,
    }),
  );
  @override
  DashboardMetrics $make(CopyWithData data) => DashboardMetrics(
    eventsCount: data.get(#eventsCount, or: $value.eventsCount),
    appointmentsCount: data.get(
      #appointmentsCount,
      or: $value.appointmentsCount,
    ),
    notificationsCount: data.get(
      #notificationsCount,
      or: $value.notificationsCount,
    ),
    communitiesCount: data.get(#communitiesCount, or: $value.communitiesCount),
    servicesCount: data.get(#servicesCount, or: $value.servicesCount),
    teamsCount: data.get(#teamsCount, or: $value.teamsCount),
    collaboratorsCount: data.get(
      #collaboratorsCount,
      or: $value.collaboratorsCount,
    ),
    mediaCount: data.get(#mediaCount, or: $value.mediaCount),
    leaguesCount: data.get(#leaguesCount, or: $value.leaguesCount),
    announcementsCount: data.get(
      #announcementsCount,
      or: $value.announcementsCount,
    ),
  );

  @override
  DashboardMetricsCopyWith<$R2, DashboardMetrics, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DashboardMetricsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

