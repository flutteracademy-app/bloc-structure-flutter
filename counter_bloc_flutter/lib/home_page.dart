import 'package:counter_bloc_flutter/cubits/counter/counter_cubit.dart';
import 'package:counter_bloc_flutter/other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 2) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Counter is ${state.counter}'),
                );
              },
            );
          } else if (state.counter == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OtherPage();
                },
              ),
            );
          }
        },
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Center(
              child: Text(
                '${state.counter}',
                style: const TextStyle(fontSize: 50.0),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: const Icon(Icons.add),
            heroTag: 'increment',
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: const Icon(Icons.remove),
            heroTag: 'decrement',
          )
        ],
      ),
    );
  }
}
