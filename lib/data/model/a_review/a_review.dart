import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/review/response.dart';
import '../../../domain/model/review/review.dart';
import '../../../domain/model/review/reviewer.dart';
import 'a_response.dart';
import 'a_reviewer.dart';

class AReview implements DomainMapper<Review> {
  final String? reviewUid;
  final String? productId;
  final AReviewer? reviewer;
  final double? rating;
  final String? title;
  final String? comment;
  final String? date;
  final int? helpfulVotes;
  final bool? verifiedPurchase;
  final List<String>? images;
  final AResponse? response;

  const AReview({
    this.reviewUid,
    this.productId,
    this.reviewer,
    this.rating,
    this.title,
    this.comment,
    this.date,
    this.helpfulVotes,
    this.verifiedPurchase,
    this.images,
    this.response,
  });

  @override
  String toString() {
    return 'AReview(reviewId: $reviewUid, productId: $productId, reviewer: $reviewer, rating: $rating, title: $title, comment: $comment, date: $date, helpfulVotes: $helpfulVotes, verifiedPurchase: $verifiedPurchase, images: $images, response: $response)';
  }

  factory AReview.fromMap(Map<String, dynamic> data) => AReview(
        reviewUid: data['review_uid'] as String?,
        productId: data['product_uid'] as String?,
        reviewer: data['reviewer'] == null
            ? null
            : AReviewer.fromMap(data['reviewer'] as Map<String, dynamic>),
        rating: (data['rating'] as num?)?.toDouble(),
        title: data['title'] as String?,
        comment: data['comment'] as String?,
        date: data['date'] as String?,
        helpfulVotes: data['helpful_votes'] as int?,
        verifiedPurchase: data['verified_purchase'] as bool?,
        images: data['images'] as List<String>?,
        response: data['response'] == null
            ? null
            : AResponse.fromMap(data['response'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'review_uid': reviewUid,
        'product_id': productId,
        'reviewer': reviewer?.toMap(),
        'rating': rating,
        'title': title,
        'comment': comment,
        'date': date,
        'helpful_votes': helpfulVotes,
        'verified_purchase': verifiedPurchase,
        'images': images,
        'response': response?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AReview].
  factory AReview.fromJson(String data) {
    return AReview.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AReview] to a JSON string.
  String toJson() => json.encode(toMap());

  AReview copyWith({
    String? reviewUid,
    String? productId,
    AReviewer? reviewer,
    double? rating,
    String? title,
    String? comment,
    String? date,
    int? helpfulVotes,
    bool? verifiedPurchase,
    List<String>? images,
    AResponse? response,
  }) {
    return AReview(
      reviewUid: reviewUid ?? this.reviewUid,
      productId: productId ?? this.productId,
      reviewer: reviewer ?? this.reviewer,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      helpfulVotes: helpfulVotes ?? this.helpfulVotes,
      verifiedPurchase: verifiedPurchase ?? this.verifiedPurchase,
      images: images ?? this.images,
      response: response ?? this.response,
    );
  }

  @override
  Review mapToDomain() {
    return Review(
      reviewUid: reviewUid ?? '',
      productId: productId ?? '',
      reviewer: reviewer?.mapToDomain() ?? const Reviewer(),
      rating: rating ?? 0.0,
      title: title ?? '',
      comment: comment ?? '',
      date: date ?? '',
      helpfulVotes: helpfulVotes ?? 0,
      verifiedPurchase: verifiedPurchase ?? true,
      images: images ?? [],
      response: response?.mapToDomain() ?? const Response(),
    );
  }
}
