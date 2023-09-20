import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';

import '../models/todo_model.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodoBloc>().state.filtedTodos;

    return MultiBlocListener(
      listeners: [
        BlocListener<TodoFilterBloc, TodoFilterState>(
          listener: (context, filterState) {
            context.read<FilteredTodoBloc>().add(SetFilteredTodosEvent(
                  filter: filterState.filter,
                  todos: context.read<TodoListBloc>().state.todos,
                  searchTerm: context.read<TodoSearchBloc>().state.searchTerm,
                ));
          },
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, todosState) {
            context.read<FilteredTodoBloc>().add(SetFilteredTodosEvent(
                  filter: context.read<TodoFilterBloc>().state.filter,
                  todos: todosState.todos,
                  searchTerm: context.read<TodoSearchBloc>().state.searchTerm,
                ));
          },
        ),
        BlocListener<TodoSearchBloc, TodoSearchState>(
          listener: (context, searchState) {
            context.read<FilteredTodoBloc>().add(SetFilteredTodosEvent(
                  filter: context.read<TodoFilterBloc>().state.filter,
                  todos: context.read<TodoListBloc>().state.todos,
                  searchTerm: searchState.searchTerm,
                ));
          },
        ),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.grey);
        },
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: _showBackground(),
            secondaryBackground:
                _showBackground(icAlign: Alignment.centerRight),
            child: TodoItem(todo: todos[index]),
            onDismissed: (_) {
              context
                  .read<TodoListBloc>()
                  .add(RemoveTodoEvent(id: todos[index].id));
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you really want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('YES'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );

    // return ListView.separated(
    //   primary: false,
    //   shrinkWrap: true,
    //   itemCount: todos.length,
    //   separatorBuilder: (BuildContext context, int index) {
    //     return const Divider(color: Colors.grey);
    //   },
    //   itemBuilder: (BuildContext context, int index) {
    //     return Dismissible(
    //       key: ValueKey(todos[index].id),
    //       background: _showBackground(),
    //       secondaryBackground: _showBackground(icAlign: Alignment.centerRight),
    //       child: TodoItem(todo: todos[index]),
    //       onDismissed: (_) {
    //         context
    //             .read<TodoListBloc>()
    //             .add(RemoveTodoEvent(id: todos[index].id));
    //       },
    //       confirmDismiss: (direction) {
    //         return showDialog(
    //           context: context,
    //           builder: (context) {
    //             return AlertDialog(
    //               title: const Text('Are you sure?'),
    //               content: const Text('Do you really want to delete?'),
    //               actions: [
    //                 TextButton(
    //                   onPressed: () => Navigator.pop(context, false),
    //                   child: const Text('NO'),
    //                 ),
    //                 TextButton(
    //                   onPressed: () => Navigator.pop(context, true),
    //                   child: const Text('YES'),
    //                 ),
    //               ],
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }

  Widget _showBackground({AlignmentGeometry? icAlign}) {
    return Container(
      alignment: icAlign ?? Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.redAccent,
      margin: const EdgeInsets.all(4.0),
      child: const Icon(Icons.delete, size: 30.0, color: Colors.white),
    );
  }
}

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (value) {
          context.read<TodoListBloc>().add(ToggleTodoEvent(id: widget.todo.id));
        },
      ),
      title: Text(widget.todo.desc),
      onTap: () {
        textController.text = widget.todo.desc;
        bool isError = false;

        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: const Text('Edit Todo'),
                  content: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      errorText: isError ? 'Value cannot be empty' : null,
                    ),
                    autofocus: true,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isError = textController.text.isEmpty;

                          if (!isError) {
                            context.read<TodoListBloc>().add(EditTodoEvent(
                                  id: widget.todo.id,
                                  todoDesc: textController.text,
                                ));

                            Navigator.pop(context);
                          }
                        });
                      },
                      child: const Text('EDIT'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
