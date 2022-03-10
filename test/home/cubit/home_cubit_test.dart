import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salami/home/home.dart';

void main() {
  group('homeCubit', () {
    test('initial state is correct', () {
      expect(
        HomeCubit().state,
        equals(HomeState.initial()),
      );
    });

    test('Constructor returns normally', () {
      expect(
        HomeCubit.new,
        returnsNormally,
      );
    });
    group('.fetchAll', () {
      blocTest<HomeCubit, HomeState>(
        'emits success status',
        build: HomeCubit.new,
        act: (cubit) => cubit.fetchAll(),
        expect: () => const [
          HomeState(status: HomeStatus.loading),
          HomeState(status: HomeStatus.success),
        ],
      );
    });
  });
}
