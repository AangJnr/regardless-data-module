import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';
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
}
