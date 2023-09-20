import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:todo_cubit/cubits/filtered_todo/filtered_todo_cubit.dart';
import 'package:todo_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_cubit/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoFilterCubit()),
        BlocProvider(create: (context) => TodoSearchCubit()),
        BlocProvider(create: (context) => TodoListCubit()),
        BlocProvider(create: (context) {
          return ActiveTodoCountCubit(
            initCount: context.read<TodoListCubit>().state.todos.length,
            // todoListCubit: context.read<TodoListCubit>(),
          );
        }),
        BlocProvider(create: (context) {
          return FilteredTodoCubit(
            // todoFilterCubit: context.read<TodoFilterCubit>(),
            // todoSearchCubit: context.read<TodoSearchCubit>(),
            // todoListCubit: context.read<TodoListCubit>(),
            initFilteredTodos: context.read<TodoListCubit>().state.todos,
          );
        }),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: const TodosPage(),
      ),
    );
  }
}
