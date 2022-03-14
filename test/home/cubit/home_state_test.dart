import 'package:flutter_test/flutter_test.dart';
import 'package:salami/home/home.dart';

void main() {
  group('HomeState', () {
    test('supports value comparison', () {
      expect(
        HomeState.initial(),
        HomeState.initial(),
      );
    });
  });
}
