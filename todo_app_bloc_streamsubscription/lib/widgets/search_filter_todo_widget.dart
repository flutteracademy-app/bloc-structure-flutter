import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc_streamsubscription/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:todo_app_bloc_streamsubscription/blocs/todo_search/todo_search_bloc.dart';

import 'package:todo_app_bloc_streamsubscription/models/todo_model.dart';

class SearchFilterTodoWidget extends StatelessWidget {
  const SearchFilterTodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Buscar Todos...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              context
                  .read<TodoSearchBloc>()
                  .add(SetSearchTermsEvent(newSearchterm: newSearchTerm));
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context
            .read<TodoFilterBloc>()
            .add(ChangeFilterEvent(newFilter: filter));
      },
      child: Text(
        filter == Filter.all
            ? 'Todos'
            : filter == Filter.active
                ? 'Activos'
                : 'Completados',
        style: TextStyle(
          fontSize: 20.0,
          color: textColor(context, filter),
        ),
      ),
    );
  }

  Color textColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterBloc>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
