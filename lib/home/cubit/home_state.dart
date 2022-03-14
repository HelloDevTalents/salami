part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success }

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.counter = 0,
  });
  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
      );
  final HomeStatus status;
  final int counter;

  @override
  List<Object?> get props => [status, counter];
}
