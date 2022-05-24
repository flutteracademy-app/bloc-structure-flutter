import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final int initialActiveTodoCount;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));
  void calculateActiveCount(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
