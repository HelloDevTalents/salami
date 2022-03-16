// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salami/{{name}}/cubit/{{name}}_cubit.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Page extends StatelessWidget {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Page({Key? key}) : super(key: key);

  static Route<{{#pascalCase}}{{name}}{{/pascalCase}}Page> route() {
    return MaterialPageRoute(
      builder: (context) => const {{#pascalCase}}{{name}}{{/pascalCase}}Page(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{#pascalCase}}{{name}}{{/pascalCase}}Cubit()..init(),
      child: const {{#pascalCase}}{{name}}{{/pascalCase}}View(),
    );
  }
}

class {{#pascalCase}}{{name}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{name}}{{/pascalCase}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
