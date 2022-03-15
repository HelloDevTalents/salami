// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of '{{name}}_cubit.dart';

enum {{#pascalCase}}{{name}}{{/pascalCase}}Status { initial, loading, success }

class {{#pascalCase}}{{name}}{{/pascalCase}}State extends Equatable {
  const {{#pascalCase}}{{name}}{{/pascalCase}}State({
    required this.status,
    this.counter = 0,
  });
  factory {{#pascalCase}}{{name}}{{/pascalCase}}State.initial() => const {{#pascalCase}}{{name}}{{/pascalCase}}State(
        status: {{#pascalCase}}{{name}}{{/pascalCase}}Status.initial,
      );
  final {{#pascalCase}}{{name}}{{/pascalCase}}Status status;
  final int counter;

  @override
  List<Object?> get props => [status, counter];
}
