import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  /// {@template HomeCubit}
  /// Initialization function HomeCubit
  /// {@endtemplate}
  Future<void> init() async {
    emit(
      const HomeState(status: HomeStatus.success),
    );
  }

  /// {@template HomeCubit}
  /// Zmiana wartości counter +1
  /// {@endtemplate}
  void increment() => emit(
        HomeState(
          status: HomeStatus.success,
          counter: state.counter + 1,
        ),
      );

  /// {@template HomeCubit}
  /// Zmiana wartości counter -1
  /// {@endtemplate}
  void decrement() => emit(
        HomeState(
          status: HomeStatus.success,
          counter: state.counter - 1,
        ),
      );
}
