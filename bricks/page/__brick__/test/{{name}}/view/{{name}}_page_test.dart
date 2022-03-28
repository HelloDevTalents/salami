// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salami/{{name}}/view/{{name}}_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('App', () {
    test('has route', () {
      expect(
        {{#pascalCase}}{{name}}{{/pascalCase}}Page.route(),
        isA<MaterialPageRoute<void>>(),
      );
    });
    testWidgets('renders {{#pascalCase}}{{name}}{{/pascalCase}}Page by route', (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => {{#pascalCase}}{{name}}{{/pascalCase}}Page.route(),
        ),
      );

      expect(find.byType({{#pascalCase}}{{name}}{{/pascalCase}}Page), findsOneWidget);
    });
    group('{{#pascalCase}}{{name}}{{/pascalCase}}Page', () {
      testWidgets('renders {{#pascalCase}}{{name}}{{/pascalCase}}View', (tester) async {
        await tester.pumpApp(const {{#pascalCase}}{{name}}{{/pascalCase}}Page());
        expect(find.byType({{#pascalCase}}{{name}}{{/pascalCase}}View), findsOneWidget);
      });
    });
  });
}
