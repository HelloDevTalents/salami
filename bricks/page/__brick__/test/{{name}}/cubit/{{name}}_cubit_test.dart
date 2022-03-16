import 'package:flutter_test/flutter_test.dart';
import 'package:salami/{{name}}/{{name}}.dart';

void main() {
  group('homeCubit', () {
    test('initial state is correct', () {
      expect(
        {{#pascalCase}}{{name}}{{/pascalCase}}Cubit().state,
        equals({{#pascalCase}}{{name}}{{/pascalCase}}State.initial()),
      );
    });

    test('Constructor returns normally', () {
      expect(
        {{#pascalCase}}{{name}}{{/pascalCase}}Cubit.new,
        returnsNormally,
      );
    });
  });
}
