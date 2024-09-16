import 'dart:convert';

class NotificationRequest {
  final int? id;
  final String? name;
  final String? token;
  final String? deviceId;
  final bool? active;
  final String? dateCreated;
  final String? type;

  const NotificationRequest({
    this.id,
    this.name,
    this.token,
    this.deviceId,
    this.active,
    this.dateCreated,
    this.type,
  });

  @override
  String toString() {
    return 'NotificationRequest(id: $id, name: $name, registrationId: $token, deviceId: $deviceId, active: $active, dateCreated: $dateCreated, type: $type)';
  }

  factory NotificationRequest.fromMap(Map<String, dynamic> data) {
    return NotificationRequest(
      id: data['id'] as int?,
      token: data['token'] as String?,
      deviceId: data['deviceId'] as String?,
      active: data['active'] as bool?,
      dateCreated: data['createdAt'] as String?,
      type: data['type'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'token': token,
        'deviceId': deviceId,
        'active': active,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotificationRequest].
  factory NotificationRequest.fromJson(String data) {
    return NotificationRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NotificationRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  NotificationRequest copyWith({
    int? id,
    String? name,
    String? token,
    String? deviceId,
    bool? active,
    String? dateCreated,
    String? type,
  }) {
    return NotificationRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      deviceId: deviceId ?? this.deviceId,
      active: active ?? this.active,
      dateCreated: dateCreated ?? this.dateCreated,
      type: type ?? this.type,
    );
  }
}
