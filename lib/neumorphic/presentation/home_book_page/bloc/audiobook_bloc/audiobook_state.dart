part of 'audiobook_bloc.dart';

abstract class AudiobookState extends Equatable {
  const AudiobookState();

  @override
  List<Object> get props => [];
}

class Initial extends AudiobookState {}

class Start extends AudiobookState {}

class Stop extends AudiobookState {}

class Resume extends AudiobookState {}

class Reset extends AudiobookState {}
