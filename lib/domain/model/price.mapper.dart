// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'price.dart';

class PriceMapper extends ClassMapperBase<Price> {
  PriceMapper._();

  static PriceMapper? _instance;
  static PriceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PriceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Price';

  static double _$amount(Price v) => v.amount;
  static const Field<Price, double> _f$amount = Field(
    'amount',
    _$amount,
    opt: true,
    def: 0,
  );
  static String _$currency(Price v) => v.currency;
  static const Field<Price, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
    def: '',
  );
  static String _$type(Price v) => v.type;
  static const Field<Price, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: '',
  );
  static int _$quantity(Price v) => v.quantity;
  static const Field<Price, int> _f$quantity = Field(
    'quantity',
    _$quantity,
    opt: true,
    def: 1,
  );
  static String _$description(Price v) => v.description;
  static const Field<Price, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<Price> fields = const {
    #amount: _f$amount,
    #currency: _f$currency,
    #type: _f$type,
    #quantity: _f$quantity,
    #description: _f$description,
  };

  static Price _instantiate(DecodingData data) {
    return Price(
      amount: data.dec(_f$amount),
      currency: data.dec(_f$currency),
      type: data.dec(_f$type),
      quantity: data.dec(_f$quantity),
      description: data.dec(_f$description),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Price fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Price>(map);
  }

  static Price fromJson(String json) {
    return ensureInitialized().decodeJson<Price>(json);
  }
}

mixin PriceMappable {
  String toJson() {
    return PriceMapper.ensureInitialized().encodeJson<Price>(this as Price);
  }

  Map<String, dynamic> toMap() {
    return PriceMapper.ensureInitialized().encodeMap<Price>(this as Price);
  }

  PriceCopyWith<Price, Price, Price> get copyWith =>
      _PriceCopyWithImpl<Price, Price>(this as Price, $identity, $identity);
  @override
  String toString() {
    return PriceMapper.ensureInitialized().stringifyValue(this as Price);
  }

  @override
  bool operator ==(Object other) {
    return PriceMapper.ensureInitialized().equalsValue(this as Price, other);
  }

  @override
  int get hashCode {
    return PriceMapper.ensureInitialized().hashValue(this as Price);
  }
}

extension PriceValueCopy<$R, $Out> on ObjectCopyWith<$R, Price, $Out> {
  PriceCopyWith<$R, Price, $Out> get $asPrice =>
      $base.as((v, t, t2) => _PriceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PriceCopyWith<$R, $In extends Price, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    double? amount,
    String? currency,
    String? type,
    int? quantity,
    String? description,
  });
  PriceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PriceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Price, $Out>
    implements PriceCopyWith<$R, Price, $Out> {
  _PriceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Price> $mapper = PriceMapper.ensureInitialized();
  @override
  $R call({
    double? amount,
    String? currency,
    String? type,
    int? quantity,
    String? description,
  }) => $apply(
    FieldCopyWithData({
      if (amount != null) #amount: amount,
      if (currency != null) #currency: currency,
      if (type != null) #type: type,
      if (quantity != null) #quantity: quantity,
      if (description != null) #description: description,
    }),
  );
  @override
  Price $make(CopyWithData data) => Price(
    amount: data.get(#amount, or: $value.amount),
    currency: data.get(#currency, or: $value.currency),
    type: data.get(#type, or: $value.type),
    quantity: data.get(#quantity, or: $value.quantity),
    description: data.get(#description, or: $value.description),
  );

  @override
  PriceCopyWith<$R2, Price, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PriceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

