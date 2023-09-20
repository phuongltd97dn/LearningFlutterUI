// import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/todo_model.dart';
// import '../todo_filter/todo_filter_cubit.dart';
// import '../todo_list/todo_list_cubit.dart';
// import '../todo_search/todo_search_cubit.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  // final TodoFilterCubit todoFilterCubit;
  // final TodoSearchCubit todoSearchCubit;
  // final TodoListCubit todoListCubit;
  final List<Todo> initFilteredTodos;

  // late final StreamSubscription todoFilterSubscription;
  // late final StreamSubscription todoSearchSubscription;
  // late final StreamSubscription todoListSubscription;

  FilteredTodoCubit({
    // required this.todoFilterCubit,
    // required this.todoSearchCubit,
    // required this.todoListCubit,
    required this.initFilteredTodos,
  }) : super(FilteredTodoState(filtedTodos: initFilteredTodos));
  // {
  //
  //   todoFilterSubscription = todoFilterCubit.stream.listen(
  //     (TodoFilterState todoFilterState) => setFilteredTodos(),
  //   );
  //
  //   todoSearchSubscription = todoSearchCubit.stream.listen(
  //     (TodoSearchState todoSearchState) => setFilteredTodos(),
  //   );
  //
  //   todoListSubscription = todoListCubit.stream.listen(
  //     (TodoListState todoListState) => setFilteredTodos(),
  //   );
  //
  // }

  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> filteredTodos;

    // switch (todoFilterCubit.state.filter) {
    switch (filter) {
      case Filter.active:
        // filteredTodos = todoListCubit.state.todos
        filteredTodos = todos.where((Todo todo) => !todo.isCompleted).toList();
        break;
      case Filter.completed:
        // filteredTodos = todoListCubit.state.todos
        filteredTodos = todos.where((Todo todo) => todo.isCompleted).toList();
        break;
      case Filter.all:
      default:
        // filteredTodos = todoListCubit.state.todos;
        filteredTodos = todos;
        break;
    }

    // final searchTerm = todoSearchCubit.state.searchTerm;
    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos.where((Todo todo) {
        return todo.desc.toLowerCase().contains(searchTerm);
      }).toList();
    }

    emit(state.copyWith(filtedTodos: filteredTodos));
  }

  // @override
  // Future<void> close() {
  //   todoFilterSubscription.cancel();
  //   todoSearchSubscription.cancel();
  //   todoListSubscription.cancel();

  //   return super.close();
  // }
}
