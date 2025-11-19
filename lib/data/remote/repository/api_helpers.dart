// ignore: depend_on_referenced_packages

// ignore_for_file: strict_top_level_inference

import 'package:cross_file/cross_file.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/services/social_auth_service.dart';
import '../../../domain/model/session_manager.dart';

mixin ApiHelpers {
  final log = getLogger('ApiServiceImpl');

  final sessionManager = module<SessionManager>();

  Future<Map<String, String>> getHeaders({bool isSecure = true}) async {
    final headersMap = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (isSecure) {
      final token = await module<SocialAuthService>().getToken();
      headersMap.putIfAbsent('Authorization', () => 'Token $token');

      // headersMap.putIfAbsent('Authorization', () => 'Iamnotahumanbeing@2');
    }
    return headersMap;
  }

  Map<String, String> getMultiPartHeaders() {
    return {
      'Authorization': 'Token ${sessionManager.getAccessToken()}',
      'Content-type': 'multipart/form-data',
      'Accept': '*/*'
    };
  }

  String toQueryParams(Map<String, dynamic> data) {
    String params = '';

    params += '?';

    data.forEach((k, v) {
      // if (v is List) {
      //   for (var item in v) {
      //     if (item != null && item.toString().isNotEmpty) {
      //       params += "$k[]=$item";
      //     }
      //   }
      // } else {
      if (v != null && v.toString().isNotEmpty) {
        params += "$k=$v";
      }
      //}
      params += "&";
    });

    return params.replaceRange(params.length - 1, params.length, '');
  }

  get(url, {required Map<String, String> headers}) {
    log.i("GET || url: $url");
    //log.i("headers: $headers");
    return http.get(Uri.parse(url), headers: headers);
  }

  post(url, {required Map<String, String> headers, body}) {
    log.i("POST || url: $url");
    //log.i("headers: $headers");
    log.i("body: $body");
    return http.post(Uri.parse(url), headers: headers, body: body);
  }

  delete(url, {required Map<String, String> headers, body}) {
    log.i("DELETE || url: $url");
    //log.i("headers: $headers");
    log.i("body: $body");
    return http.delete(Uri.parse(url), headers: headers, body: body);
  }

  patch(url, {required Map<String, String> headers, body}) {
    log.i("PATCH || url: $url");
    //log.i("headers: $headers");
    log.i("body: $body");
    return http.patch(Uri.parse(url), headers: headers, body: body);
  }

  put(url, {required Map<String, String> headers, body}) {
    log.i("url: $url");
    //log.i("headers: $headers");
    log.i("body: $body");
    return http.put(Uri.parse(url), headers: headers, body: body);
  }

  Future<Future<http.StreamedResponse>> patchMultipart(
    url, {
    required Map<String, String> headers,
    required List<ImageProperties> dataList,
  }) async {
    final request = http.MultipartRequest("PATCH", Uri.parse(url));
    log.i("url: $url");

    request.headers.addAll(headers);
    log.i("headers: ${request.headers}");

    request.files.add(await http.MultipartFile.fromPath(
        dataList.first.key, dataList.first.file.path));

    return request.send();
  }

  postMultipart(
    url, {
    required Map<String, String> headers,
    required List<ImageProperties> dataList,
  }) async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    log.i("url: $url");
    request.headers.addAll(headers);
    for (ImageProperties imageProp in dataList) {
      request.files.add(await http.MultipartFile.fromPath(
        "images",
        imageProp.file.path,
      ));
    }
    return request.send();
  }

  postWithFiles(url,
      {required Map<String, String> headers,
      body,
      List<ImageProperties> dataList = const []}) async {
    final request = http.MultipartRequest("POST", Uri.parse(url));
    log.i("POST || url: $url");

    request.headers.addAll(headers);
    log.i("headers: ${request.headers}");
    request.fields['data'] = body;
    for (ImageProperties f in dataList) {
      request.files.add(await http.MultipartFile.fromPath(f.key, f.file.path));
    }

    return request.send();
  }
}

class ImageProperties {
  String? uuid;
  String key;
  XFile file;
  ImageProperties(this.key, this.file, {this.uuid = ''});
}
