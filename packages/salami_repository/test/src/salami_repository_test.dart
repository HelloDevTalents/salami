// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami_api/salami_api.dart';
import 'package:salami_repository/salami_repository.dart';

class MockSalamiApiClient extends Mock implements SalamiApi {}

void main() {
  group('SalamiRepository', () {
    late SalamiApi salamiApi;
    late SalamiRepository salamiRepository;

    final response = AuthResponse(
      accessToken: '123',
    );

    setUp(() {
      salamiApi = MockSalamiApiClient();
      when(() => salamiApi.exampleAuthRequest('code'))
          .thenAnswer((_) async => response);

      when(() => salamiApi.isSignedIn).thenAnswer((invocation) => true);
      salamiRepository = SalamiRepository(salamiApi);
    });

    test('can be instantiated', () {
      expect(SalamiRepository(salamiApi), isNotNull);
    });

    test('Constructor returns normally', () {
      expect(
        () => SalamiRepository(salamiApi),
        returnsNormally,
      );
    });

    group('.exchangeCodeForToken', () {
      test('makes call', () {
        salamiRepository.exampleLogin('code');

        verify(() => salamiApi.exampleAuthRequest('code')).called(1);
      });

      test('returns correct data', () async {
        final response = await salamiRepository.exampleLogin('code');

        expect(response.accessToken, response.accessToken);
      });

      test('throws AuthException on DioError', () {
        when(() => salamiApi.exampleAuthRequest('code')).thenThrow(Exception());

        expect(
          () => salamiRepository.exampleLogin('code'),
          throwsA(isA<AuthException>()),
        );

        verify(() => salamiRepository.exampleLogin('code')).called(1);
      });
    });

    group('.isSignedIn', () {
      test('makes call', () {
        salamiRepository.isSignedIn;

        verify(() => salamiApi.isSignedIn).called(1);
      });

      test('returns true is access token is present', () {
        when(() => salamiApi.isSignedIn).thenAnswer((invocation) => true);

        final token = salamiRepository.isSignedIn;

        expect(token, true);
      });
      test('returns false is access token is not present', () {
        when(() => salamiApi.isSignedIn).thenAnswer((invocation) => false);

        final token = salamiRepository.isSignedIn;

        expect(token, false);
      });
    });
  });
}
