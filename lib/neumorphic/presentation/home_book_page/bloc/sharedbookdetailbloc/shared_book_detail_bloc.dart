import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'shared_book_detail_event.dart';
part 'shared_book_detail_state.dart';

class SharedBookDetailBloc
    extends Bloc<SharedBookDetailEvent, SharedBookDetailState> {
  SharedBookDetailBloc() : super(Empty());

  @override
  Stream<SharedBookDetailState> mapEventToState(
    SharedBookDetailEvent event,
  ) async* {
    if (event is ResetEvent) {
      yield Empty();
    } else if (event is SharedDataEvent) {
      yield Shared(
        info: event.info,
        bookName: event.bookName,
      );
    }
  }
}
