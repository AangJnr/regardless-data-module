import 'response.dart';
import 'reviewer.dart';

class Review {
  final String reviewUid;
  final String productId;
  final Reviewer reviewer;
  final double rating;
  final String title;
  final String comment;
  final String date;
  final int helpfulVotes;
  final bool verifiedPurchase;
  final List<String> images;
  final Response response;

  const Review({
    this.reviewUid = '',
    this.productId = '',
    this.reviewer = const Reviewer(),
    this.rating = 0.0,
    this.title = '',
    this.comment = '',
    this.date = '',
    this.helpfulVotes = 0,
    this.verifiedPurchase = true,
    this.images = const [],
    this.response = const Response(),
  });

  @override
  String toString() {
    return 'AReview(reviewId: $reviewUid, productId: $productId, reviewer: $reviewer, rating: $rating, title: $title, comment: $comment, date: $date, helpfulVotes: $helpfulVotes, verifiedPurchase: $verifiedPurchase, images: $images, response: $response)';
  }

  Review copyWith({
    String? reviewId,
    String? productId,
    Reviewer? reviewer,
    double? rating,
    String? title,
    String? comment,
    String? date,
    int? helpfulVotes,
    bool? verifiedPurchase,
    List<String>? images,
    Response? response,
  }) {
    return Review(
      reviewUid: reviewId ?? reviewUid,
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
}
