// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc.dart';

abstract class TodoListEvent {}

class AddTodoEvent extends TodoListEvent {
  final String todoDesc;
  AddTodoEvent({
    required this.todoDesc,
  });

  @override
  String toString() => 'AddTodoEvent(todoDesc: $todoDesc)';
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;
  EditTodoEvent({
    required this.id,
    required this.todoDesc,
  });

  @override
  String toString() => 'EditTodoEvent(id: $id, todoDesc: $todoDesc)';
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;
  ToggleTodoEvent({
    required this.id,
  });

  @override
  String toString() => 'ToogletodoEvent(id: $id)';
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;
  RemoveTodoEvent({
    required this.todo,
  });

  @override
  String toString() => 'RemoveTodoEvent(todo: $todo)';
}
