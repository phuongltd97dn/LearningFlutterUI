part of 'todo_search_bloc.dart';

sealed class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends TodoSearchEvent {
  final String newSearchTerm;

  const SetSearchTermEvent({required this.newSearchTerm});

  @override
  List<Object> get props => [newSearchTerm];
}
