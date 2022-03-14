// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami/app/app.dart';
import 'package:salami/home/home.dart';
import 'package:salami_api/salami_api.dart';
import 'package:salami_repository/salami_repository.dart';

class MockSalamiRepository extends Mock implements SalamiRepository {}

class MockSalamiApi extends Mock implements SalamiApi {}

void main() {
  late SalamiRepository salamiRepository;
  late SalamiApi salamiApi;

  setUp(() {
    salamiApi = MockSalamiApi();

    salamiRepository = SalamiRepository(salamiApi);
  });

  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          salamiRepository: salamiRepository,
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
