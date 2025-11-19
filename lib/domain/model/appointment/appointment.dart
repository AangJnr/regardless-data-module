
 import 'appointment_details.dart';
import 'participant_detail.dart';
import 'package:intl/intl.dart';

//@MappableEnum()
enum AppointmentStatus { scheduled, accepted, rejected, cancelled }

class Appointment {
  final String uid;
  final String ownerUid;
  final String providerUid;
  final String serviceType;
  final AppointmentDetail appointmentDetail;
  final ParticipantDetail participantDetail;
  final AppointmentStatus status;
  final String createdAt;
  final String updatedAt;
  final String additionalNotes;
  final String cancellationReason;

  const Appointment({
    this.uid = '',
    this.ownerUid = '',
    this.providerUid = '',
    this.serviceType = '',
    this.appointmentDetail = const AppointmentDetail(),
    this.participantDetail = const ParticipantDetail(),
    this.status = AppointmentStatus.scheduled,
    this.createdAt = '',
    this.updatedAt = '',
    this.additionalNotes = '',
    this.cancellationReason = '',
  });

  @override
  String toString() {
    return 'AppointmentApi(uid: $uid, ownerUid: $ownerUid, providerUid: $providerUid, serviceType: $serviceType, appointmentDetails: $appointmentDetail, participantDetails: $participantDetail, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, additionalNotes: $additionalNotes)';
  }

  Appointment copyWith(
      {String? uid,
      String? ownerUid,
      String? providerUid,
      String? serviceType,
      AppointmentDetail? appointmentDetail,
      ParticipantDetail? participantDetail,
      AppointmentStatus? status,
      String? createdAt,
      String? updatedAt,
      String? additionalNotes,
      String? cancellationReason}) {
    return Appointment(
        uid: uid ?? this.uid,
        ownerUid: ownerUid ?? this.ownerUid,
        providerUid: providerUid ?? this.providerUid,
        serviceType: serviceType ?? this.serviceType,
        appointmentDetail: appointmentDetail ?? this.appointmentDetail,
        participantDetail: participantDetail ?? this.participantDetail,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        additionalNotes: additionalNotes ?? this.additionalNotes,
        cancellationReason: cancellationReason ?? this.cancellationReason);
  }

  String formatMonthYear() {
    try {
      if (createdAt.isEmpty) return '';
      return DateFormat('EEEE dd @ h:mmaa').format(DateTime.parse(createdAt));
    } catch (e) {
      return createdAt;
    }
  }

  bool isInThePast() {
    return appointmentDetail.getEndTime()?.isBefore(DateTime.now()) ?? true;
  }
}
