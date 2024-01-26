import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/dto/tutor_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/tutor_request.dart';
import 'package:meta/meta.dart';

part 'find_tutor_event.dart';
part 'find_tutor_state.dart';

class FindTutorBloc extends Bloc<FindTutorEvent, FindTutorState> {
  dynamic currentTutors;

  FindTutorBloc() : super(FindTutorInitial()) {
    on<FindTutorInitEvent>((event, emit) async {
      await FindTutorInitEventHandler(event, emit);
    });

    on<FindTutorOnClickEvent>((event, emit) async {});

    on<FindTutorSwitchPageEvent>((event, emit) async {
      await FindTutorSwitchPageEventHandler(event, emit);
    });
  }

  FutureOr<void> FindTutorSwitchPageEventHandler(event, emit) async {
    //emit(FindTutorLoadingState());
    print("[Find Tutor] im here");
    FindTutorSwitchPageEvent currentEvent = event as FindTutorSwitchPageEvent;

    LoginResponse currentUser = await getUserData();
    String currentAccessToken = currentUser.tokens['access']['token'];
    dynamic newTutors = await getTutors(TutorRequest(
        perPage: 9,
        numPage: currentEvent.pageSwitch,
        accessToken: currentAccessToken));

    if (newTutors != null) {
      currentTutors = newTutors;
    } else {
      emit(FindTutorSwitchPageFailedState());
    }

    emit(FindTutorLoadedState());
  }

  FutureOr<void> FindTutorInitEventHandler(event, emit) async {
    emit(FindTutorInitial());
    emit(FindTutorLoadingState());
    LoginResponse currentUser = await getUserData();
    String currentAccessToken = currentUser.tokens['access']['token'];
    currentTutors = await getTutors(
        TutorRequest(perPage: 9, numPage: 1, accessToken: currentAccessToken));
    emit(FindTutorLoadedState());
  }
}
