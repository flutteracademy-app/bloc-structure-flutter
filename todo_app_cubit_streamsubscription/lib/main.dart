import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_cubit_streamsubscription/pages/todos_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
          ),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: TodosPage(),
      ),
    );
  }
}
