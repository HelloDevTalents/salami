import 'package:flutter_test/flutter_test.dart';
import 'package:salami/{{name}}/{{name}}.dart';

void main() {
  group('{{#pascalCase}}{{name}}{{/pascalCase}}State', () {
    test('supports value comparison', () {
      expect(
        {{#pascalCase}}{{name}}{{/pascalCase}}State.initial(),
        {{#pascalCase}}{{name}}{{/pascalCase}}State.initial(),
      );
    });
  });
}
