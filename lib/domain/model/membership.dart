import 'package:collection/collection.dart';

import 'category.dart';
import 'user.dart';
import 'payment_details.dart';

class Membership {
  final String uid;
  final String subscriptionUid;
  final AUser user;
  final String membershipType;
  final String startDate;
  final String endDate;
  final String status;
  final List<String> benefits;
  final PaymentDetails paymentDetails;
  final String notes;
  final Category category;

  const Membership(
      {this.uid = '',
      this.subscriptionUid = '',
      this.user = const AUser(),
      this.membershipType = '',
      this.startDate = '',
      this.endDate = '',
      this.status = '',
      this.benefits = const [],
      this.paymentDetails = const PaymentDetails(),
      this.notes = '',
      this.category = const Category()});

  @override
  String toString() {
    return 'MembershipA(membershipUid: $uid, subscriptionUid: $subscriptionUid, user: $user, membershipType: $membershipType, startDate: $startDate, endDate: $endDate, status: $status, benefits: $benefits, paymentDetails: $paymentDetails, notes: $notes)';
  }

  Membership copyWith(
      {String? uid,
      String? subscriptionUid,
      AUser? user,
      String? membershipType,
      String? startDate,
      String? endDate,
      String? status,
      List<String>? benefits,
      PaymentDetails? paymentDetails,
      String? notes,
      Category? category}) {
    return Membership(
        uid: uid ?? this.uid,
        subscriptionUid: subscriptionUid ?? this.subscriptionUid,
        user: user ?? this.user,
        membershipType: membershipType ?? this.membershipType,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        benefits: benefits ?? this.benefits,
        paymentDetails: paymentDetails ?? this.paymentDetails,
        notes: notes ?? this.notes,
        category: category ?? this.category);
  }

  String getBenefits() => (benefits.isNotEmpty)
      ? "Included: ${benefits.reduceIndexed((index, previous, element) => '$previous, $element').trim()}"
      : '';
}
