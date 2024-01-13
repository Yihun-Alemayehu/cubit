import 'package:bloc_concepts_2/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text('Increment'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
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
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              child: const Text('Go to Home Screen'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
