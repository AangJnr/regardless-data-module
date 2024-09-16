import 'dart:convert';

import '../../domain/domain_mapper.dart';
import '../../domain/model/payment_details.dart';

class PaymentDetailsA implements DomainMapper<PaymentDetails> {
  final String? paymentMethod;
  final String? lastPaymentDate;
  final String? nextPaymentDue;
  final double? amount;
  final String? currency;
  final String? uid;

  const PaymentDetailsA({
    this.uid,
    this.paymentMethod,
    this.lastPaymentDate,
    this.nextPaymentDue,
    this.amount,
    this.currency,
  });

  @override
  String toString() {
    return 'PaymentDetails(paymentMethod: $paymentMethod, lastPaymentDate: $lastPaymentDate, nextPaymentDue: $nextPaymentDue, amount: $amount, currency: $currency)';
  }

  factory PaymentDetailsA.fromMap(Map<String, dynamic> data) {
    return PaymentDetailsA(
      uid: data['uid'] as String?,
      paymentMethod: data['payment_method'] as String?,
      lastPaymentDate: data['last_payment_date'] as String?,
      nextPaymentDue: data['next_payment_due'] as String?,
      amount: (data['amount'] as num?)?.toDouble(),
      currency: data['currency'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'payment_method': paymentMethod,
        'last_payment_date': lastPaymentDate,
        'next_payment_due': nextPaymentDue,
        'amount': amount,
        'currency': currency,
        'uid': uid
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentDetailsA].
  factory PaymentDetailsA.fromJson(String data) {
    return PaymentDetailsA.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentDetailsA] to a JSON string.
  String toJson() => json.encode(toMap());

  PaymentDetailsA copyWith({
    String? paymentMethod,
    String? uid,
    String? lastPaymentDate,
    String? nextPaymentDue,
    double? amount,
    String? currency,
  }) {
    return PaymentDetailsA(
      uid: uid ?? this.uid,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
      nextPaymentDue: nextPaymentDue ?? this.nextPaymentDue,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  @override
  PaymentDetails mapToDomain() {
    return PaymentDetails(
      uid: uid ?? '',
      paymentMethod: paymentMethod ?? '',
      lastPaymentDate: lastPaymentDate ?? '',
      nextPaymentDue: nextPaymentDue ?? '',
      amount: amount ?? 0.0,
      currency: currency ?? '',
    );
  }
}
