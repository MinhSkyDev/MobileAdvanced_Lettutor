import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/schedule_request.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  dynamic currentHistorySchedules;

  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryOnInitEvent>((event, emit) async {
      await HistoryOnInitEventHandler(event, emit);
    });
  }

  FutureOr<void> HistoryOnInitEventHandler(event, emit) async {
    emit(HistoryInitial());
    emit(HistoryLoadingState());
    LoginResponse currentUser = await getUserData();
    String currentAccessToken = currentUser.tokens['access']['token'];

    currentHistorySchedules =
        await getYourOwnHistorySchedule(currentAccessToken);

    emit(HistoryLoadedState());
  }
}
