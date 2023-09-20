part of 'todo_list_bloc.dart';

sealed class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todoDesc;

  const AddTodoEvent({required this.todoDesc});

  @override
  List<Object> get props => [todoDesc];
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;

  const EditTodoEvent({required this.id, required this.todoDesc});

  @override
  List<Object> get props => [id, todoDesc];
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;

  const ToggleTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class RemoveTodoEvent extends TodoListEvent {
  final String id;

  const RemoveTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}
