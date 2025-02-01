import 'package:regardless_data_module/domain/model/user.dart';

import '../price.dart';
import '../venue.dart';
import 'time_slot.dart';
import 'package:intl/intl.dart';

class Service {
  final DateTime? createdAt;
  final String uid;
  final List<String> keywords;
  final List<Price> prices;
  final String name;
  final String description;
  final List<TimeSlot> timeSlots;
  final Venue location;
  final String ownerUid;
  final DateTime? updatedAt;
  final String categoryUid;
  final bool isActive;
  final AUser? provider;

  const Service(
      {this.createdAt,
      this.uid = '',
      this.keywords = const [],
      this.prices = const [],
      this.name = '',
      this.description = '',
      this.timeSlots = const [],
      this.location = const Venue(),
      this.ownerUid = '',
      this.updatedAt,
      this.isActive = false,
      this.categoryUid = '',
      this.provider});

  @override
  String toString() {
    return 'ServiceApi(createdAt: $createdAt, uid: $uid, keywords: $keywords, price: $prices, name: $name, description: $description, timeSlots: $timeSlots, location: $location, ownerUid: $ownerUid, updatedAt: $updatedAt)';
  }

  String getUserName() {
    if (provider == null) {
      return 'Regardless User';
    }
    return provider!.userName;
  }

  Service request(TimeSlot timeSlot, Price? price) {
    return Service(
        timeSlots: [timeSlot],
        prices: price == null ? [] : [price],
        createdAt: createdAt,
        uid: uid,
        keywords: keywords,
        name: name,
        description: description,
        location: location,
        ownerUid: ownerUid,
        updatedAt: updatedAt,
        isActive: isActive,
        provider: provider);
  }

  Service copyWith(
      {DateTime? createdAt,
      String? uid,
      List<String>? keywords,
      List<Price>? prices,
      String? name,
      String? description,
      List<TimeSlot>? timeSlots,
      Venue? location,
      String? ownerUid,
      DateTime? updatedAt,
      bool? isActive}) {
    return Service(
        createdAt: createdAt ?? this.createdAt,
        uid: uid ?? this.uid,
        keywords: keywords ?? this.keywords,
        prices: prices ?? this.prices,
        name: name ?? this.name,
        description: description ?? this.description,
        timeSlots: timeSlots ?? this.timeSlots,
        location: location ?? this.location,
        ownerUid: ownerUid ?? this.ownerUid,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
        provider: provider);
  }

  List<Price> pricesSorted() {
    List<Price> sorted = [];
    sorted.addAll(prices);
    sorted.sort((a, b) => a.amount.compareTo(b.amount));
    return sorted;
  }

  String formatMonthYear() {
    try {
      if (createdAt == null) return '';
      return DateFormat('EEEE dd | h:mmaa').format(createdAt!);
    } catch (e) {
      return '$createdAt';
    }
  }

  String timeSpan() {
    if (timeSlots.isEmpty) return '';
    if (timeSlots.length == 1) {
      return '${getShortDay(timeSlots.first.day)} Slots(${timeSlots.first.slots.length})';
    }

    return '${getShortDay(timeSlots.first.day)} - ${getShortDay(timeSlots.last.day)} Slots(${timeSlots.fold([], (previousValue, element) => [
          ...previousValue,
          ...element.slots
        ]).length})';
  }

  String foldTimeSlots() {
    if (timeSlots.isEmpty) return '';

    final value = timeSlots.fold(
        '',
        (previousValue, element) =>
            '$previousValue${element.slots.fold('', (previousValue, element) => '$previousValue${element.toString()} | ')}');
    return '${getShortDay(timeSlots.first.day)} - Slots($value)';
  }

  String getShortDay(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return 'Mon';
      case 'tuesday':
        return 'Tue';
      case 'wednesday':
        return 'Wed';
      case 'thursday':
        return 'Thu';
      case 'friday':
        return 'Fri';
      case 'saturday':
        return 'Sat';
      case 'sunday':
        return 'Sun';
      default:
        return day; // Return the original if it doesn't match
    }
  }
}
