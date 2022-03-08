import 'package:app_api/app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// {@template request_failure}
/// Thrown if an exception occurs while making an 'http' request
/// {@endtemplate}
class RequestException implements Exception {
  /// {@macro request_failure}
  const RequestException(this.statusCode);

  /// The status code of the response.
  final int? statusCode;
}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template app_api}
/// A Dart API Client for the App API
/// {@endtemplate}
class AppApi {
  /// {@macro app_api}
  const AppApi(
    this._dio,
    this._flutterSecureStorage,
    this._baseUrls,
  );

  final Dio _dio;
  final FlutterSecureStorage _flutterSecureStorage;
  final BaseUrls _baseUrls;

  /// Global definition for access token key
  static const String accessTokenKey = 'access-token';

  /// Example auth request
  ///
  /// REST call: `GET /authorization`
  Future<AuthResponse> exampleAuthRequest(String code) async {
    try {
      _dio.options.headers.clear();
      _dio.options.baseUrl = _baseUrls.api;
      final respone = await _dio.post<Map<String, dynamic>>(
        '/authorization',
        data: <String, dynamic>{
          'code': code,
        },
        options: Options(
          headers: <String, dynamic>{'content-type': 'application/json'},
        ),
      );
      final decodedResponse = AuthResponse.fromJson(respone.data!);
      await _flutterSecureStorage.write(
        key: accessTokenKey,
        value: decodedResponse.accessToken,
      );
      _dio.options.headers.addAll(<String, String>{
        'Authorization': decodedResponse.authhorization,
        'content-type': 'application/json'
      });
      return decodedResponse;
    } on DioError catch (e) {
      throw RequestException(e.response?.statusCode);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }
}
