import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/app/config/enums.dart';

import '../../data/model/appointment_api/appointment_api.dart';
import '../../data/model/paginated_response.dart';
import '../../data/model/service_api/service_api.dart';
import '../model/appointment/appointment.dart';
import '../model/pagination.dart';
import '../model/service/service.dart';

abstract class ServiceRepository {
  Future<Result<Pagination<Service>, Exception>> getProviderServices(
      String providerUid);
  Future<Result<Service, Exception>> getService(String providerUid, String uid);
  Future<Result<Service, Exception>> addService(ServiceApi e);
  Future<Result<bool, Exception>> deleteService(String uid);
  Future<Result<bool, Exception>> setActive(String uid, {bool isActive});
  Future<Result<Pagination<Appointment>, Exception>> getAppointments(
      {PaginationRequest? request});
  Future<Result<Appointment, Exception>> getAppointment(String uid);
  Future<Result<Appointment, Exception>> addAppointment(AppointmentApi e);
  Future<Result<bool, Exception>> deleteAppointment(String uid);
  Future<Result<Pagination<Appointment>, Exception>> getAppointmentRequests(
      {PaginationRequest? request});
  Future<Result<Appointment, Exception>> getAppointmentRequest(String uid);
  Future<Result<bool, Exception>> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointmentUid);
}
