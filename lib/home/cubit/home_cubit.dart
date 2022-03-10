import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> fetchAll() async {
    emit(
      const HomeState(
        status: HomeStatus.loading,
      ),
    );

    emit(
      const HomeState(
        status: HomeStatus.success,
      ),
    );
  }
}
