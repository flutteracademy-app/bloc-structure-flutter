part of 'todo_list_bloc.dart';

class TodoListState {
  final List<Todo> todos;
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(
        id: "1",
        desc: "Hacer la cama",
      ),
      Todo(
        id: "2",
        desc: "Limpiar la cocina",
      ),
      Todo(
        id: "3",
        desc: "Estudiar inglés",
      ),
    ]);
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
