import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami/utils/first_launch/first_launch_callback.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyClass {
  void dummyCallback() {}
}

class MockedDummyClass extends Mock implements DummyClass {}

void main() {
  late DummyClass dummyClass;
  late SharedPreferences prefs;
  final subject = OnFirstLaunch();

  setUp(() async {
    prefs = await SharedPreferences.getInstance();
    dummyClass = MockedDummyClass();
    when(
      () => dummyClass.dummyCallback(),
    ).thenAnswer((invocation) {});
  });

  tearDownAll(() async => prefs.clear());

  group('OnFirstLaunch', () {
    test('constructor returns normally', () {
      expect(
        () => subject,
        returnsNormally,
      );
    });

    group('.init', () {
      test('calls passed callback when value is not present in storage',
          () async {
        await prefs.clear();
        await OnFirstLaunch.execute(() => dummyClass.dummyCallback());
        verify(() => dummyClass.dummyCallback()).called(1);
      });
      test('does nothing when value is present in storage', () async {
        await prefs.clear();
        SharedPreferences.setMockInitialValues(
          <String, Object>{
            OnFirstLaunch.firstLaunch: false,
          },
        );
        await OnFirstLaunch.execute(() => dummyClass.dummyCallback());
        verifyNever(() => dummyClass.dummyCallback());
      });

      test('throws WrongTypeException when value is not bool', () async {
        await prefs.clear();
        SharedPreferences.setMockInitialValues(
          <String, Object>{
            OnFirstLaunch.firstLaunch: 'wrong type',
          },
        );

        expect(
          () async => OnFirstLaunch.execute(() => dummyClass.dummyCallback()),
          throwsA(isA<WrongTypeException>()),
        );
      });
    });
  });
}
