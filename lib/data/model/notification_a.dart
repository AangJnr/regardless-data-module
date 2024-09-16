import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/notification.dart';

class NotificationA implements DomainMapper<Notification> {
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isActive;
  final dynamic deletedAt;
  final String? title;
  final String? message;
  final String? type;
  final bool? isAll;
  final String? metaData;
  final dynamic customLinkText;
  final dynamic image;
  final String? templateId;

  const NotificationA({
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.deletedAt,
    this.title,
    this.message,
    this.type,
    this.isAll,
    this.metaData,
    this.customLinkText,
    this.image,
    this.templateId,
  });

  @override
  String toString() {
    return 'NotificationA(id: $uid, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, header: $title, body: $message, messageType: $type, metaData: $metaData, customLinkText: $customLinkText, image: $image )';
  }

  factory NotificationA.fromMap(Map<String, dynamic> data) => NotificationA(
        uid: data['uid'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        isActive: data['isActive'] as bool?,
        title: data['title'] as String?,
        message: data['body'] as String?,
        type: data['type'] as String?,
        metaData: data['metaData'] as String?,
        customLinkText: data['custom_link_text'] as dynamic,
        image: data['image'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': uid,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'isActive': isActive,
        'deleted_at': deletedAt,
        'title': title,
        'body': message,
        'type': type,
        'metaData': metaData,
        'custom_link_text': customLinkText,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotificationA].
  factory NotificationA.fromJson(String data) {
    return NotificationA.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NotificationA] to a JSON string.
  String toJson() => json.encode(toMap());

  NotificationA copyWith({
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    dynamic deletedAt,
    String? title,
    String? message,
    String? type,
    String? metaData,
    dynamic customLinkText,
    dynamic image,
  }) {
    return NotificationA(
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      deletedAt: deletedAt ?? this.deletedAt,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      metaData: metaData ?? this.metaData,
      customLinkText: customLinkText ?? this.customLinkText,
      image: image ?? this.image,
    );
  }

  @override
  Notification mapToDomain() => Notification(
        uid: uid ?? '',
        createdAt: createdAt,
        updatedAt: updatedAt,
        isActive: isActive ?? false,
        title: title ?? '',
        message: message ?? '',
        type: NotificationType.values
                .firstWhereOrNull((element) => element.name == type) ??
            NotificationType.NONE,
        metaData: metaData ?? '',
        customLinkText: customLinkText ?? '',
        image: image ?? '',
      );
}
