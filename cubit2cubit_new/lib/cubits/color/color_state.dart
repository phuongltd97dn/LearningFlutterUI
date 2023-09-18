part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({this.color = Colors.redAccent});

  factory ColorState.initial() {
    return const ColorState();
  }

  ColorState copyWith({Color? color}) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'ColorState(color: $color)';

  @override
  List<Object?> get props => [color];
}
