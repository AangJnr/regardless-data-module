// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'comment.dart';

class CommentMapper extends ClassMapperBase<Comment> {
  CommentMapper._();

  static CommentMapper? _instance;
  static CommentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CommentMapper._());
      HashImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Comment';

  static String _$userUid(Comment v) => v.userUid;
  static const Field<Comment, String> _f$userUid = Field(
    'userUid',
    _$userUid,
    opt: true,
    def: '',
  );
  static String _$userName(Comment v) => v.userName;
  static const Field<Comment, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
    def: '',
  );
  static String _$comment(Comment v) => v.comment;
  static const Field<Comment, String> _f$comment = Field(
    'comment',
    _$comment,
    opt: true,
    def: '',
  );
  static String _$uid(Comment v) => v.uid;
  static const Field<Comment, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(Comment v) => v.createdAt;
  static const Field<Comment, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime? _$updatedAt(Comment v) => v.updatedAt;
  static const Field<Comment, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String? _$picture(Comment v) => v.picture;
  static const Field<Comment, String> _f$picture = Field(
    'picture',
    _$picture,
    opt: true,
  );
  static List<HashImage> _$imageUrls(Comment v) => v.imageUrls;
  static const Field<Comment, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<Comment> fields = const {
    #userUid: _f$userUid,
    #userName: _f$userName,
    #comment: _f$comment,
    #uid: _f$uid,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #picture: _f$picture,
    #imageUrls: _f$imageUrls,
  };

  static Comment _instantiate(DecodingData data) {
    return Comment(
      userUid: data.dec(_f$userUid),
      userName: data.dec(_f$userName),
      comment: data.dec(_f$comment),
      uid: data.dec(_f$uid),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      picture: data.dec(_f$picture),
      imageUrls: data.dec(_f$imageUrls),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Comment fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Comment>(map);
  }

  static Comment fromJson(String json) {
    return ensureInitialized().decodeJson<Comment>(json);
  }
}

mixin CommentMappable {
  String toJson() {
    return CommentMapper.ensureInitialized().encodeJson<Comment>(
      this as Comment,
    );
  }

  Map<String, dynamic> toMap() {
    return CommentMapper.ensureInitialized().encodeMap<Comment>(
      this as Comment,
    );
  }

  CommentCopyWith<Comment, Comment, Comment> get copyWith =>
      _CommentCopyWithImpl<Comment, Comment>(
        this as Comment,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CommentMapper.ensureInitialized().stringifyValue(this as Comment);
  }

  @override
  bool operator ==(Object other) {
    return CommentMapper.ensureInitialized().equalsValue(
      this as Comment,
      other,
    );
  }

  @override
  int get hashCode {
    return CommentMapper.ensureInitialized().hashValue(this as Comment);
  }
}

extension CommentValueCopy<$R, $Out> on ObjectCopyWith<$R, Comment, $Out> {
  CommentCopyWith<$R, Comment, $Out> get $asComment =>
      $base.as((v, t, t2) => _CommentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CommentCopyWith<$R, $In extends Comment, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls;
  $R call({
    String? userUid,
    String? userName,
    String? comment,
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? picture,
    List<HashImage>? imageUrls,
  });
  CommentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CommentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Comment, $Out>
    implements CommentCopyWith<$R, Comment, $Out> {
  _CommentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Comment> $mapper =
      CommentMapper.ensureInitialized();
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls => ListCopyWith(
    $value.imageUrls,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(imageUrls: v),
  );
  @override
  $R call({
    String? userUid,
    String? userName,
    String? comment,
    String? uid,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? picture = $none,
    List<HashImage>? imageUrls,
  }) => $apply(
    FieldCopyWithData({
      if (userUid != null) #userUid: userUid,
      if (userName != null) #userName: userName,
      if (comment != null) #comment: comment,
      if (uid != null) #uid: uid,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (picture != $none) #picture: picture,
      if (imageUrls != null) #imageUrls: imageUrls,
    }),
  );
  @override
  Comment $make(CopyWithData data) => Comment(
    userUid: data.get(#userUid, or: $value.userUid),
    userName: data.get(#userName, or: $value.userName),
    comment: data.get(#comment, or: $value.comment),
    uid: data.get(#uid, or: $value.uid),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    picture: data.get(#picture, or: $value.picture),
    imageUrls: data.get(#imageUrls, or: $value.imageUrls),
  );

  @override
  CommentCopyWith<$R2, Comment, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CommentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

