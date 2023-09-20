// import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../models/todo_model.dart';
// import '../todo_list/todo_list_bloc.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  // final TodoListBloc todoListBloc;
  final int initCount;

  // late final StreamSubscription todoListSubscription;

  ActiveTodoCountBloc({
    // required this.todoListBloc,
    required this.initCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initCount)) {
    // todoListSubscription = todoListBloc.stream.listen(
    //   (TodoListState todoListState) {
    //     final int currentActiveTodoCount = todoListState.todos
    //         .where((Todo todo) => !todo.isCompleted)
    //         .toList()
    //         .length;

    //     add(CalculateActiveTodoCountEvent(
    //       activeTodoCount: currentActiveTodoCount,
    //     ));
    //   },
    // );

    on<CalculateActiveTodoCountEvent>(_calcActiveTodoCount);
  }

  void _calcActiveTodoCount(
    CalculateActiveTodoCountEvent event,
    Emitter<ActiveTodoCountState> emit,
  ) {
    emit(state.copyWith(activeTodoCount: event.activeTodoCount));
  }

  // @override
  // Future<void> close() {
  //   todoListSubscription.cancel();
  //   return super.close();
  // }
}
