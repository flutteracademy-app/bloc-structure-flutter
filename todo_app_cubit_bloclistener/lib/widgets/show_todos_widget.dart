import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_bloclistener/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:todo_app_cubit_bloclistener/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_cubit_bloclistener/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit_bloclistener/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_cubit_bloclistener/widgets/todo_item_widget.dart';

class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                state.todos,
                context.read<TodoSearchCubit>().state.searchTerm,
              );
        }),
        BlocListener<TodoFilterCubit, TodoFilterState>(
            listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
                state.filter,
                context.read<TodoListCubit>().state.todos,
                context.read<TodoSearchCubit>().state.searchTerm,
              );
        }),
        BlocListener<TodoSearchCubit, TodoSearchState>(
            listener: (context, state) {
          context.read<FilteredTodosCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                context.read<TodoListCubit>().state.todos,
                state.searchTerm,
              );
        }),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            onDismissed: (_) {
              context.read<TodoListCubit>().removeTodo(todos[index]);
            },
            confirmDismiss: (_) {
              return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        '¿Estás seguro de querer borrarlo?',
                      ),
                      content: const Text(
                        'Esta acción es permanente y no se puede deshacer',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('NO'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('SI'),
                        )
                      ],
                    );
                  });
            },
            child: TodoItemWidget(
              todo: todos[index],
            ),
          );
        },
      ),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
