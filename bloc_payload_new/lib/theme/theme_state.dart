part of 'theme_bloc.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({this.theme = AppTheme.light});

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  List<Object> get props => [theme];

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  String toString() => 'ThemeState(theme: $theme)';
}
