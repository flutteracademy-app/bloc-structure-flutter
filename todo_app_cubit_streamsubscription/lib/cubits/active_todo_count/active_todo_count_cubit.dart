import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_streamsubscription/cubits/todo_list/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  final int initialActiveTodoCount;
  ActiveTodoCountCubit({
    required this.todoListCubit,
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(
          activeTodoCount: initialActiveTodoCount,
        )) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      final int currentActiveTodoCount = todoListState.todos
          .where((element) => element.completed == false)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
