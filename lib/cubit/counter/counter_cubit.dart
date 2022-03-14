import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
          counter: 0,
          isIncremented: false,
        ));

  void increment() => emit(CounterState(
        counter: state.counter + 1,
        isIncremented: true,
      ));

  void decrement() => emit(CounterState(
        counter: state.counter - 1,
        isIncremented: false,
      ));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print("");
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toJson();
  }
}
