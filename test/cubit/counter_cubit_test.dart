import 'package:bloc_counter/cubit/counter/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterCubit", () {
    late CounterCubit counterCubit;

    // init data
    setUp(() {
      counterCubit = CounterCubit();
    });

    // close data
    tearDown(() {
      counterCubit.close();
    });

    test("the init state value = 0, isIncremented = false", () {
      expect(counterCubit.state,
          const CounterState(isIncremented: false, counter: 0),
          reason: "init state = 0 ?");
    });

    blocTest(
      "increment 1",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => const [CounterState(isIncremented: true, counter: 1)],
    );

    blocTest(
      "decrement 1",
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => const [CounterState(isIncremented: false, counter: -1)],
    );
  });
}
