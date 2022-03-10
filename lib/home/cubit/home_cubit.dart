import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> fetchAll() async {
    emit(
      const HomeState(
        status: HomeStatus.loading,
      ),
    );

    try {
      emit(
        const HomeState(
          status: HomeStatus.success,
        ),
      );
    } on Exception {
      emit(
        const HomeState(
          status: HomeStatus.failure,
        ),
      );
    }
  }
}
