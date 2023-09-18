// import 'dart:async';

import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../color/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // int incrementSize = 1;
  // final ColorBloc colorBloc;
  // late final StreamSubscription colorSubscription;

  CounterBloc(/*{required this.colorBloc}*/) : super(CounterState.initial()) {
    // colorSubscription = colorBloc.stream.listen((ColorState colorState) {
    //   if (colorState.color == Colors.redAccent) {
    //     incrementSize = 1;
    //   } else if (colorState.color == Colors.greenAccent) {
    //     incrementSize = 10;
    //   } else if (colorState.color == Colors.blueAccent) {
    //     incrementSize = 100;
    //   } else if (colorState.color == Colors.black) {
    //     incrementSize = -100;
    //   }
    // });
    on<ChangeCounterEvent>(_changeCounter);
  }

  void _changeCounter(ChangeCounterEvent event, Emitter<CounterState> emit) {
    // emit(state.copyWith(counter: state.counter + incrementSize));
    emit(state.copyWith(counter: state.counter + event.incrementSize));
  }
}
