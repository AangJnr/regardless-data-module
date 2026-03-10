import 'package:multiple_result/multiple_result.dart';

import '../../data/model/paginated_response.dart';
import '../../data/model/search_filter.dart';
import '../../data/model/service_api/service_api.dart';
import '../model/appointment/appointment.dart';
import '../model/pagination.dart';
import '../model/service/service.dart';
import '../model/price.dart';
import '../model/user.dart';

abstract class ServiceRepository {
  Future<Result<Pagination<Service>, Exception>> getProviderServices(
      String providerUid);
  Future<Result<Service, Exception>> getService(String providerUid, String uid);
  Future<Result<Service, Exception>> addService(CreateService e);
  Future<Result<bool, Exception>> deleteService(String uid);
  Future<Result<bool, Exception>> setActive(String uid, {bool isActive});
  Future<Result<Pagination<Appointment>, Exception>> getAppointments(
      {PaginationRequest? request});
  Future<Result<Appointment, Exception>> getAppointment(String uid);

  /// Subscribe to a service. Start/end are set by backend when provider accepts.
  /// [proposedStartTime] optional ISO8601 string; if null, start is when provider confirms.
  Future<Result<Appointment, Exception>> addAppointment({
    required AUser user,
    required Service service,
    String notes = "",
    String? proposedStartTime,
    Price? selectedPrice,
  });
  Future<Result<bool, Exception>> deleteAppointment(String uid);
  Future<Result<Pagination<Appointment>, Exception>> getAppointmentRequests(
      {PaginationRequest? request});
  Future<Result<Appointment, Exception>> getAppointmentRequest(String uid);
  Future<Result<bool, Exception>> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointmentUid);
  Future<Result<List<AUser>, Exception>> searchPersonalTrainers(
      SearchEventParams params);
}
