part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable{
  final int counter;
  final bool isIncremented;
  const CounterState({required this.isIncremented, required this.counter});

  @override
  List<Object?> get props => [isIncremented,counter];

  Map<String, dynamic> toJson() {
    return {
      "counter": this.counter,
      "isIncremented": this.isIncremented,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: int.parse(json["counter"]),
      isIncremented: json["isIncremented"].toLowerCase() == 'true',
    );
  }
//
}


