// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{name}}_state.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Cubit extends Cubit<{{#pascalCase}}{{name}}{{/pascalCase}}State> {
  {{#pascalCase}}{{name}}{{/pascalCase}}Cubit() : super({{#pascalCase}}{{name}}{{/pascalCase}}State.initial());

  Future<void> fetchAll() async {
    emit(
      const {{#pascalCase}}{{name}}{{/pascalCase}}State(status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success),
    );
  }

  void increment() => emit(
        {{#pascalCase}}{{name}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success,
          counter: state.counter + 1,
        ),
      );

  void decrement() => emit(
        {{#pascalCase}}{{name}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.success,
          counter: state.counter - 1,
        ),
      );
}
