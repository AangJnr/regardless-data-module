class PaymentDetails {
  final String uid;
  final String paymentMethod;
  final String lastPaymentDate;
  final String nextPaymentDue;
  final double amount;
  final String currency;

  const PaymentDetails({
    this.uid = '',
    this.paymentMethod = '',
    this.lastPaymentDate = '',
    this.nextPaymentDue = '',
    this.amount = 0.0,
    this.currency = '',
  });

  @override
  String toString() {
    return 'PaymentDetails(paymentMethod: $paymentMethod, lastPaymentDate: $lastPaymentDate, nextPaymentDue: $nextPaymentDue, amount: $amount, currency: $currency)';
  }

  PaymentDetails copyWith({
    String? paymentMethod,
    String? lastPaymentDate,
    String? nextPaymentDue,
    double? amount,
    String? currency,
  }) {
    return PaymentDetails(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
      nextPaymentDue: nextPaymentDue ?? this.nextPaymentDue,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }
}
