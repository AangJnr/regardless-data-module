// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'accounts.dart';

class AccountsMapper extends ClassMapperBase<Accounts> {
  AccountsMapper._();

  static AccountsMapper? _instance;
  static AccountsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountsMapper._());
      AUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Accounts';

  static List<AUser> _$profiles(Accounts v) => v.profiles;
  static const Field<Accounts, List<AUser>> _f$profiles = Field(
    'profiles',
    _$profiles,
    opt: true,
    def: const [],
  );
  static bool _$canAddMore(Accounts v) => v.canAddMore;
  static const Field<Accounts, bool> _f$canAddMore = Field(
    'canAddMore',
    _$canAddMore,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<Accounts> fields = const {
    #profiles: _f$profiles,
    #canAddMore: _f$canAddMore,
  };

  static Accounts _instantiate(DecodingData data) {
    return Accounts(
      profiles: data.dec(_f$profiles),
      canAddMore: data.dec(_f$canAddMore),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Accounts fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Accounts>(map);
  }

  static Accounts fromJson(String json) {
    return ensureInitialized().decodeJson<Accounts>(json);
  }
}

mixin AccountsMappable {
  String toJson() {
    return AccountsMapper.ensureInitialized().encodeJson<Accounts>(
      this as Accounts,
    );
  }

  Map<String, dynamic> toMap() {
    return AccountsMapper.ensureInitialized().encodeMap<Accounts>(
      this as Accounts,
    );
  }

  AccountsCopyWith<Accounts, Accounts, Accounts> get copyWith =>
      _AccountsCopyWithImpl<Accounts, Accounts>(
        this as Accounts,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AccountsMapper.ensureInitialized().stringifyValue(this as Accounts);
  }

  @override
  bool operator ==(Object other) {
    return AccountsMapper.ensureInitialized().equalsValue(
      this as Accounts,
      other,
    );
  }

  @override
  int get hashCode {
    return AccountsMapper.ensureInitialized().hashValue(this as Accounts);
  }
}

extension AccountsValueCopy<$R, $Out> on ObjectCopyWith<$R, Accounts, $Out> {
  AccountsCopyWith<$R, Accounts, $Out> get $asAccounts =>
      $base.as((v, t, t2) => _AccountsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AccountsCopyWith<$R, $In extends Accounts, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AUser, AUserCopyWith<$R, AUser, AUser>> get profiles;
  $R call({List<AUser>? profiles, bool? canAddMore});
  AccountsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AccountsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Accounts, $Out>
    implements AccountsCopyWith<$R, Accounts, $Out> {
  _AccountsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Accounts> $mapper =
      AccountsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AUser, AUserCopyWith<$R, AUser, AUser>> get profiles =>
      ListCopyWith(
        $value.profiles,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(profiles: v),
      );
  @override
  $R call({List<AUser>? profiles, bool? canAddMore}) => $apply(
    FieldCopyWithData({
      if (profiles != null) #profiles: profiles,
      if (canAddMore != null) #canAddMore: canAddMore,
    }),
  );
  @override
  Accounts $make(CopyWithData data) => Accounts(
    profiles: data.get(#profiles, or: $value.profiles),
    canAddMore: data.get(#canAddMore, or: $value.canAddMore),
  );

  @override
  AccountsCopyWith<$R2, Accounts, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AccountsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

