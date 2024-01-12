import 'package:bloc_concepts_2/logic/cubit/counter_cubit.dart';
import 'package:bloc_concepts_2/presentation/screens/home_screen.dart';
import 'package:bloc_concepts_2/presentation/screens/second_screen.dart';
import 'package:bloc_concepts_2/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CounterCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' :(context) => const HomeScreen(),
          '/second' :(context) => const SecondScreen(),
          '/third' :(context) => const ThirdScreen(),
        },
      ),
    ),
  );
}
