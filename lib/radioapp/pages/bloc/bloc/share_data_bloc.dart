import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'share_data_event.dart';
part 'share_data_state.dart';

class ShareDataBloc extends Bloc<ShareDataEvent, ShareDataState> {
  ShareDataBloc() : super(ShareDataInitial());

  @override
  Stream<ShareDataState> mapEventToState(
    ShareDataEvent event,
  ) async* {}
}
