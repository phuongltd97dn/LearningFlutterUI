import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/utils/debounce.dart';

import '../cubits/cubits.dart';
import '../models/todo_model.dart';

class SearchAndFilterTodo extends StatelessWidget {
  final debounce = Debounce(milliseconds: 1000);

  SearchAndFilterTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
            labelText: 'Search todos...',
            prefixIcon: Icon(Icons.search),
            filled: true,
            border: InputBorder.none,
          ),
          onChanged: (String searchTerm) {
            debounce.run(() {
              context.read<TodoSearchCubit>().setSearchTerm(searchTerm);
            });
          },
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () => context.read<TodoFilterCubit>().changeFilter(filter),
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(fontSize: 18.0, color: textColor(context, filter)),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blueAccent : Colors.grey;
  }
}
