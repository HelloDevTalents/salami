import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> init() async {
    emit(
      const HomeState(status: HomeStatus.success),
    );
  }

  void increment() => emit(
        HomeState(
          status: HomeStatus.success,
          counter: state.counter + 1,
        ),
      );

  void decrement() => emit(
        HomeState(
          status: HomeStatus.success,
          counter: state.counter - 1,
        ),
      );
}
