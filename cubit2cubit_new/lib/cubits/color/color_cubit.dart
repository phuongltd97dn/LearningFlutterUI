import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  void changeColor() {
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
