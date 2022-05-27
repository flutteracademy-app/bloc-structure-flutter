import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc_bloclistener/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_app_bloc_bloclistener/blocs/todo_list/todo_list_bloc.dart';
import 'package:todo_app_bloc_bloclistener/blocs/todo_search/todo_search_bloc.dart';
import 'package:todo_app_bloc_bloclistener/models/todo_model.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosBloc({
    required this.initialTodos,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    on<CalculateFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.filteredTodos));
    });
  }
}
