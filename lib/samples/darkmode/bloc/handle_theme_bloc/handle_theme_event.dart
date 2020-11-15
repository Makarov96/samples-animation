part of 'handle_theme_bloc.dart';

abstract class HandleThemeEvent extends Equatable {
  const HandleThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangedValueEvent extends HandleThemeEvent {
  final bool value;

  ChangedValueEvent({@required this.value});

  @override
  List<Object> get props => [value];
}
