// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_join_request.dart';

class TeamJoinRequestStatusMapper extends EnumMapper<TeamJoinRequestStatus> {
  TeamJoinRequestStatusMapper._();

  static TeamJoinRequestStatusMapper? _instance;
  static TeamJoinRequestStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamJoinRequestStatusMapper._());
    }
    return _instance!;
  }

  static TeamJoinRequestStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TeamJoinRequestStatus decode(dynamic value) {
    switch (value) {
      case r'pending':
        return TeamJoinRequestStatus.pending;
      case r'approved':
        return TeamJoinRequestStatus.approved;
      case r'rejected':
        return TeamJoinRequestStatus.rejected;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TeamJoinRequestStatus self) {
    switch (self) {
      case TeamJoinRequestStatus.pending:
        return r'pending';
      case TeamJoinRequestStatus.approved:
        return r'approved';
      case TeamJoinRequestStatus.rejected:
        return r'rejected';
    }
  }
}

extension TeamJoinRequestStatusMapperExtension on TeamJoinRequestStatus {
  String toValue() {
    TeamJoinRequestStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TeamJoinRequestStatus>(this)
        as String;
  }
}

class TeamJoinRequestMapper extends ClassMapperBase<TeamJoinRequest> {
  TeamJoinRequestMapper._();

  static TeamJoinRequestMapper? _instance;
  static TeamJoinRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamJoinRequestMapper._());
      AUserMapper.ensureInitialized();
      TeamJoinRequestStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamJoinRequest';

  static AUser _$requester(TeamJoinRequest v) => v.requester;
  static const Field<TeamJoinRequest, AUser> _f$requester = Field(
    'requester',
    _$requester,
    opt: true,
    def: const AUser(),
  );
  static DateTime? _$requestedAt(TeamJoinRequest v) => v.requestedAt;
  static const Field<TeamJoinRequest, DateTime> _f$requestedAt = Field(
    'requestedAt',
    _$requestedAt,
    opt: true,
  );
  static TeamJoinRequestStatus _$status(TeamJoinRequest v) => v.status;
  static const Field<TeamJoinRequest, TeamJoinRequestStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: TeamJoinRequestStatus.pending,
  );

  @override
  final MappableFields<TeamJoinRequest> fields = const {
    #requester: _f$requester,
    #requestedAt: _f$requestedAt,
    #status: _f$status,
  };

  static TeamJoinRequest _instantiate(DecodingData data) {
    return TeamJoinRequest(
      requester: data.dec(_f$requester),
      requestedAt: data.dec(_f$requestedAt),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TeamJoinRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamJoinRequest>(map);
  }

  static TeamJoinRequest fromJson(String json) {
    return ensureInitialized().decodeJson<TeamJoinRequest>(json);
  }
}

mixin TeamJoinRequestMappable {
  String toJson() {
    return TeamJoinRequestMapper.ensureInitialized()
        .encodeJson<TeamJoinRequest>(this as TeamJoinRequest);
  }

  Map<String, dynamic> toMap() {
    return TeamJoinRequestMapper.ensureInitialized().encodeMap<TeamJoinRequest>(
      this as TeamJoinRequest,
    );
  }

  TeamJoinRequestCopyWith<TeamJoinRequest, TeamJoinRequest, TeamJoinRequest>
  get copyWith =>
      _TeamJoinRequestCopyWithImpl<TeamJoinRequest, TeamJoinRequest>(
        this as TeamJoinRequest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TeamJoinRequestMapper.ensureInitialized().stringifyValue(
      this as TeamJoinRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return TeamJoinRequestMapper.ensureInitialized().equalsValue(
      this as TeamJoinRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return TeamJoinRequestMapper.ensureInitialized().hashValue(
      this as TeamJoinRequest,
    );
  }
}

extension TeamJoinRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamJoinRequest, $Out> {
  TeamJoinRequestCopyWith<$R, TeamJoinRequest, $Out> get $asTeamJoinRequest =>
      $base.as((v, t, t2) => _TeamJoinRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamJoinRequestCopyWith<$R, $In extends TeamJoinRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AUserCopyWith<$R, AUser, AUser> get requester;
  $R call({
    AUser? requester,
    DateTime? requestedAt,
    TeamJoinRequestStatus? status,
  });
  TeamJoinRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TeamJoinRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamJoinRequest, $Out>
    implements TeamJoinRequestCopyWith<$R, TeamJoinRequest, $Out> {
  _TeamJoinRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamJoinRequest> $mapper =
      TeamJoinRequestMapper.ensureInitialized();
  @override
  AUserCopyWith<$R, AUser, AUser> get requester =>
      $value.requester.copyWith.$chain((v) => call(requester: v));
  @override
  $R call({
    AUser? requester,
    Object? requestedAt = $none,
    TeamJoinRequestStatus? status,
  }) => $apply(
    FieldCopyWithData({
      if (requester != null) #requester: requester,
      if (requestedAt != $none) #requestedAt: requestedAt,
      if (status != null) #status: status,
    }),
  );
  @override
  TeamJoinRequest $make(CopyWithData data) => TeamJoinRequest(
    requester: data.get(#requester, or: $value.requester),
    requestedAt: data.get(#requestedAt, or: $value.requestedAt),
    status: data.get(#status, or: $value.status),
  );

  @override
  TeamJoinRequestCopyWith<$R2, TeamJoinRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TeamJoinRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

