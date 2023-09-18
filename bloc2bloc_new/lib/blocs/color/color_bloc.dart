import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColorEvent>(_changeColor);
  }

  void _changeColor(ChangeColorEvent evnet, Emitter<ColorState> emit) {
    if (state.color == Colors.redAccent) {
      emit(state.copyWith(color: Colors.greenAccent));
    } else if (state.color == Colors.greenAccent) {
      emit(state.copyWith(color: Colors.blueAccent));
    } else if (state.color == Colors.blueAccent) {
      emit(state.copyWith(color: Colors.black));
    } else if (state.color == Colors.black) {
      emit(state.copyWith(color: Colors.redAccent));
    }
  }
}
