import 'dart:convert';

import 'package:app_api/app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  late String path;
  group('AppApi', () {
    late Dio dio;
    late AppApi subject;
    late DioAdapterMock dioAdapter;
    late FlutterSecureStorage flutterSecureStorage;

    final urls = BaseUrls(
      api: 'https://test.api.url',
    );

    final testResponse = AuthResponse(
      accessToken: '123',
    );

    setUp(() {
      dio = Dio();
      path = '/authorization';
      dioAdapter = DioAdapterMock();
      dio.httpClientAdapter = dioAdapter;
      flutterSecureStorage = FlutterSecureStorageMock();
      subject = AppApi(dio, flutterSecureStorage, urls);
      registerFallbackValue(RequestOptions(path: path));
    });

    final response = ResponseBody.fromString(jsonEncode(testResponse), 200);

    test('can be instantiated', () {
      expect(AppApi(dio, flutterSecureStorage, urls), isNotNull);
    });

    test('constructor returns normally', () {
      expect(
        () => AppApi(dio, flutterSecureStorage, urls),
        returnsNormally,
      );
    });

    group('.exampleAuthRequest', () {
      setUp(() {
        when(
          () => dioAdapter.fetch(
            any(),
            any(),
            any(),
          ),
        ).thenAnswer((_) async => response);
      });

      test('throws RequestException when dio client throws exception', () {
        when(() => dioAdapter.fetch(any(), any(), any())).thenThrow(
          () async => DioError(
            requestOptions: RequestOptions(path: any(named: path)),
          ),
        );

        expect(
          () => subject.exampleAuthRequest('code'),
          throwsA(isA<RequestException>()),
        );
      });

      test(
        'throws JsonDecodeException when decoding response fails',
        () {
          final responsepayload = jsonEncode({'response_code': '1000'});
          when(() => dioAdapter.fetch(any(), any(), any())).thenAnswer(
            (_) async => ResponseBody.fromString(
              responsepayload,
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            ),
          );

          expect(
            () => subject.exampleAuthRequest('code'),
            throwsA(isA<JsonDeserializationException>()),
          );
        },
      );

      test(
        'throws RequestException when status code is 400',
        () {
          final responsepayload = jsonEncode({'response_code': '1000'});
          when(() => dioAdapter.fetch(any(), any(), any())).thenAnswer(
            (_) async => ResponseBody.fromString(
              responsepayload,
              400,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            ),
          );

          expect(
            () => subject.exampleAuthRequest('code'),
            throwsA(isA<RequestException>()),
          );
        },
      );

      test(
        'returns test response',
        () async {
          final responsepayload = jsonEncode(testResponse.toJson());
          when(() => dioAdapter.fetch(any(), any(), any())).thenAnswer(
            (_) async => ResponseBody.fromString(
              responsepayload,
              200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType],
              },
            ),
          );

          final response = await subject.exampleAuthRequest('code');

          expect(
            response,
            equals(testResponse),
          );
        },
      );

      /*test(
        'throws JsonDecodeException when decoding response fails',
        () {
          when(() => dioAdapter.fetch(any(), any(), any())).thenAnswer(
            (_) async => ResponseBody(
              Stream.value(Uint8List(1)),
              200,
            ),
          );

          expect(
            () => subject.exampleAuthRequest('code'),
            throwsA(isA<JsonDeserializationException>()),
          );
        },
      ); */
    });
  });
}
