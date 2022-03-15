// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:salami/{{name}}/{{name}}.dart';

void main() {
  group('{{#snakeCase}}{{name}}{{/snakeCase}}State', () {
    test('supports value comparison', () {
      expect(
        {{#pascalCase}}{{name}}{{/pascalCase}}State.initial(),
        {{#pascalCase}}{{name}}{{/pascalCase}}State.initial(),
      );
    });
  });
}
