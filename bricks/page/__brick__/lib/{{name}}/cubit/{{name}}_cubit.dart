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

  /// {@template {{name}}}
  /// Initialization function {{#pascalCase}}{{name}}{{/pascalCase}}Cubit
  /// {@endtemplate}
  Future<void> init() async {}
}
