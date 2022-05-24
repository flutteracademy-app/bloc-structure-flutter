import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_bloclistener/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit_bloclistener/models/todo_model.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;
  const TodoItemWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              bool err = false;
              textEditingController.text = widget.todo.desc;
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Editar TODO'),
                  content: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                        errorText:
                            err ? "El valor no puede estar vacio " : null),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCELAR'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          err =
                              textEditingController.text.isEmpty ? true : false;
                          if (!err) {
                            context.read<TodoListCubit>().editTodo(
                                  widget.todo.id,
                                  textEditingController.text,
                                );
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: const Text('ACEPTAR'),
                    ),
                  ],
                );
              });
            });
      },
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todo.id);
        },
      ),
      title: Text(widget.todo.desc),
    );
  }
}
