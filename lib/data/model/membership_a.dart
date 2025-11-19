import 'dart:convert';

import '../../domain/domain_mapper.dart';
import '../../domain/model/category.dart';
import '../../domain/model/membership.dart';
import '../../domain/model/payment_details.dart';
import '../../domain/model/user.dart';
import 'payment_details_a.dart';

class MembershipA implements DomainMapper<Membership> {
  final String? uid;
  final String? subscriptionUid;
  final AUser? user;
  final String? membershipType;
  final String? startDate;
  final String? endDate;
  final String? status;
  final List<String>? benefits;
  final PaymentDetailsA? paymentDetails;
  final String? notes;
  final Category? category;

  const MembershipA(
      {this.uid,
      this.subscriptionUid,
      this.user,
      this.membershipType,
      this.startDate,
      this.endDate,
      this.status,
      this.benefits,
      this.paymentDetails,
      this.notes,
      this.category});

  @override
  String toString() {
    return 'MembershipA(membershipUid: $uid, subscriptionUid: $subscriptionUid, user: $user, membershipType: $membershipType, startDate: $startDate, endDate: $endDate, status: $status, benefits: $benefits, paymentDetails: $paymentDetails, notes: $notes)';
  }

  factory MembershipA.fromMap(Map<String, dynamic> data) => MembershipA(
        uid: data['uid'] as String?,
        subscriptionUid: data['subscription_uid'] as String?,
        category: data['category'] == null
            ? null
            : CategoryMapper.fromMap(data['category']),
        user: data['user'] == null
            ? null
            : AUserMapper.fromMap(data['user'] as Map<String, dynamic>),
        membershipType: data['membership_type'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        status: data['status'] as String?,
        benefits: data['benefits'] as List<String>?,
        paymentDetails: data['payment_details'] == null
            ? null
            : PaymentDetailsA.fromMap(
                data['payment_details'] as Map<String, dynamic>),
        notes: data['notes'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'subscription_uid': subscriptionUid,
        'user': user?.toMap(),
        'membership_type': membershipType,
        'start_date': startDate,
        'end_date': endDate,
        'status': status,
        'benefits': benefits,
        'payment_details': paymentDetails?.toMap(),
        'notes': notes,
        'category': category?.toMap()
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MembershipA].
  factory MembershipA.fromJson(String data) {
    return MembershipA.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MembershipA] to a JSON string.
  String toJson() => json.encode(toMap());

  MembershipA copyWith(
      {String? uid,
      String? subscriptionUid,
      AUser? user,
      String? membershipType,
      String? startDate,
      String? endDate,
      String? status,
      List<String>? benefits,
      PaymentDetailsA? paymentDetails,
      String? notes,
      Category? category}) {
    return MembershipA(
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

  @override
  Membership mapToDomain() {
    return Membership(
        uid: uid ?? '',
        subscriptionUid: subscriptionUid ?? '',
        user: user ?? const AUser(),
        membershipType: membershipType ?? '',
        startDate: startDate ?? '',
        endDate: endDate ?? '',
        status: status ?? '',
        benefits: benefits ?? [],
        paymentDetails: paymentDetails?.mapToDomain() ?? const PaymentDetails(),
        notes: notes ?? '',
        category: category ?? const Category());
  }
}
