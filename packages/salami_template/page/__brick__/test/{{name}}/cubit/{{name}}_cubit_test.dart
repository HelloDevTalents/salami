// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salami/{{name}}/{{name}}.dart';

void main() {
  group('{{#snakeCase}}{{name}}{{/snakeCase}}Cubit', () {
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
    group('.fetchAll', () {
      blocTest<{{#pascalCase}}{{name}}{{/pascalCase}}Cubit, {{#pascalCase}}{{name}}{{/pascalCase}}State>(
        'emits success status',
        build: {{#pascalCase}}{{name}}{{/pascalCase}}Cubit.new,
        act: (cubit) => cubit.fetchAll(),
        expect: () => const [
          {{#pascalCase}}{{name}}{{/pascalCase}}State(status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success),
        ],
      );
    });
    test('initial state is 0', () {
      expect({{#pascalCase}}{{name}}{{/pascalCase}}Cubit().state.counter, equals(0));
    });
    blocTest<{{#pascalCase}}{{name}}{{/pascalCase}}Cubit, {{#pascalCase}}{{name}}{{/pascalCase}}State>(
      'emits [1] when increment is called',
      build: {{#pascalCase}}{{name}}{{/pascalCase}}Cubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [
        const {{#pascalCase}}{{name}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success,
          counter: 1,
        )
      ],
    );

    blocTest<{{#pascalCase}}{{name}}{{/pascalCase}}Cubit, {{#pascalCase}}{{name}}{{/pascalCase}}State>(
      'emits [-1] when decrement is called',
      build: {{#pascalCase}}{{name}}{{/pascalCase}}Cubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [
        const {{#pascalCase}}{{name}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success,
          counter: -1,
        )
      ],
    );
  });
}
