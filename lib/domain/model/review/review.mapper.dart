// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'review.dart';

class ReviewMapper extends ClassMapperBase<Review> {
  ReviewMapper._();

  static ReviewMapper? _instance;
  static ReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReviewMapper._());
      OwnerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Review';

  static Owner _$reviewer(Review v) => v.reviewer;
  static const Field<Review, Owner> _f$reviewer = Field(
    'reviewer',
    _$reviewer,
    opt: true,
    def: const Owner(),
  );
  static double _$rating(Review v) => v.rating;
  static const Field<Review, double> _f$rating = Field(
    'rating',
    _$rating,
    opt: true,
    def: 0.0,
  );
  static String _$title(Review v) => v.title;
  static const Field<Review, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
    def: '',
  );
  static String _$comment(Review v) => v.comment;
  static const Field<Review, String> _f$comment = Field(
    'comment',
    _$comment,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(Review v) => v.createdAt;
  static const Field<Review, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Review v) => v.updatedAt;
  static const Field<Review, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String _$uid(Review v) => v.uid;
  static const Field<Review, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<Review> fields = const {
    #reviewer: _f$reviewer,
    #rating: _f$rating,
    #title: _f$title,
    #comment: _f$comment,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #uid: _f$uid,
  };

  static Review _instantiate(DecodingData data) {
    return Review(
      reviewer: data.dec(_f$reviewer),
      rating: data.dec(_f$rating),
      title: data.dec(_f$title),
      comment: data.dec(_f$comment),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      uid: data.dec(_f$uid),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Review fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Review>(map);
  }

  static Review fromJson(String json) {
    return ensureInitialized().decodeJson<Review>(json);
  }
}

mixin ReviewMappable {
  String toJson() {
    return ReviewMapper.ensureInitialized().encodeJson<Review>(this as Review);
  }

  Map<String, dynamic> toMap() {
    return ReviewMapper.ensureInitialized().encodeMap<Review>(this as Review);
  }

  ReviewCopyWith<Review, Review, Review> get copyWith =>
      _ReviewCopyWithImpl<Review, Review>(this as Review, $identity, $identity);
  @override
  String toString() {
    return ReviewMapper.ensureInitialized().stringifyValue(this as Review);
  }

  @override
  bool operator ==(Object other) {
    return ReviewMapper.ensureInitialized().equalsValue(this as Review, other);
  }

  @override
  int get hashCode {
    return ReviewMapper.ensureInitialized().hashValue(this as Review);
  }
}

extension ReviewValueCopy<$R, $Out> on ObjectCopyWith<$R, Review, $Out> {
  ReviewCopyWith<$R, Review, $Out> get $asReview =>
      $base.as((v, t, t2) => _ReviewCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ReviewCopyWith<$R, $In extends Review, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  OwnerCopyWith<$R, Owner, Owner> get reviewer;
  $R call({
    Owner? reviewer,
    double? rating,
    String? title,
    String? comment,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? uid,
  });
  ReviewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReviewCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Review, $Out>
    implements ReviewCopyWith<$R, Review, $Out> {
  _ReviewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Review> $mapper = ReviewMapper.ensureInitialized();
  @override
  OwnerCopyWith<$R, Owner, Owner> get reviewer =>
      $value.reviewer.copyWith.$chain((v) => call(reviewer: v));
  @override
  $R call({
    Owner? reviewer,
    double? rating,
    String? title,
    String? comment,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    String? uid,
  }) => $apply(
    FieldCopyWithData({
      if (reviewer != null) #reviewer: reviewer,
      if (rating != null) #rating: rating,
      if (title != null) #title: title,
      if (comment != null) #comment: comment,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (uid != null) #uid: uid,
    }),
  );
  @override
  Review $make(CopyWithData data) => Review(
    reviewer: data.get(#reviewer, or: $value.reviewer),
    rating: data.get(#rating, or: $value.rating),
    title: data.get(#title, or: $value.title),
    comment: data.get(#comment, or: $value.comment),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    uid: data.get(#uid, or: $value.uid),
  );

  @override
  ReviewCopyWith<$R2, Review, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ReviewCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

