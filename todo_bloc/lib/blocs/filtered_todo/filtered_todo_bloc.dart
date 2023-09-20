// import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_bloc/blocs/todo_filter/todo_filter_bloc.dart';
// import 'package:todo_bloc/blocs/todo_list/todo_list_bloc.dart';
// import 'package:todo_bloc/blocs/todo_search/todo_search_bloc.dart';

import '../../models/todo_model.dart';

part 'filtered_todo_event.dart';
part 'filtered_todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  // final TodoFilterBloc todoFilterBloc;
  // final TodoSearchBloc todoSearchBloc;
  // final TodoListBloc todoListBloc;
  final List<Todo> initFilteredTodos;

  // late final StreamSubscription todoFilterSubscription;
  // late final StreamSubscription todoSearchSubscription;
  // late final StreamSubscription todoListSubscription;

  FilteredTodoBloc({
    // required this.todoFilterBloc,
    // required this.todoSearchBloc,
    // required this.todoListBloc,
    required this.initFilteredTodos,
  }) : super(FilteredTodoState(filtedTodos: initFilteredTodos)) {
    // todoFilterSubscription = todoFilterBloc.stream.listen(
    //   (TodoFilterState todoFilterState) => _setFilteredTodos(),
    // );
    //
    // todoSearchSubscription = todoSearchBloc.stream.listen(
    //   (TodoSearchState todoSearchState) => _setFilteredTodos(),
    // );
    //
    // todoListSubscription = todoListBloc.stream.listen(
    //   (TodoListState todoListState) => _setFilteredTodos(),
    // );

    on<CalculateFilteredTodosEvent>(_calcFilteredTodos);
    on<SetFilteredTodosEvent>(_setFilteredTodos);
  }

  void _calcFilteredTodos(
    CalculateFilteredTodosEvent event,
    Emitter<FilteredTodoState> emit,
  ) {
    emit(state.copyWith(filtedTodos: event.filteredTodos));
  }

  void _setFilteredTodos(
    SetFilteredTodosEvent event,
    Emitter<FilteredTodoState> emit,
  ) {
    List<Todo> filteredTodos;

    switch (event.filter) {
      case Filter.active:
        filteredTodos = event.todos.where((Todo todo) {
          return !todo.isCompleted;
        }).toList();
        break;
      case Filter.completed:
        filteredTodos = event.todos.where((Todo todo) {
          return todo.isCompleted;
        }).toList();
        break;
      case Filter.all:
      default:
        filteredTodos = event.todos;
        break;
    }

    if (event.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos.where((Todo todo) {
        return todo.desc.toLowerCase().contains(event.searchTerm);
      }).toList();
    }

    add(CalculateFilteredTodosEvent(filteredTodos: filteredTodos));
  }

  // void _setFilteredTodos() {
  //   List<Todo> filteredTodos;
  //
  //   switch (todoFilterBloc.state.filter) {
  //     case Filter.active:
  //       filteredTodos = todoListBloc.state.todos.where((Todo todo) {
  //         return !todo.isCompleted;
  //       }).toList();
  //       break;
  //     case Filter.completed:
  //       filteredTodos = todoListBloc.state.todos.where((Todo todo) {
  //         return todo.isCompleted;
  //       }).toList();
  //       break;
  //     case Filter.all:
  //     default:
  //       filteredTodos = todoListBloc.state.todos;
  //       break;
  //   }
  //
  //   final searchTerm = todoSearchBloc.state.searchTerm;
  //   if (searchTerm.isNotEmpty) {
  //     filteredTodos = filteredTodos.where((Todo todo) {
  //       return todo.desc.toLowerCase().contains(searchTerm);
  //     }).toList();
  //   }
  //
  //   add(CalculateFilteredTodosEvent(filteredTodos: filteredTodos));
  // }

  // @override
  // Future<void> close() {
  //   todoFilterSubscription.cancel();
  //   todoSearchSubscription.cancel();
  //   todoListSubscription.cancel();

  //   return super.close();
  // }
}
