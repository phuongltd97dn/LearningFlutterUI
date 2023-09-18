// import 'dart:async';

// import 'package:cubit2cubit_new/cubits/color/color_cubit.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // int incrementSize = 0;
  // final ColorCubit colorCubit;
  // late final StreamSubscription colorSubscription;

  CounterCubit(
      // {required this.colorCubit}
      )
      : super(CounterState.initital());
  // {
  //   colorSubscription = colorCubit.stream.listen(
  //     (ColorState colorState) {
  //       if (colorState.color == Colors.redAccent) {
  //         incrementSize = 1;
  //       } else if (colorState.color == Colors.greenAccent) {
  //         incrementSize = 10;
  //       } else if (colorState.color == Colors.blueAccent) {
  //         incrementSize = 100;
  //       } else if (colorState.color == Colors.black) {
  //         incrementSize = -100;
  //       }
  //     },
  //   );
  // }

  void changeCounter(int incrementSize) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }
}
