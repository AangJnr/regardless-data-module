import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/data/model/paginated_response.dart';
import 'package:regardless_data_module/domain/media.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_finalize_payload.dart';
import 'package:regardless_data_module/domain/model/media_upload/direct_media_upload_init.dart';
import 'package:regardless_data_module/domain/model/pagination.dart';
import 'package:regardless_data_module/domain/model/activity_from_image_result.dart';

abstract class MediaRepository {
  Future<Result<List<HashImage>, Exception>> uploadImages(List<XFile> images);
  Future<Result<List<String>, Exception>> getDescriptionSuggessions(
      String text);
  Future<Result<ActivityFromImageResult, Exception>> extractActivityFromImage(
      XFile image);
  Future<Result<List<DirectMediaUploadInit>, Exception>> initProviderMedia(
      String providerUid, List<XFile> files);
  Future<Result<List<Media>, Exception>> finalizeProviderMedia(
      String providerUid, List<DirectMediaUploadFinalizePayload> uploads);

  Future<Result<List<Media>, Exception>> uploadProviderMedia(
      String uid, List<XFile> files);
  Future<Result<Pagination<Media>, Exception>> getProviderMedia(String uid,
      {PaginationRequest? request});
  Future<Result<bool, Exception>> deleteProviderMedia(
      String uid, List<String> uids);
}
