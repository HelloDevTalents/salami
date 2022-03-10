part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success }

class HomeState extends Equatable {
  const HomeState({
    required this.status,
  });
  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
      );
  final HomeStatus status;

  @override
  List<Object?> get props => [status];
}
