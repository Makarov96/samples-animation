part of 'shared_book_detail_bloc.dart';

abstract class SharedBookDetailEvent extends Equatable {
  const SharedBookDetailEvent();

  @override
  List<Object> get props => [];
}

class SharedDataEvent extends SharedBookDetailEvent {
  final String info;
  final String bookName;

  SharedDataEvent({
    @required this.info,
    @required this.bookName,
  });

  @override
  List<Object> get props => [info];
}

class ResetEvent extends SharedBookDetailEvent {}
