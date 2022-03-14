// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
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
import 'package:salami/home/home.dart';
import 'package:salami_api/salami_api.dart';
import 'package:salami_repository/salami_repository.dart';

import '../../helpers/pump_app.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockSalamiRepository extends Mock implements SalamiRepository {}

class MockSalamiApi extends Mock implements SalamiApi {}

void main() {
  late HomeCubit homeCubit;
  late SalamiRepository salamiRepository;
  late SalamiApi salamiApi;

  setUp(() {
    homeCubit = MockHomeCubit();
    salamiApi = MockSalamiApi();
    salamiRepository = SalamiRepository(salamiApi);
    when(() => homeCubit.state).thenAnswer((invocation) => HomeState.initial());
  });
  group('App', () {
    test('has route', () {
      expect(
        HomePage.route(),
        isA<MaterialPageRoute<void>>(),
      );
    });
    testWidgets('renders HomePage by route', (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateRoute: (_) => HomePage.route(),
        ),
      );

      expect(find.byType(HomePage), findsOneWidget);
    });
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(salamiRepository: salamiRepository),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
    group('HomePage', () {
      testWidgets('renders HomeView', (tester) async {
        await tester.pumpApp(const HomePage());
        expect(find.byType(HomeView), findsOneWidget);
      });
    });
    group('HomeCubit', () {
      testWidgets('renders current count', (tester) async {
        await tester.pumpApp(
          BlocProvider(
            create: (context) => homeCubit,
            child: const HomePage(),
          ),
        );
        final testWidget = find.byKey(const Key('counter-text'));
        final scrollView = find.byKey(const Key('home-scroll-view'));
        await tester.dragUntilVisible(
          testWidget,
          scrollView,
          const Offset(0, -500),
        );
        expect(find.byKey(const Key('counter-text')), findsOneWidget);
      });
      testWidgets('calls increment when increment button is tapped',
          (tester) async {
        await tester.pumpApp(
          BlocProvider(
            create: (context) => homeCubit,
            child: const HomePage(),
          ),
        );
        await tester.tap(find.byKey(const Key('action-button-increment')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('counter-text')), findsOneWidget);
      });
      testWidgets('calls increment when decrement button is tapped',
          (tester) async {
        await tester.pumpApp(
          BlocProvider(
            create: (context) => homeCubit,
            child: const HomePage(),
          ),
        );
        await tester.tap(find.byKey(const Key('action-button-decrement')));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('counter-text')), findsOneWidget);
      });
    });
  });
}
