// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:multiple_result/multiple_result.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/utils/internet_util.dart';
import '../../../domain/model/session_manager.dart';
import '../../../domain/api/api_service.dart';

const TokenExpired = "Token expired";
mixin BaseRepository {
  final _sessionManager = module<SessionManager>();
  final ApiService _apiService = module<ApiService>();

  SessionManager get sessionManager => _sessionManager;
  ApiService get apiService => _apiService;

  Future<Result<dynamic, Exception>> processRequest(Function request) async {
    if (await InternetUtil.isConnected()) {
      try {
        var response = (await request()) as Response;

        final dynamic r = jsonDecode(response.body);
        getLogger("BaseRepository")
            .i(" ${response.statusCode}\nresponseBody: $r}");

        if (response.statusCode >= 400) {
          return Error(Exception(parseErrors(r)));
        }
        return Success((r as Map<String, dynamic>)['data']);
      } catch (e) {
        getLogger("Error").e("$e");
        return Error(Exception(parseErrors(e)));
      }
    } else {
      getLogger("BaseRepository").i('No internet connection available');
      return Error(Exception('No internet connection available'));
    }
  }

  Future<bool> processMultiPartRequest(Function request) async {
    if (await InternetUtil.isConnected()) {
      try {
        var streamedResponse = (await request());
        final response = await Response.fromStream(streamedResponse);
        var data = json.decode(response.body);

        getLogger("BaseRepository")
            .i("response status code : ${response.statusCode}");
        getLogger("BaseRepository").i("response body : $data");
        var statusCode = response.statusCode;
        if (statusCode >= 400) {
          return false;
        }
        return statusCode == 200;
      } catch (e) {
        getLogger("BaseRepositoryHa").e("$e");
        rethrow;
      }
    } else {
      getLogger("BaseRepository").i('No internet connection available');
      throw Exception('No internet connection available');
    }
  }

  String parseErrors(dynamic errorResponse) {
    getLogger("BaseRepository").e('$errorResponse');

    if (errorResponse is List<dynamic>) {
      return errorResponse
          .fold('', (previousValue, element) => '$previousValue$element\n')
          .trim();
    }
    //{non_field_errors: [Unable to log in with provided credentials.]}

    if (errorResponse is Map<String, dynamic>) {
      return errorResponse['message'];
    }

    return errorResponse
        .toString()
        .replaceAll('false', '')
        .replaceAll('null', '')
        .trim();
  }
}
