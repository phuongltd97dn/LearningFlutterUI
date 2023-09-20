import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text('TODO', style: TextStyle(fontSize: 40.0)),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.isCompleted)
                .toList()
                .length;

            context
                .read<ActiveTodoCountBloc>()
                .add(CalculateActiveTodoCountEvent(
                  activeTodoCount: activeTodoCount,
                ));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} items left',
                style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
              );
            },
          ),
        ),
        // BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activeTodoCount} items left',
        //       style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
        //     );
        //   },
        // ),
      ],
    );
  }
}
