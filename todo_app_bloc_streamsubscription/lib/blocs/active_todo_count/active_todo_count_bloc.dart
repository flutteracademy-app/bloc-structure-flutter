import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc_streamsubscription/blocs/blocs.dart';
import 'package:todo_app_bloc_streamsubscription/models/todo_model.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListBloc todoListBloc;
  ActiveTodoCountBloc({
    required this.initialActiveTodoCount,
    required this.todoListBloc,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      final int currentActiveCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;

      add(CalculateActiveTodoCountEvent(activeTodoCount: currentActiveCount));
    });

    on<CalculateActiveTodoCountEvent>((event, emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
