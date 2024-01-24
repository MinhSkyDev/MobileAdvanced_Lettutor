import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/schedule_request.dart';
import 'package:meta/meta.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  dynamic currentSchedules;

  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleOnInitEvent>((event, emit) async {
      await ScheduleOnInitEventHandler(event, emit);
    });
  }

  FutureOr<void> ScheduleOnInitEventHandler(event, emit) async {
    emit(ScheduleInitial());
    emit(ScheduleLoadingState());
    LoginResponse currentUser = await getUserData();
    String currentAccessToken = currentUser.tokens['access']['token'];

    currentSchedules = await getYourOwnBookedSchedule(currentAccessToken);
    emit(ScheduleLoadedState());
  }
}
