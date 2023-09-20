part of 'filtered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filtedTodos;

  const FilteredTodoState({required this.filtedTodos});

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filtedTodos: []);
  }

  @override
  List<Object> get props => [filtedTodos];

  FilteredTodoState copyWith({List<Todo>? filtedTodos}) {
    return FilteredTodoState(
      filtedTodos: filtedTodos ?? this.filtedTodos,
    );
  }
}
