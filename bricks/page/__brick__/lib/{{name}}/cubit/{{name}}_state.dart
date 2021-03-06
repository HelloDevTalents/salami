// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of '{{name}}_cubit.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}State extends Equatable {
  const {{#pascalCase}}{{name}}{{/pascalCase}}State({
    required this.isLoading,
    required this.hasError,
  });
  factory {{#pascalCase}}{{name}}{{/pascalCase}}State.initial() => const {{#pascalCase}}{{name}}{{/pascalCase}}State(
        isLoading: true,
        hasError: false,
      );
  final bool isLoading;
  final bool hasError;

  @override
  List<Object?> get props => [isLoading, hasError];
}
