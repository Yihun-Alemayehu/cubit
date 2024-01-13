import 'package:bloc_concepts_2/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C O U N T E R'),
        centerTitle: true,
      ),
      body: Container(
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
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text('Increment'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    // context.read<CounterCubit>().decrement();
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: const Text('Go to Home Screen'),
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
