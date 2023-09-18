import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(int randInt) {
    if (randInt % 2 == 0) {
      emit(state.copyWith(theme: AppTheme.light));
    } else {
      emit(state.copyWith(theme: AppTheme.dark));
    }
  }
}
