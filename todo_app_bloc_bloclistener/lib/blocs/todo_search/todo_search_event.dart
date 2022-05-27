// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent {}

class SetSearchTermsEvent extends TodoSearchEvent {
  final String newSearchterm;
  SetSearchTermsEvent({
    required this.newSearchterm,
  });

  @override
  String toString() => 'SetSearchTermsEvent(newSearchterm: $newSearchterm)';
}
