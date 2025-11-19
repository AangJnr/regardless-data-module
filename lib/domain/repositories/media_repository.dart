import 'package:cross_file/cross_file.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/hash_image.dart';

abstract class MediaRepository {
  Future<Result<List<HashImage>, Exception>> uploadImages(List<XFile> images);
  Future<Result<List<String>, Exception>> getDescriptionSuggessions(String text);
}
