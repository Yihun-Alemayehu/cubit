import 'package:bloc_concepts_2/business/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C O U N T E R'),
        centerTitle: true,
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncremened == true) {
            // Scaffold.of(context).showSnackBar();
            const SnackBar(
              elevation: 10,
              backgroundColor: Colors.black,
              content: Text('Incremented'),
              duration: Duration(milliseconds: 700),
            );
          } else if (state.isIncremened == false) {
            const SnackBar(
              content: Text('Decremented'),
              duration: Duration(milliseconds: 300),
            );
          }
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You pushed the button counter times'),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text('${state.counter}');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: const Text('Increment'),
                  ),
                  TextButton(
                    onPressed: () {
                      // context.read<CounterCubit>().decrement();
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Text('Decrement'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
