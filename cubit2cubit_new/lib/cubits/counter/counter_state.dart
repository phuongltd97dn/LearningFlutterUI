part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initital() {
    return const CounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  CounterState copyWith({int? counter}) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() => 'CounterState(counter: $counter)';
}
