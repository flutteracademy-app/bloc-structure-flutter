import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/active_todo_count/active_todo_count_cubit.dart';

class TodoHeaderWidget extends StatelessWidget {
  const TodoHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40.0),
        ),
        // Text(
        //   '0 items left',
        //   style: TextStyle(
        //     fontSize: 20.0,
        //     color: Colors.redAccent,
        //   ),
        // ),

        BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
            builder: (context, state) {
          return Text(
            '${state.activeTodoCount} items left',
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.redAccent,
            ),
          );
        }),

        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: const TextStyle(
        //     fontSize: 20.0,
        //     color: Colors.redAccent,
        //   ),
        // ),
      ],
    );
  }
}
