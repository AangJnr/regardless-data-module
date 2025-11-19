import 'dart:convert';

import 'package:collection/collection.dart';

 import '../../../domain/domain_mapper.dart';
import '../../../domain/model/appointment/appointment.dart';
import '../../../domain/model/appointment/appointment_details.dart';
import '../../../domain/model/appointment/participant_detail.dart';
import 'appointment_details.dart';
import 'participant_details.dart';

class AppointmentApi implements DomainMapper<Appointment> {
  final String? uid;
  final String? ownerUid;
  final String? providerUid;
  final String? serviceType;
  final AppointmentDetailApi? appointmentDetails;
  final ParticipantDetailApi? participantDetails;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? additionalNotes;
  final String? cancellationReason;

  const AppointmentApi(
      {this.uid,
      this.ownerUid,
      this.providerUid,
      this.serviceType,
      this.appointmentDetails,
      this.participantDetails,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.additionalNotes,
      this.cancellationReason});

  @override
  String toString() {
    return 'AppointmentApi(uid: $uid, ownerUid: $ownerUid, providerUid: $providerUid, serviceType: $serviceType, appointmentDetails: $appointmentDetails, participantDetails: $participantDetails, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, additionalNotes: $additionalNotes)';
  }

  factory AppointmentApi.fromMap(Map<String, dynamic> data) {
    return AppointmentApi(
      uid: data['uid'] as String?,
      ownerUid: data['ownerUid'] as String?,
      providerUid: data['providerUid'] as String?,
      serviceType: data['serviceType'] as String?,
      appointmentDetails: data['appointmentDetails'] == null
          ? null
          : AppointmentDetailApi.fromMap(
              data['appointmentDetails'] as Map<String, dynamic>),
      participantDetails: data['participantDetails'] == null
          ? null
          : ParticipantDetailApi.fromMap(
              data['participantDetails'] as Map<String, dynamic>),
      status: data['status'] as String?,
      createdAt: data['createdAt'] as String?,
      updatedAt: data['updatedAt'] as String?,
      additionalNotes: data['additionalNotes'] as String?,
      cancellationReason: data['cancellationReason'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'ownerUid': ownerUid,
        'providerUid': providerUid,
        'serviceType': serviceType,
        'appointmentDetails': appointmentDetails?.toMap(),
        'participantDetails': participantDetails?.toMap(),
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'additionalNotes': additionalNotes,
        'cancellationReason': cancellationReason
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppointmentApi].
  factory AppointmentApi.fromJson(String data) {
    return AppointmentApi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AppointmentApi] to a JSON string.
  String toJson() => json.encode(toMap());

  AppointmentApi copyWith({
    String? uid,
    String? ownerUid,
    String? providerUid,
    String? serviceType,
    AppointmentDetailApi? appointmentDetails,
    ParticipantDetailApi? participantDetails,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? additionalNotes,
    String? cancellationReason,
  }) {
    return AppointmentApi(
        uid: uid ?? this.uid,
        ownerUid: ownerUid ?? this.ownerUid,
        providerUid: providerUid ?? this.providerUid,
        serviceType: serviceType ?? this.serviceType,
        appointmentDetails: appointmentDetails ?? this.appointmentDetails,
        participantDetails: participantDetails ?? this.participantDetails,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        additionalNotes: additionalNotes ?? this.additionalNotes,
        cancellationReason: cancellationReason ?? this.cancellationReason);
  }

  @override
  Appointment mapToDomain() => Appointment(
      uid: uid ?? '',
      ownerUid: ownerUid ?? '',
      providerUid: providerUid ?? '',
      serviceType: serviceType ?? '',
      appointmentDetail:
          appointmentDetails?.mapToDomain() ?? const AppointmentDetail(),
      participantDetail:
          participantDetails?.mapToDomain() ?? const ParticipantDetail(),
      status: AppointmentStatus.values
              .firstWhereOrNull((element) => element.name == status) ??
          AppointmentStatus.scheduled,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      additionalNotes: additionalNotes ?? '',
      cancellationReason: cancellationReason ?? '');
}
