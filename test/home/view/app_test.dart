// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salami/app/app.dart';
import 'package:salami/home/home.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('App', () {
    test('has route', () {
      expect(
        HomePage.route(),
        isA<MaterialPageRoute<void>>(),
      );
    });
    testWidgets('renders HomePage by route', (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => HomePage.route(),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
