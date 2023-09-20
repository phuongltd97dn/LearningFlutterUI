import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoFilterBloc()),
        BlocProvider(create: (context) => TodoSearchBloc()),
        BlocProvider(create: (context) => TodoListBloc()),
        BlocProvider(
          create: (context) => ActiveTodoCountBloc(
            initCount: context.read<TodoListBloc>().state.todos.length,
            // todoListBloc: context.read<TodoListBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => FilteredTodoBloc(
            initFilteredTodos: context.read<TodoListBloc>().state.todos,
            // todoFilterBloc: context.read<TodoFilterBloc>(),
            // todoSearchBloc: context.read<TodoSearchBloc>(),
            // todoListBloc: context.read<TodoListBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const TodosPage(),
      ),
    );
  }
}
