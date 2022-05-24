import 'package:flutter/material.dart';
import 'package:todo_app_cubit_bloclistener/widgets/create_todo_widget.dart';
import 'package:todo_app_cubit_bloclistener/widgets/search_filter_todo_widget.dart';
import 'package:todo_app_cubit_bloclistener/widgets/show_todos_widget.dart';
import 'package:todo_app_cubit_bloclistener/widgets/todo_header_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40,
          ),
          child: Column(
            children: const [
              TodoHeaderWidget(),
              CreateTodoWidget(),
              SizedBox(
                height: 20,
              ),
              SearchFilterTodoWidget(),
              SizedBox(
                height: 20,
              ),
              ShowTodosWidget()
            ],
          ),
        ),
      )),
    );
  }
}
