import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/domain/media.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_finalize_payload.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_init.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import '../../../domain/model/activity_from_image_result.dart';
import '../../../domain/repositories/media_repository.dart';
import 'base_repository.dart';

class MediaRepositoryImpl with BaseRepository implements MediaRepository {
  @override
  Future<Result<List<HashImage>, Exception>> uploadImages(
      List<XFile> images) async {
    final results =
        await processMultiPartRequest(() => apiService.uploadImages(images));
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => HashImageMapper.fromMap(e as Map<String, dynamic>))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<String>, Exception>> getDescriptionSuggessions(
      String text) async {
    final results = await processRequest(
        () => apiService.generateDescriptionSuggestions(text));
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => e.toString())
          .where((element) => element.isNotEmpty)
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<ActivityFromImageResult, Exception>> extractActivityFromImage(
      XFile image) async {
//
    final results = await processMultiPartRequest(
        () => apiService.generateActivityFromImage(image));
    if (results.isSuccess()) {
      final raw = results.tryGetSuccess();
      if (raw is Map<String, dynamic>) {
        return Success(ActivityFromImageResult.fromMap(raw));
      }
      if (raw is Map) {
        return Success(
            ActivityFromImageResult.fromMap(Map<String, dynamic>.from(raw)));
      }
      return Error(Exception('Unexpected response from server'));
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<DirectMediaUploadInit>, Exception>> initProviderMedia(
      String providerUid, List<XFile> files) async {
    final results = await processRequest(
        () => apiService.initProviderMedia(providerUid, files));
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => DirectMediaUploadInitMapper.fromMap(e))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<Media>, Exception>> finalizeProviderMedia(
      String providerUid,
      List<DirectMediaUploadFinalizePayload> uploads) async {
    final results = await processRequest(
        () => apiService.finalizeProviderMedia(providerUid, uploads));
    if (results.isSuccess()) {
      final data = (results.tryGetSuccess()! as List<dynamic>)
          .map((e) => MediaMapper.fromMap(e as Map<String, dynamic>))
          .toList();
      return Success(data);
    }
    return Error(results.tryGetError()!);
  }

  @override
  Future<Result<List<Media>, Exception>> uploadProviderMedia(
      String uid, List<XFile> files) async {
    final response = await processMultiPartRequest(
        () => apiService.uploadProviderMedia(uid, files));
    if (response.isSuccess()) {
      return Success((response.tryGetSuccess()! as List)
          .map((data) => MediaMapper.fromMap(data))
          .toList());
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<Pagination<Media>, Exception>> getProviderMedia(String uid,
      {PaginationRequest? request}) async {
    final response = await processRequest(
        () => apiService.getProviderMedia(uid, request: request));
    if (response.isSuccess()) {
      final paginationResponse =
          PaginatedResponse.fromMap(response.tryGetSuccess()!);
      final parsed =
          paginationResponse.data?.map((e) => MediaMapper.fromMap(e)).toList();
      return Success(Pagination<Media>(
          data: parsed ?? [],
          hasNext: paginationResponse.hasNext,
          last: paginationResponse.last));
    }
    return Error(response.tryGetError()!);
  }

  @override
  Future<Result<bool, Exception>> deleteProviderMedia(
      String uid, List<String> uids) async {
    final response =
        await processRequest(() => apiService.deleteProviderMedia(uid, uids));
    return response.isSuccess()
        ? Success(true)
        : Error(response.tryGetError()!);
  }
}
