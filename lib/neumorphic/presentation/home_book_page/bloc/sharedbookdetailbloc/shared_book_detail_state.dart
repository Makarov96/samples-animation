part of 'shared_book_detail_bloc.dart';

abstract class SharedBookDetailState extends Equatable {
  const SharedBookDetailState();

  @override
  List<Object> get props => [];
}

class Empty extends SharedBookDetailState {}

class Shared extends SharedBookDetailState {
  final String info;
  final String bookName;

  Shared({@required this.info, @required this.bookName});
  @override
  List<Object> get props => [info];
}
