import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audiobook_event.dart';
part 'audiobook_state.dart';

class AudiobookBloc extends Bloc<AudiobookEvent, AudiobookState> {
  AudiobookBloc() : super(Start());

  @override
  Stream<AudiobookState> mapEventToState(
    AudiobookEvent event,
  ) async* {
    if (event is StartEvent) {
      yield Start();
    } else if (event is StopEvent) {
      yield Stop();
    } else if (event is ResetAudioEvent) {
      yield Start();
    }
  }
}
