import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SetSearchTermsEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchterm));
    });
  }
}
