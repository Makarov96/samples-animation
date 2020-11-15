part of 'handle_theme_bloc.dart';

abstract class HandleThemeState extends Equatable {
  const HandleThemeState();

  @override
  List<Object> get props => [];
}

class Empty extends HandleThemeState {}

class ChangedTheme extends HandleThemeState {
  final bool value;

  ChangedTheme({@required this.value});

  @override
  List<Object> get props => [value];
}
