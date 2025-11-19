// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'event.dart';

class EventTypeMapper extends EnumMapper<EventType> {
  EventTypeMapper._();

  static EventTypeMapper? _instance;
  static EventTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventTypeMapper._());
    }
    return _instance!;
  }

  static EventType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EventType decode(dynamic value) {
    switch (value) {
      case r'InPerson':
        return EventType.InPerson;
      case r'Online':
        return EventType.Online;
      case r'Nan':
        return EventType.Nan;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(EventType self) {
    switch (self) {
      case EventType.InPerson:
        return r'InPerson';
      case EventType.Online:
        return r'Online';
      case EventType.Nan:
        return r'Nan';
    }
  }
}

extension EventTypeMapperExtension on EventType {
  String toValue() {
    EventTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<EventType>(this) as String;
  }
}

class EventMapper extends ClassMapperBase<Event> {
  EventMapper._();

  static EventMapper? _instance;
  static EventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventMapper._());
      VenueMapper.ensureInitialized();
      CategoryMapper.ensureInitialized();
      PriceMapper.ensureInitialized();
      EventTypeMapper.ensureInitialized();
      HashImageMapper.ensureInitialized();
      MemberMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Event';

  static Venue _$venue(Event v) => v.venue;
  static const Field<Event, Venue> _f$venue = Field(
    'venue',
    _$venue,
    opt: true,
    def: const Venue(),
  );
  static String _$archiveReason(Event v) => v.archiveReason;
  static const Field<Event, String> _f$archiveReason = Field(
    'archiveReason',
    _$archiveReason,
    opt: true,
    def: '',
  );
  static int _$durationHour(Event v) => v.durationHour;
  static const Field<Event, int> _f$durationHour = Field(
    'durationHour',
    _$durationHour,
    opt: true,
    def: 0,
  );
  static bool _$isVerified(Event v) => v.isVerified;
  static const Field<Event, bool> _f$isVerified = Field(
    'isVerified',
    _$isVerified,
    opt: true,
    def: false,
  );
  static int _$ticketsCancelled(Event v) => v.ticketsCancelled;
  static const Field<Event, int> _f$ticketsCancelled = Field(
    'ticketsCancelled',
    _$ticketsCancelled,
    opt: true,
    def: 0,
  );
  static bool _$isArchived(Event v) => v.isArchived;
  static const Field<Event, bool> _f$isArchived = Field(
    'isArchived',
    _$isArchived,
    opt: true,
    def: false,
  );
  static String _$timezone(Event v) => v.timezone;
  static const Field<Event, String> _f$timezone = Field(
    'timezone',
    _$timezone,
    opt: true,
    def: '',
  );
  static String _$updateReason(Event v) => v.updateReason;
  static const Field<Event, String> _f$updateReason = Field(
    'updateReason',
    _$updateReason,
    opt: true,
    def: '',
  );
  static String _$verifiedAt(Event v) => v.verifiedAt;
  static const Field<Event, String> _f$verifiedAt = Field(
    'verifiedAt',
    _$verifiedAt,
    opt: true,
    def: '',
  );
  static String _$description(Event v) => v.description;
  static const Field<Event, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$recurrenceUid(Event v) => v.recurrenceUid;
  static const Field<Event, String> _f$recurrenceUid = Field(
    'recurrenceUid',
    _$recurrenceUid,
    opt: true,
    def: '',
  );
  static String _$recurrenceLabel(Event v) => v.recurrenceLabel;
  static const Field<Event, String> _f$recurrenceLabel = Field(
    'recurrenceLabel',
    _$recurrenceLabel,
    opt: true,
    def: '',
  );
  static String _$recurrence(Event v) => v.recurrence;
  static const Field<Event, String> _f$recurrence = Field(
    'recurrence',
    _$recurrence,
    opt: true,
    def: '',
  );
  static DateTime? _$createdAt(Event v) => v.createdAt;
  static const Field<Event, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String _$uid(Event v) => v.uid;
  static const Field<Event, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
    def: '',
  );
  static Category _$category(Event v) => v.category;
  static const Field<Event, Category> _f$category = Field(
    'category',
    _$category,
    opt: true,
    def: const Category(),
  );
  static String _$localTimestamp(Event v) => v.localTimestamp;
  static const Field<Event, String> _f$localTimestamp = Field(
    'localTimestamp',
    _$localTimestamp,
    opt: true,
    def: '',
  );
  static String _$categoryUid(Event v) => v.categoryUid;
  static const Field<Event, String> _f$categoryUid = Field(
    'categoryUid',
    _$categoryUid,
    opt: true,
    def: '',
  );
  static String _$onlineEventUrl(Event v) => v.onlineEventUrl;
  static const Field<Event, String> _f$onlineEventUrl = Field(
    'onlineEventUrl',
    _$onlineEventUrl,
    opt: true,
    def: '',
  );
  static List<Price> _$prices(Event v) => v.prices;
  static const Field<Event, List<Price>> _f$prices = Field(
    'prices',
    _$prices,
    opt: true,
    def: const [],
  );
  static int _$durationMin(Event v) => v.durationMin;
  static const Field<Event, int> _f$durationMin = Field(
    'durationMin',
    _$durationMin,
    opt: true,
    def: 0,
  );
  static int _$timestamp(Event v) => v.timestamp;
  static const Field<Event, int> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
    def: 0,
  );
  static DateTime? _$updatedAt(Event v) => v.updatedAt;
  static const Field<Event, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static int _$ticketsPurchased(Event v) => v.ticketsPurchased;
  static const Field<Event, int> _f$ticketsPurchased = Field(
    'ticketsPurchased',
    _$ticketsPurchased,
    opt: true,
    def: 0,
  );
  static String _$contactEmail(Event v) => v.contactEmail;
  static const Field<Event, String> _f$contactEmail = Field(
    'contactEmail',
    _$contactEmail,
    opt: true,
    def: '',
  );
  static int _$availableTickets(Event v) => v.availableTickets;
  static const Field<Event, int> _f$availableTickets = Field(
    'availableTickets',
    _$availableTickets,
    opt: true,
    def: 0,
  );
  static int _$viewsCount(Event v) => v.viewsCount;
  static const Field<Event, int> _f$viewsCount = Field(
    'viewsCount',
    _$viewsCount,
    opt: true,
    def: 0,
  );
  static EventType _$eventType(Event v) => v.eventType;
  static const Field<Event, EventType> _f$eventType = Field(
    'eventType',
    _$eventType,
    opt: true,
    def: EventType.InPerson,
  );
  static bool _$isRepeating(Event v) => v.isRepeating;
  static const Field<Event, bool> _f$isRepeating = Field(
    'isRepeating',
    _$isRepeating,
    opt: true,
    def: false,
  );
  static List<HashImage> _$imageUrls(Event v) => v.imageUrls;
  static const Field<Event, List<HashImage>> _f$imageUrls = Field(
    'imageUrls',
    _$imageUrls,
    opt: true,
    def: const [],
  );
  static String _$name(Event v) => v.name;
  static const Field<Event, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
    def: '',
  );
  static String _$contactPhone(Event v) => v.contactPhone;
  static const Field<Event, String> _f$contactPhone = Field(
    'contactPhone',
    _$contactPhone,
    opt: true,
    def: '',
  );
  static String _$ownerUid(Event v) => v.ownerUid;
  static const Field<Event, String> _f$ownerUid = Field(
    'ownerUid',
    _$ownerUid,
    opt: true,
    def: '',
  );
  static Price? _$selectedPrice(Event v) => v.selectedPrice;
  static const Field<Event, Price> _f$selectedPrice = Field(
    'selectedPrice',
    _$selectedPrice,
    opt: true,
  );
  static String _$ownerUserName(Event v) => v.ownerUserName;
  static const Field<Event, String> _f$ownerUserName = Field(
    'ownerUserName',
    _$ownerUserName,
    opt: true,
    def: '',
  );
  static String _$ownerProfileImageUrl(Event v) => v.ownerProfileImageUrl;
  static const Field<Event, String> _f$ownerProfileImageUrl = Field(
    'ownerProfileImageUrl',
    _$ownerProfileImageUrl,
    opt: true,
    def: '',
  );
  static bool _$isSponsored(Event v) => v.isSponsored;
  static const Field<Event, bool> _f$isSponsored = Field(
    'isSponsored',
    _$isSponsored,
    opt: true,
    def: false,
  );
  static String _$communityUid(Event v) => v.communityUid;
  static const Field<Event, String> _f$communityUid = Field(
    'communityUid',
    _$communityUid,
    opt: true,
    def: '',
  );
  static double _$distance(Event v) => v.distance;
  static const Field<Event, double> _f$distance = Field(
    'distance',
    _$distance,
    opt: true,
    def: 0.0,
  );
  static List<Member> _$attendees(Event v) => v.attendees;
  static const Field<Event, List<Member>> _f$attendees = Field(
    'attendees',
    _$attendees,
    opt: true,
    def: const [],
  );
  static int _$attendeesCount(Event v) => v.attendeesCount;
  static const Field<Event, int> _f$attendeesCount = Field(
    'attendeesCount',
    _$attendeesCount,
    opt: true,
    def: 0,
  );
  static bool _$isFromFeed(Event v) => v.isFromFeed;
  static const Field<Event, bool> _f$isFromFeed = Field(
    'isFromFeed',
    _$isFromFeed,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<Event> fields = const {
    #venue: _f$venue,
    #archiveReason: _f$archiveReason,
    #durationHour: _f$durationHour,
    #isVerified: _f$isVerified,
    #ticketsCancelled: _f$ticketsCancelled,
    #isArchived: _f$isArchived,
    #timezone: _f$timezone,
    #updateReason: _f$updateReason,
    #verifiedAt: _f$verifiedAt,
    #description: _f$description,
    #recurrenceUid: _f$recurrenceUid,
    #recurrenceLabel: _f$recurrenceLabel,
    #recurrence: _f$recurrence,
    #createdAt: _f$createdAt,
    #uid: _f$uid,
    #category: _f$category,
    #localTimestamp: _f$localTimestamp,
    #categoryUid: _f$categoryUid,
    #onlineEventUrl: _f$onlineEventUrl,
    #prices: _f$prices,
    #durationMin: _f$durationMin,
    #timestamp: _f$timestamp,
    #updatedAt: _f$updatedAt,
    #ticketsPurchased: _f$ticketsPurchased,
    #contactEmail: _f$contactEmail,
    #availableTickets: _f$availableTickets,
    #viewsCount: _f$viewsCount,
    #eventType: _f$eventType,
    #isRepeating: _f$isRepeating,
    #imageUrls: _f$imageUrls,
    #name: _f$name,
    #contactPhone: _f$contactPhone,
    #ownerUid: _f$ownerUid,
    #selectedPrice: _f$selectedPrice,
    #ownerUserName: _f$ownerUserName,
    #ownerProfileImageUrl: _f$ownerProfileImageUrl,
    #isSponsored: _f$isSponsored,
    #communityUid: _f$communityUid,
    #distance: _f$distance,
    #attendees: _f$attendees,
    #attendeesCount: _f$attendeesCount,
    #isFromFeed: _f$isFromFeed,
  };

  static Event _instantiate(DecodingData data) {
    return Event(
      venue: data.dec(_f$venue),
      archiveReason: data.dec(_f$archiveReason),
      durationHour: data.dec(_f$durationHour),
      isVerified: data.dec(_f$isVerified),
      ticketsCancelled: data.dec(_f$ticketsCancelled),
      isArchived: data.dec(_f$isArchived),
      timezone: data.dec(_f$timezone),
      updateReason: data.dec(_f$updateReason),
      verifiedAt: data.dec(_f$verifiedAt),
      description: data.dec(_f$description),
      recurrenceUid: data.dec(_f$recurrenceUid),
      recurrenceLabel: data.dec(_f$recurrenceLabel),
      recurrence: data.dec(_f$recurrence),
      createdAt: data.dec(_f$createdAt),
      uid: data.dec(_f$uid),
      category: data.dec(_f$category),
      localTimestamp: data.dec(_f$localTimestamp),
      categoryUid: data.dec(_f$categoryUid),
      onlineEventUrl: data.dec(_f$onlineEventUrl),
      prices: data.dec(_f$prices),
      durationMin: data.dec(_f$durationMin),
      timestamp: data.dec(_f$timestamp),
      updatedAt: data.dec(_f$updatedAt),
      ticketsPurchased: data.dec(_f$ticketsPurchased),
      contactEmail: data.dec(_f$contactEmail),
      availableTickets: data.dec(_f$availableTickets),
      viewsCount: data.dec(_f$viewsCount),
      eventType: data.dec(_f$eventType),
      isRepeating: data.dec(_f$isRepeating),
      imageUrls: data.dec(_f$imageUrls),
      name: data.dec(_f$name),
      contactPhone: data.dec(_f$contactPhone),
      ownerUid: data.dec(_f$ownerUid),
      selectedPrice: data.dec(_f$selectedPrice),
      ownerUserName: data.dec(_f$ownerUserName),
      ownerProfileImageUrl: data.dec(_f$ownerProfileImageUrl),
      isSponsored: data.dec(_f$isSponsored),
      communityUid: data.dec(_f$communityUid),
      distance: data.dec(_f$distance),
      attendees: data.dec(_f$attendees),
      attendeesCount: data.dec(_f$attendeesCount),
      isFromFeed: data.dec(_f$isFromFeed),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Event fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Event>(map);
  }

  static Event fromJson(String json) {
    return ensureInitialized().decodeJson<Event>(json);
  }
}

mixin EventMappable {
  String toJson() {
    return EventMapper.ensureInitialized().encodeJson<Event>(this as Event);
  }

  Map<String, dynamic> toMap() {
    return EventMapper.ensureInitialized().encodeMap<Event>(this as Event);
  }

  EventCopyWith<Event, Event, Event> get copyWith =>
      _EventCopyWithImpl<Event, Event>(this as Event, $identity, $identity);
  @override
  String toString() {
    return EventMapper.ensureInitialized().stringifyValue(this as Event);
  }

  @override
  bool operator ==(Object other) {
    return EventMapper.ensureInitialized().equalsValue(this as Event, other);
  }

  @override
  int get hashCode {
    return EventMapper.ensureInitialized().hashValue(this as Event);
  }
}

extension EventValueCopy<$R, $Out> on ObjectCopyWith<$R, Event, $Out> {
  EventCopyWith<$R, Event, $Out> get $asEvent =>
      $base.as((v, t, t2) => _EventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EventCopyWith<$R, $In extends Event, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  VenueCopyWith<$R, Venue, Venue> get venue;
  CategoryCopyWith<$R, Category, Category> get category;
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices;
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls;
  PriceCopyWith<$R, Price, Price>? get selectedPrice;
  ListCopyWith<$R, Member, MemberCopyWith<$R, Member, Member>> get attendees;
  $R call({
    Venue? venue,
    String? archiveReason,
    int? durationHour,
    bool? isVerified,
    int? ticketsCancelled,
    bool? isArchived,
    String? timezone,
    String? updateReason,
    String? verifiedAt,
    String? description,
    String? recurrenceUid,
    String? recurrenceLabel,
    String? recurrence,
    DateTime? createdAt,
    String? uid,
    Category? category,
    String? localTimestamp,
    String? categoryUid,
    String? onlineEventUrl,
    List<Price>? prices,
    int? durationMin,
    int? timestamp,
    DateTime? updatedAt,
    int? ticketsPurchased,
    String? contactEmail,
    int? availableTickets,
    int? viewsCount,
    EventType? eventType,
    bool? isRepeating,
    List<HashImage>? imageUrls,
    String? name,
    String? contactPhone,
    String? ownerUid,
    Price? selectedPrice,
    String? ownerUserName,
    String? ownerProfileImageUrl,
    bool? isSponsored,
    String? communityUid,
    double? distance,
    List<Member>? attendees,
    int? attendeesCount,
    bool? isFromFeed,
  });
  EventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EventCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Event, $Out>
    implements EventCopyWith<$R, Event, $Out> {
  _EventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Event> $mapper = EventMapper.ensureInitialized();
  @override
  VenueCopyWith<$R, Venue, Venue> get venue =>
      $value.venue.copyWith.$chain((v) => call(venue: v));
  @override
  CategoryCopyWith<$R, Category, Category> get category =>
      $value.category.copyWith.$chain((v) => call(category: v));
  @override
  ListCopyWith<$R, Price, PriceCopyWith<$R, Price, Price>> get prices =>
      ListCopyWith(
        $value.prices,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(prices: v),
      );
  @override
  ListCopyWith<$R, HashImage, HashImageCopyWith<$R, HashImage, HashImage>>
  get imageUrls => ListCopyWith(
    $value.imageUrls,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(imageUrls: v),
  );
  @override
  PriceCopyWith<$R, Price, Price>? get selectedPrice =>
      $value.selectedPrice?.copyWith.$chain((v) => call(selectedPrice: v));
  @override
  ListCopyWith<$R, Member, MemberCopyWith<$R, Member, Member>> get attendees =>
      ListCopyWith(
        $value.attendees,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(attendees: v),
      );
  @override
  $R call({
    Venue? venue,
    String? archiveReason,
    int? durationHour,
    bool? isVerified,
    int? ticketsCancelled,
    bool? isArchived,
    String? timezone,
    String? updateReason,
    String? verifiedAt,
    String? description,
    String? recurrenceUid,
    String? recurrenceLabel,
    String? recurrence,
    Object? createdAt = $none,
    String? uid,
    Category? category,
    String? localTimestamp,
    String? categoryUid,
    String? onlineEventUrl,
    List<Price>? prices,
    int? durationMin,
    int? timestamp,
    Object? updatedAt = $none,
    int? ticketsPurchased,
    String? contactEmail,
    int? availableTickets,
    int? viewsCount,
    EventType? eventType,
    bool? isRepeating,
    List<HashImage>? imageUrls,
    String? name,
    String? contactPhone,
    String? ownerUid,
    Object? selectedPrice = $none,
    String? ownerUserName,
    String? ownerProfileImageUrl,
    bool? isSponsored,
    String? communityUid,
    double? distance,
    List<Member>? attendees,
    int? attendeesCount,
    bool? isFromFeed,
  }) => $apply(
    FieldCopyWithData({
      if (venue != null) #venue: venue,
      if (archiveReason != null) #archiveReason: archiveReason,
      if (durationHour != null) #durationHour: durationHour,
      if (isVerified != null) #isVerified: isVerified,
      if (ticketsCancelled != null) #ticketsCancelled: ticketsCancelled,
      if (isArchived != null) #isArchived: isArchived,
      if (timezone != null) #timezone: timezone,
      if (updateReason != null) #updateReason: updateReason,
      if (verifiedAt != null) #verifiedAt: verifiedAt,
      if (description != null) #description: description,
      if (recurrenceUid != null) #recurrenceUid: recurrenceUid,
      if (recurrenceLabel != null) #recurrenceLabel: recurrenceLabel,
      if (recurrence != null) #recurrence: recurrence,
      if (createdAt != $none) #createdAt: createdAt,
      if (uid != null) #uid: uid,
      if (category != null) #category: category,
      if (localTimestamp != null) #localTimestamp: localTimestamp,
      if (categoryUid != null) #categoryUid: categoryUid,
      if (onlineEventUrl != null) #onlineEventUrl: onlineEventUrl,
      if (prices != null) #prices: prices,
      if (durationMin != null) #durationMin: durationMin,
      if (timestamp != null) #timestamp: timestamp,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (ticketsPurchased != null) #ticketsPurchased: ticketsPurchased,
      if (contactEmail != null) #contactEmail: contactEmail,
      if (availableTickets != null) #availableTickets: availableTickets,
      if (viewsCount != null) #viewsCount: viewsCount,
      if (eventType != null) #eventType: eventType,
      if (isRepeating != null) #isRepeating: isRepeating,
      if (imageUrls != null) #imageUrls: imageUrls,
      if (name != null) #name: name,
      if (contactPhone != null) #contactPhone: contactPhone,
      if (ownerUid != null) #ownerUid: ownerUid,
      if (selectedPrice != $none) #selectedPrice: selectedPrice,
      if (ownerUserName != null) #ownerUserName: ownerUserName,
      if (ownerProfileImageUrl != null)
        #ownerProfileImageUrl: ownerProfileImageUrl,
      if (isSponsored != null) #isSponsored: isSponsored,
      if (communityUid != null) #communityUid: communityUid,
      if (distance != null) #distance: distance,
      if (attendees != null) #attendees: attendees,
      if (attendeesCount != null) #attendeesCount: attendeesCount,
      if (isFromFeed != null) #isFromFeed: isFromFeed,
    }),
  );
  @override
  Event $make(CopyWithData data) => Event(
    venue: data.get(#venue, or: $value.venue),
    archiveReason: data.get(#archiveReason, or: $value.archiveReason),
    durationHour: data.get(#durationHour, or: $value.durationHour),
    isVerified: data.get(#isVerified, or: $value.isVerified),
    ticketsCancelled: data.get(#ticketsCancelled, or: $value.ticketsCancelled),
    isArchived: data.get(#isArchived, or: $value.isArchived),
    timezone: data.get(#timezone, or: $value.timezone),
    updateReason: data.get(#updateReason, or: $value.updateReason),
    verifiedAt: data.get(#verifiedAt, or: $value.verifiedAt),
    description: data.get(#description, or: $value.description),
    recurrenceUid: data.get(#recurrenceUid, or: $value.recurrenceUid),
    recurrenceLabel: data.get(#recurrenceLabel, or: $value.recurrenceLabel),
    recurrence: data.get(#recurrence, or: $value.recurrence),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    uid: data.get(#uid, or: $value.uid),
    category: data.get(#category, or: $value.category),
    localTimestamp: data.get(#localTimestamp, or: $value.localTimestamp),
    categoryUid: data.get(#categoryUid, or: $value.categoryUid),
    onlineEventUrl: data.get(#onlineEventUrl, or: $value.onlineEventUrl),
    prices: data.get(#prices, or: $value.prices),
    durationMin: data.get(#durationMin, or: $value.durationMin),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    ticketsPurchased: data.get(#ticketsPurchased, or: $value.ticketsPurchased),
    contactEmail: data.get(#contactEmail, or: $value.contactEmail),
    availableTickets: data.get(#availableTickets, or: $value.availableTickets),
    viewsCount: data.get(#viewsCount, or: $value.viewsCount),
    eventType: data.get(#eventType, or: $value.eventType),
    isRepeating: data.get(#isRepeating, or: $value.isRepeating),
    imageUrls: data.get(#imageUrls, or: $value.imageUrls),
    name: data.get(#name, or: $value.name),
    contactPhone: data.get(#contactPhone, or: $value.contactPhone),
    ownerUid: data.get(#ownerUid, or: $value.ownerUid),
    selectedPrice: data.get(#selectedPrice, or: $value.selectedPrice),
    ownerUserName: data.get(#ownerUserName, or: $value.ownerUserName),
    ownerProfileImageUrl: data.get(
      #ownerProfileImageUrl,
      or: $value.ownerProfileImageUrl,
    ),
    isSponsored: data.get(#isSponsored, or: $value.isSponsored),
    communityUid: data.get(#communityUid, or: $value.communityUid),
    distance: data.get(#distance, or: $value.distance),
    attendees: data.get(#attendees, or: $value.attendees),
    attendeesCount: data.get(#attendeesCount, or: $value.attendeesCount),
    isFromFeed: data.get(#isFromFeed, or: $value.isFromFeed),
  );

  @override
  EventCopyWith<$R2, Event, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _EventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

