part of 'filtered_todo_bloc.dart';

sealed class FilteredTodoEvent extends Equatable {
  const FilteredTodoEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredTodosEvent extends FilteredTodoEvent {
  final List<Todo> filteredTodos;

  const CalculateFilteredTodosEvent({required this.filteredTodos});

  @override
  List<Object> get props => [filteredTodos];
}

class SetFilteredTodosEvent extends FilteredTodoEvent {
  final Filter filter;
  final List<Todo> todos;
  final String searchTerm;

  const SetFilteredTodosEvent({
    required this.filter,
    required this.todos,
    required this.searchTerm,
  });

  @override
  List<Object> get props => [filter, todos, searchTerm];
}
