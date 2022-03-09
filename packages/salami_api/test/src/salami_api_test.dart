import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami_api/salami_api.dart';
import 'package:test/test.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  late String path;
  group('SalamiApi', () {
    late Dio dio;
    late SalamiApi subject;
    late DioAdapterMock dioAdapter;

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
      subject = SalamiApi(dio, urls);
      registerFallbackValue(RequestOptions(path: path));
    });

    final response = ResponseBody.fromString(jsonEncode(testResponse), 200);

    test('can be instantiated', () {
      expect(SalamiApi(dio, urls), isNotNull);
    });

    test('constructor returns normally', () {
      expect(
        () => SalamiApi(dio, urls),
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
          final responsepayload =
              jsonEncode({'definetely not': 'expected response'});
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
          final responsepayload = jsonEncode({'test': 'test'});
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
          final answer = ResponseBody.fromString(
            responsepayload,
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
          when(() => dioAdapter.fetch(any(), any(), any()))
              .thenAnswer((_) async => answer);

          final response = await subject.exampleAuthRequest('code');

          expect(
            response.accessToken,
            equals(testResponse.accessToken),
          );
        },
      );
    });
  });
}
