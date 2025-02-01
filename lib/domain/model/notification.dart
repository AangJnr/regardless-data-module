import 'package:intl/intl.dart';

// ignore_for_file: constant_identifier_names
enum NotificationType {
  NEW_EVENT,
  NEW_EVENT_ADDED_TO_COMMUNITY,
  NEW_BOOKING,
  NEW_APPOINTMENT,
  NEW_COMMUNITY_JOIN_REQUEST,
  NEW_COMMUNITY_JOIN_REQUEST_APPROVED,
  NEW_COMMUNITY_EVENT,
  NEW_ATTENDEE_EVENT,
  NONE
}

class Notification {
  final String uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isActive;
  final String title;
  final String message;
  final NotificationType type;
  final dynamic receiver;
  final String metaData;
  final String customLinkText;
  final String image;

  const Notification({
    this.uid = '',
    this.createdAt,
    this.updatedAt,
    this.isActive = false,
    this.title = '',
    this.message = '',
    this.type = NotificationType.NONE,
    this.receiver = '',
    this.metaData = '',
    this.customLinkText = '',
    this.image = '',
  });

  String formatMonthYearHourMinSec() {
    try {
      if (createdAt == null) return '';
      return DateFormat('EEEE dd • h:mmaa').format(createdAt!);
    } catch (e) {
      return '$createdAt';
    }
  }

  String formatMonthYear() {
    try {
      if (createdAt == null) return '';

      if (isWithinThisMonth()) {
        return "This month";
      }
      return DateFormat.yMMMM().format(createdAt!).toString();
    } catch (e) {
      return '$createdAt';
    }
  }

  String getParsedDate() {
    if (createdAt == null) return '';
    try {
      return DateFormat.yMMMMd().format(createdAt!).toString();
    } catch (e) {
      return '';
    }
  }

  bool isWithinThisMonth() {
    try {
      if (createdAt == null) return false;

      return DateFormat.yM().format(createdAt!) ==
          DateFormat.yM().format(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  @override
  String toString() {
    return 'NotificationA(id: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, header: $title, body: $message, messageType: $type, receiver: $receiver, customLink: $metaData, customLinkText: $customLinkText, image: $image)';
  }

  Notification copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    String? header,
    String? body,
    NotificationType? messageType,
    dynamic receiver,
    String? customLink,
    String? customLinkText,
    String? image,
    String? createdBy,
    String? updatedBy,
  }) {
    return Notification(
      uid: id ?? uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      title: header ?? title,
      message: body ?? message,
      type: messageType ?? type,
      receiver: receiver ?? this.receiver,
      metaData: metaData,
      customLinkText: customLinkText ?? this.customLinkText,
      image: image ?? this.image,
    );
  }
}
