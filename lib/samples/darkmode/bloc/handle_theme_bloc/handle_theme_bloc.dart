import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:meta/meta.dart';
part 'handle_theme_event.dart';
part 'handle_theme_state.dart';

class HandleThemeBloc extends HydratedBloc<HandleThemeEvent, HandleThemeState> {
  HandleThemeBloc()
      : super(
          Empty(),
        ) {
    hydrate();
  }

  @override
  HandleThemeState fromJson(Map<String, dynamic> json) {
    try {
      return ChangedTheme(value: json['value']);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(HandleThemeState state) {
    if (state is ChangedTheme) {
      return {'value': state.value};
    } else {
      return null;
    }
  }

  @override
  Stream<HandleThemeState> mapEventToState(
    HandleThemeEvent event,
  ) async* {
    if (event is ChangedValueEvent) {
      yield ChangedTheme(value: event.value);
    }
  }
}
