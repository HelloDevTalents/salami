// Copyright (c) 2022, DEVTALENTS
// https://devtalents.com
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salami/app/app.dart';
import 'package:salami/{{name}}/{{name}}.dart';
import 'package:salami_api/salami_api.dart';
import 'package:salami_repository/salami_repository.dart';

import '../../helpers/pump_app.dart';

class Mock{{#pascalCase}}{{name}}{{/pascalCase}}Cubit extends MockCubit<{{#pascalCase}}{{name}}{{/pascalCase}}State> implements {{#pascalCase}}{{name}}{{/pascalCase}}Cubit {}

class MockSalamiRepository extends Mock implements SalamiRepository {}

class MockSalamiApi extends Mock implements SalamiApi {}

void main() {
  late {{#pascalCase}}{{name}}{{/pascalCase}}Cubit cubit;
  late SalamiRepository salamiRepository;
  late SalamiApi salamiApi;

  setUp(() {
    cubit = Mock{{#pascalCase}}{{name}}{{/pascalCase}}Cubit();
    salamiApi = MockSalamiApi();
    salamiRepository = SalamiRepository(salamiApi);
    when(() => cubit.state).thenAnswer((invocation) => {{#pascalCase}}{{name}}{{/pascalCase}}State.initial());
  });
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
    testWidgets('renders {{#pascalCase}}{{name}}{{/pascalCase}}Page', (tester) async {
      await tester.pumpWidget(
        App(salamiRepository: salamiRepository),
      );
      expect(find.byType({{#pascalCase}}{{name}}{{/pascalCase}}Page), findsOneWidget);
    });
    group('{{#pascalCase}}{{name}}{{/pascalCase}}Page', () {
      testWidgets('renders {{#pascalCase}}{{name}}{{/pascalCase}}View', (tester) async {
        await tester.pumpApp(const {{#pascalCase}}{{name}}{{/pascalCase}}Page());
        expect(find.byType({{#pascalCase}}{{name}}{{/pascalCase}}View), findsOneWidget);
      });
    });
    group('{{#pascalCase}}{{name}}{{/pascalCase}}Cubit', () {
      testWidgets('renders current count', (tester) async {
        await tester.pumpApp(
          BlocProvider(
            create: (context) => cubit,
            child: const {{#pascalCase}}{{name}}{{/pascalCase}}Page(),
          ),
        );
        final testWidget = find.byKey(const Key('counter-text'));
        final scrollView = find.byKey(const Key('{{#snakeCase}}{{name}}{{/snakeCase}}-scroll-view'));
        await tester.dragUntilVisible(
          testWidget,
          scrollView,
          const Offset(0, -500),
        );
        expect(find.byKey(const Key('counter-text')), findsOneWidget);
      });
      testWidgets('calls increment when increment button is tapped',
          (tester) async {
        when(() => cubit.state.counter).thenReturn(0);
        when(() => cubit.increment()).thenReturn(null);
        await tester.pumpApp(
          BlocProvider(
            create: (context) => cubit,
            child: const {{#pascalCase}}{{name}}{{/pascalCase}}Page(),
          ),
        );
        await tester.tap(find.byKey(const Key('action-button-increment')));
        verifyNever(() => cubit.increment()).called(0);
      });
      testWidgets('calls increment when decrement button is tapped',
          (tester) async {
        when(() => cubit.state.counter).thenReturn(1);
        when(() => cubit.increment()).thenReturn(null);
        await tester.pumpApp(
          BlocProvider(
            create: (context) => cubit,
            child: const {{#pascalCase}}{{name}}{{/pascalCase}}Page(),
          ),
        );
        await tester.tap(find.byKey(const Key('action-button-decrement')));
        verifyNever(() => cubit.decrement()).called(0);
      });
    });
  });
}
