// import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/todo_model.dart';
// import '../todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  // final TodoListCubit todoListCubit;
  final int initCount;
  // late final StreamSubscription todoListSubsciption;

  ActiveTodoCountCubit({
    // required this.todoListCubit,
    required this.initCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initCount));
  // {
  //   todoListSubsciption = todoListCubit.stream.listen(
  //     (TodoListState todoListState) {
  //       final int currentActiveTodoCount = todoListState.todos
  //           .where((Todo todo) => !todo.isCompleted)
  //           .toList()
  //           .length;

  //       emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
  //     },
  //   );
  // }

  // @override
  // Future<void> close() {
  //   todoListSubsciption.cancel();

  //   return super.close();
  // }

  void calcActiveTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
