import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0, false));

  void increment() => emit(
        CounterState(state.counter + 1, state.isIncremened = true),
      );

  void decrement() => emit(
        CounterState(state.counter - 1, state.isIncremened = false),
      );
}
