import 'package:dio/dio.dart';
import 'package:salami_api/salami_api.dart';

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

/// {@template salami_api}
/// A Dart API Client for the App API
/// {@endtemplate}
class SalamiApi {
  /// {@macro salami_api}
  const SalamiApi(
    this._dio,
    this._baseUrls,
  );

  final Dio _dio;
  final BaseUrls _baseUrls;

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

  /// Getter that checks if there're auth headers added
  bool get isSignedIn => _dio.options.headers.containsKey('Authorization');
}
