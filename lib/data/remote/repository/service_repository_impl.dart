import 'package:multiple_result/multiple_result.dart';
import '../../../app/app.logger.dart';
import '../../../app/config/enums.dart';
import '../../../domain/model/appointment/appointment.dart';
import '../../../domain/model/pagination.dart';
import '../../../domain/model/service/service.dart';
import '../../../domain/repositories/service_repository.dart';
import '../../model/appointment_api/appointment_api.dart';
import '../../model/paginated_response.dart';
import '../../model/service_api/service_api.dart';
import 'base_repository.dart';

class ServiceRepositoryImpl with BaseRepository implements ServiceRepository {
  @override
  Future<Result<Appointment, Exception>> addAppointment(
      AppointmentApi e) async {
    var data = await processRequest(() => apiService.addAppointment(e));
    if (data.isSuccess()) {
      return Success(
          AppointmentApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Service, Exception>> addService(ServiceApi e) async {
    var data = await processRequest(() => apiService.addService(e));
    try {
      if (data.isSuccess()) {
        return Success(ServiceApi.fromMap(data.tryGetSuccess()!).mapToDomain());
      }
    } catch (e) {
      getLogger('ServiceRepository').e(e.toString());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteAppointment(String uid) async {
    var data = await processRequest(() => apiService.deleteAppointment(uid));
    if (data.isSuccess()) {
      return Success(data.tryGetSuccess());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteService(String uid) async {
    var data = await processRequest(() => apiService.deleteService(uid));
    if (data.isSuccess()) {
      return Success(data.tryGetSuccess());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> setActive(String uid,
      {bool isActive = false}) async {
    var data = await processRequest(
        () => apiService.setServiceAsActive(uid, isActive: isActive));
    if (data.isSuccess()) {
      return Success(data.tryGetSuccess());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Appointment, Exception>> getAppointment(String uid) async {
    var data = await processRequest(() => apiService.getAppointment(uid));
    if (data.isSuccess()) {
      return Success(
          AppointmentApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Appointment, Exception>> getAppointmentRequest(
      String uid) async {
    var data =
        await processRequest(() => apiService.getAppointmentRequest(uid));
    if (data.isSuccess()) {
      return Success(
          AppointmentApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Appointment>, Exception>> getAppointmentRequests(
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getAppointmentRequests(request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AppointmentApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Appointment>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('ServiceRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Appointment>());
  }

  @override
  Future<Result<Pagination<Appointment>, Exception>> getAppointments(
      {PaginationRequest? request}) async {
    var response = await processRequest(
        () => apiService.getAppointments(request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => AppointmentApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Appointment>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('ServiceRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Appointment>());
  }

  @override
  Future<Result<Pagination<Service>, Exception>> getProviderServices(
      String providerUid) async {
    var response =
        await processRequest(() => apiService.getProviderServices(providerUid));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      try {
        final data = paginationResponse.data
            ?.map((e) => ServiceApi.fromMap(e).mapToDomain())
            .toList();
        return Success(Pagination<Service>(
            data: data ?? [],
            hasNext: paginationResponse.hasNext,
            last: paginationResponse.last));
      } catch (e) {
        getLogger('ServiceRepositoryImpl').e(e);
      }
    }
    return const Success(Pagination<Service>());
  }

  @override
  Future<Result<Service, Exception>> getService(
      String providerUid, String uid) async {
    var data =
        await processRequest(() => apiService.getService(providerUid, uid));
    if (data.isSuccess()) {
      return Success(ServiceApi.fromMap(data.tryGetSuccess()!).mapToDomain());
    }
    return Error(data.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> updateAppointmentStatus(
      AppointmentStatus status, Appointment appointment) async {
    var data = await processRequest(
        () => apiService.updateAppointmentStatus(status, appointment));
    if (data.isSuccess()) {
      return const Success(true);
    }
    return Error(data.tryGetError()!);
  }
}
