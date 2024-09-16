import 'dart:convert';

import '../../app/app.logger.dart';
import '../../domain/domain_mapper.dart';

import '../../../domain/model/price.dart';

class PriceApi implements DomainMapper<Price> {
  final String? amount;
  final String? currency;
  final String? type;
  final String? description;

  const PriceApi({this.amount, this.currency, this.type, this.description});

  @override
  String toString() {
    return 'Price(price: $amount, currency: $currency, type: $type)';
  }

  factory PriceApi.fromMap(Map<String, dynamic> data) {
    return PriceApi(
      amount: data['amount'] as String?,
      currency: data['currency'] as String?,
      type: data['type'] as String?,
      description: data['description'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'currency': currency,
        'type': type,
        'description': description
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PriceApi].
  factory PriceApi.fromJson(String data) {
    return PriceApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PriceApi] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Price mapToDomain() => Price(
      amount: double.tryParse(amount ?? '0.0') ?? 0.0,
      currency: currency ?? '',
      type: type ?? '',
      description: description ?? '');
}
