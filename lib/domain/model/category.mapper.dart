// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category.dart';

class CategoryMapper extends ClassMapperBase<Category> {
  CategoryMapper._();

  static CategoryMapper? _instance;
  static CategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Category';

  static String _$name(Category v) => v.name;
  static const Field<Category, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$description(Category v) => v.description;
  static const Field<Category, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$imageUrl(Category v) => v.imageUrl;
  static const Field<Category, String> _f$imageUrl = Field(
    'imageUrl',
    _$imageUrl,
    opt: true,
    def: '',
  );
  static String _$uid(Category v) => v.uid;
  static const Field<Category, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static String _$descriptionForProvider(Category v) =>
      v.descriptionForProvider;
  static const Field<Category, String> _f$descriptionForProvider = Field(
    'descriptionForProvider',
    _$descriptionForProvider,
    opt: true,
    def: '',
  );
  static String _$nameForProvider(Category v) => v.nameForProvider;
  static const Field<Category, String> _f$nameForProvider = Field(
    'nameForProvider',
    _$nameForProvider,
    opt: true,
    def: '',
  );
  static String _$iconUrl(Category v) => v.iconUrl;
  static const Field<Category, String> _f$iconUrl = Field(
    'iconUrl',
    _$iconUrl,
    opt: true,
    def: '',
  );
  static String? _$hexColor(Category v) => v.hexColor;
  static const Field<Category, String> _f$hexColor = Field(
    'hexColor',
    _$hexColor,
    opt: true,
  );
  static bool _$isActive(Category v) => v.isActive;
  static const Field<Category, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
    def: true,
  );
  static bool _$serviceSupported(Category v) => v.serviceSupported;
  static const Field<Category, bool> _f$serviceSupported = Field(
    'serviceSupported',
    _$serviceSupported,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<Category> fields = const {
    #name: _f$name,
    #description: _f$description,
    #imageUrl: _f$imageUrl,
    #uid: _f$uid,
    #descriptionForProvider: _f$descriptionForProvider,
    #nameForProvider: _f$nameForProvider,
    #iconUrl: _f$iconUrl,
    #hexColor: _f$hexColor,
    #isActive: _f$isActive,
    #serviceSupported: _f$serviceSupported,
  };

  static Category _instantiate(DecodingData data) {
    return Category(
      name: data.dec(_f$name),
      description: data.dec(_f$description),
      imageUrl: data.dec(_f$imageUrl),
      uid: data.dec(_f$uid),
      descriptionForProvider: data.dec(_f$descriptionForProvider),
      nameForProvider: data.dec(_f$nameForProvider),
      iconUrl: data.dec(_f$iconUrl),
      hexColor: data.dec(_f$hexColor),
      isActive: data.dec(_f$isActive),
      serviceSupported: data.dec(_f$serviceSupported),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Category fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Category>(map);
  }

  static Category fromJson(String json) {
    return ensureInitialized().decodeJson<Category>(json);
  }
}

mixin CategoryMappable {
  String toJson() {
    return CategoryMapper.ensureInitialized().encodeJson<Category>(
      this as Category,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryMapper.ensureInitialized().encodeMap<Category>(
      this as Category,
    );
  }

  CategoryCopyWith<Category, Category, Category> get copyWith =>
      _CategoryCopyWithImpl<Category, Category>(
        this as Category,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryMapper.ensureInitialized().stringifyValue(this as Category);
  }

  @override
  bool operator ==(Object other) {
    return CategoryMapper.ensureInitialized().equalsValue(
      this as Category,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryMapper.ensureInitialized().hashValue(this as Category);
  }
}

extension CategoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Category, $Out> {
  CategoryCopyWith<$R, Category, $Out> get $asCategory =>
      $base.as((v, t, t2) => _CategoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryCopyWith<$R, $In extends Category, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? name,
    String? description,
    String? imageUrl,
    String? uid,
    String? descriptionForProvider,
    String? nameForProvider,
    String? iconUrl,
    String? hexColor,
    bool? isActive,
    bool? serviceSupported,
  });
  CategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Category, $Out>
    implements CategoryCopyWith<$R, Category, $Out> {
  _CategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Category> $mapper =
      CategoryMapper.ensureInitialized();
  @override
  $R call({
    String? name,
    String? description,
    String? imageUrl,
    String? uid,
    String? descriptionForProvider,
    String? nameForProvider,
    String? iconUrl,
    Object? hexColor = $none,
    bool? isActive,
    bool? serviceSupported,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (description != null) #description: description,
      if (imageUrl != null) #imageUrl: imageUrl,
      if (uid != null) #uid: uid,
      if (descriptionForProvider != null)
        #descriptionForProvider: descriptionForProvider,
      if (nameForProvider != null) #nameForProvider: nameForProvider,
      if (iconUrl != null) #iconUrl: iconUrl,
      if (hexColor != $none) #hexColor: hexColor,
      if (isActive != null) #isActive: isActive,
      if (serviceSupported != null) #serviceSupported: serviceSupported,
    }),
  );
  @override
  Category $make(CopyWithData data) => Category(
    name: data.get(#name, or: $value.name),
    description: data.get(#description, or: $value.description),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    uid: data.get(#uid, or: $value.uid),
    descriptionForProvider: data.get(
      #descriptionForProvider,
      or: $value.descriptionForProvider,
    ),
    nameForProvider: data.get(#nameForProvider, or: $value.nameForProvider),
    iconUrl: data.get(#iconUrl, or: $value.iconUrl),
    hexColor: data.get(#hexColor, or: $value.hexColor),
    isActive: data.get(#isActive, or: $value.isActive),
    serviceSupported: data.get(#serviceSupported, or: $value.serviceSupported),
  );

  @override
  CategoryCopyWith<$R2, Category, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

