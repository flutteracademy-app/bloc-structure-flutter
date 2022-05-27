// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent {}

class ChangeFilterEvent extends TodoFilterEvent {
  final Filter newFilter;
  ChangeFilterEvent({
    required this.newFilter,
  });

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newFilter)';
}
