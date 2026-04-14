import 'package:dart_mappable/dart_mappable.dart';
import 'package:regardless_data_module/domain/model/price.dart';

import 'appointment_details.dart';
import 'participant_detail.dart';
import 'package:intl/intl.dart';
part 'appointment.mapper.dart';

@MappableEnum()
enum AppointmentStatus { pending, active, rejected, cancelled, expired, scheduled }

@MappableClass()
class Appointment with AppointmentMappable {
  final String uid;
  final String ownerUid;
  final String providerUid;
  final String serviceType;
  final AppointmentDetail appointmentDetails;
  final ParticipantDetail participantDetails;
  final AppointmentStatus status;
  final ProviderDetails? provider;
  final String createdAt;
  final String updatedAt;
  final Price? price;
  final String additionalNotes;
  final String cancellationReason;

  const Appointment({
    this.uid = '',
    this.ownerUid = '',
    this.providerUid = '',
    this.serviceType = '',
    this.provider,
    this.price,
    this.appointmentDetails = const AppointmentDetail(),
    this.participantDetails = const ParticipantDetail(),
    this.status = AppointmentStatus.pending,
    this.createdAt = '',
    this.updatedAt = '',
    this.additionalNotes = '',
    this.cancellationReason = '',
  });

  @override
  String toString() {
    return 'AppointmentApi(uid: $uid, ownerUid: $ownerUid, providerUid: $providerUid, serviceType: $serviceType, appointmentDetails: $appointmentDetails, participantDetails: $participantDetails, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, additionalNotes: $additionalNotes)';
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
    return status == AppointmentStatus.expired ||
        (appointmentDetails.getEndTime()?.isBefore(DateTime.now()) ?? false);
  }
}
