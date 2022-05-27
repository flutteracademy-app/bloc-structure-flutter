import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

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

        BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
          builder: (context, state) {
            return Text(
              '${state.activeTodoCount} items left',
              style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
            );
          },
        ),

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
