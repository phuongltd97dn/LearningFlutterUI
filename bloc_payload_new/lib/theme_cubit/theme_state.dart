part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({this.theme = AppTheme.light});

  factory ThemeState.initial() {
    return const ThemeState();
  }

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  String toString() => 'ThemeState(theme: $theme)';

  @override
  List<Object?> get props => [theme];
}
