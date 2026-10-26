// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_and_join_requests.dart';

class TeamAndJoinRequestsMapper extends ClassMapperBase<TeamAndJoinRequests> {
  TeamAndJoinRequestsMapper._();

  static TeamAndJoinRequestsMapper? _instance;
  static TeamAndJoinRequestsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamAndJoinRequestsMapper._());
      TeamMapper.ensureInitialized();
      TeamJoinRequestMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamAndJoinRequests';

  static Team _$team(TeamAndJoinRequests v) => v.team;
  static const Field<TeamAndJoinRequests, Team> _f$team = Field(
    'team',
    _$team,
    opt: true,
    def: const Team(),
  );
  static List<TeamJoinRequest> _$requests(TeamAndJoinRequests v) => v.requests;
  static const Field<TeamAndJoinRequests, List<TeamJoinRequest>> _f$requests =
      Field('requests', _$requests, opt: true, def: const []);

  @override
  final MappableFields<TeamAndJoinRequests> fields = const {
    #team: _f$team,
    #requests: _f$requests,
  };

  static TeamAndJoinRequests _instantiate(DecodingData data) {
    return TeamAndJoinRequests(
      team: data.dec(_f$team),
      requests: data.dec(_f$requests),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TeamAndJoinRequests fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamAndJoinRequests>(map);
  }

  static TeamAndJoinRequests fromJson(String json) {
    return ensureInitialized().decodeJson<TeamAndJoinRequests>(json);
  }
}

mixin TeamAndJoinRequestsMappable {
  String toJson() {
    return TeamAndJoinRequestsMapper.ensureInitialized()
        .encodeJson<TeamAndJoinRequests>(this as TeamAndJoinRequests);
  }

  Map<String, dynamic> toMap() {
    return TeamAndJoinRequestsMapper.ensureInitialized()
        .encodeMap<TeamAndJoinRequests>(this as TeamAndJoinRequests);
  }

  TeamAndJoinRequestsCopyWith<
    TeamAndJoinRequests,
    TeamAndJoinRequests,
    TeamAndJoinRequests
  >
  get copyWith =>
      _TeamAndJoinRequestsCopyWithImpl<
        TeamAndJoinRequests,
        TeamAndJoinRequests
      >(this as TeamAndJoinRequests, $identity, $identity);
  @override
  String toString() {
    return TeamAndJoinRequestsMapper.ensureInitialized().stringifyValue(
      this as TeamAndJoinRequests,
    );
  }

  @override
  bool operator ==(Object other) {
    return TeamAndJoinRequestsMapper.ensureInitialized().equalsValue(
      this as TeamAndJoinRequests,
      other,
    );
  }

  @override
  int get hashCode {
    return TeamAndJoinRequestsMapper.ensureInitialized().hashValue(
      this as TeamAndJoinRequests,
    );
  }
}

extension TeamAndJoinRequestsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamAndJoinRequests, $Out> {
  TeamAndJoinRequestsCopyWith<$R, TeamAndJoinRequests, $Out>
  get $asTeamAndJoinRequests => $base.as(
    (v, t, t2) => _TeamAndJoinRequestsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TeamAndJoinRequestsCopyWith<
  $R,
  $In extends TeamAndJoinRequests,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  TeamCopyWith<$R, Team, Team> get team;
  ListCopyWith<
    $R,
    TeamJoinRequest,
    TeamJoinRequestCopyWith<$R, TeamJoinRequest, TeamJoinRequest>
  >
  get requests;
  $R call({Team? team, List<TeamJoinRequest>? requests});
  TeamAndJoinRequestsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TeamAndJoinRequestsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamAndJoinRequests, $Out>
    implements TeamAndJoinRequestsCopyWith<$R, TeamAndJoinRequests, $Out> {
  _TeamAndJoinRequestsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamAndJoinRequests> $mapper =
      TeamAndJoinRequestsMapper.ensureInitialized();
  @override
  TeamCopyWith<$R, Team, Team> get team =>
      $value.team.copyWith.$chain((v) => call(team: v));
  @override
  ListCopyWith<
    $R,
    TeamJoinRequest,
    TeamJoinRequestCopyWith<$R, TeamJoinRequest, TeamJoinRequest>
  >
  get requests => ListCopyWith(
    $value.requests,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(requests: v),
  );
  @override
  $R call({Team? team, List<TeamJoinRequest>? requests}) => $apply(
    FieldCopyWithData({
      if (team != null) #team: team,
      if (requests != null) #requests: requests,
    }),
  );
  @override
  TeamAndJoinRequests $make(CopyWithData data) => TeamAndJoinRequests(
    team: data.get(#team, or: $value.team),
    requests: data.get(#requests, or: $value.requests),
  );

  @override
  TeamAndJoinRequestsCopyWith<$R2, TeamAndJoinRequests, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TeamAndJoinRequestsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

