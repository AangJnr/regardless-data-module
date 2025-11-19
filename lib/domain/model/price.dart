import 'package:dart_mappable/dart_mappable.dart';

import '../../data/model/price_api.dart';
import '../domain_mapper.dart';

part 'price.mapper.dart';

@MappableClass()
class Price with PriceMappable implements DataMapper<PriceApi> {
  final double amount;
  final String currency;
  final String type;
  final String description;
  final int quantity;

  const Price(
      {this.amount = 0,
      this.currency = '',
      this.type = '',
      this.quantity = 1,
      this.description = ''});

  @override
  String toString() {
    return 'Price(price: $amount, currency: $currency, type: $type)';
  }

  String total() => "${amount * quantity}";

  String getAmount() {
    if (amount == 0) {
      return "Free";
    } else {
      return '$currency $amount';
    }
  }

  String getPrice() {
    return '$currency ${amount.toStringAsFixed(2)}';
  }

  String getDescriptiveAmount() {
    if (amount == 0) {
      return "Free";
    } else {
      return 'Starting from:$currency $amount';
    }
  }

  bool isValid() {
    return type.isNotEmpty;
  }

  @override
  PriceApi mapToApi() => PriceApi(
      amount: amount.toString(),
      currency: currency,
      type: type,
      description: description);
}
