part of 'audiobook_bloc.dart';

abstract class AudiobookEvent extends Equatable {
  const AudiobookEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends AudiobookEvent {}

class StopEvent extends AudiobookEvent {}

class ResumeEvent extends AudiobookEvent {}

class ResetAudioEvent extends AudiobookEvent {}
