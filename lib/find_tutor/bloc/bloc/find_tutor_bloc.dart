import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/dto/tutor_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/schedule_request.dart';
import 'package:lettutor/util/tutor_request.dart';
import 'package:meta/meta.dart';

part 'find_tutor_event.dart';
part 'find_tutor_state.dart';

class FindTutorBloc extends Bloc<FindTutorEvent, FindTutorState> {
  dynamic currentTutors;
  dynamic selectedTutorDetail;
  dynamic selectedTutor;
  dynamic selectedTutorSchedule;
  late String currentUserId;
  FindTutorBloc() : super(FindTutorInitial()) {
    on<FindTutorInitEvent>((event, emit) async {
      await FindTutorInitEventHandler(event, emit);
    });

    on<FindTutorOnClickEvent>((event, emit) async {
      await FindTutorOnClickEventHandler(event, emit);
    });

    on<FindTutorSwitchPageEvent>((event, emit) async {
      await FindTutorSwitchPageEventHandler(event, emit);
    });

    on<FindTutorUpdateSchedulesBookEvent>((event, emit) async {
      await FindTutorUpdateSchedulesBookEventHandler(event, emit);
    });
  }

  FutureOr<void> FindTutorUpdateSchedulesBookEventHandler(event, emit) async {
    print("[Flutter Bloc]: After Clicked");
    String currentAccessToken = await getAccessToken();
    FindTutorUpdateSchedulesBookEvent currentEvent =
        event as FindTutorUpdateSchedulesBookEvent;
    selectedTutorSchedule =
        await getTutorSchedule(currentAccessToken, currentEvent.userId);
    selectedTutorSchedule = selectedTutorSchedule['scheduleOfTutor'];
  }

  FutureOr<void> updateTutorSchedule(String tutorId) async {
    String currentAccessToken = await getAccessToken();
    selectedTutorSchedule = await getTutorSchedule(currentAccessToken, tutorId);
    selectedTutorSchedule = selectedTutorSchedule['scheduleOfTutor'];
  }

  FutureOr<void> FindTutorOnClickEventHandler(event, emit) async {
    String currentAccessToken = await getAccessToken();
    FindTutorOnClickEvent currentEvent = event as FindTutorOnClickEvent;
    dynamic newTutorDetail =
        await getTutorDetail(currentEvent.userId, currentAccessToken);

    if (newTutorDetail != null) {
      selectedTutorDetail = newTutorDetail;
      selectedTutor =
          currentTutors["tutors"]['rows'][currentEvent.currentIndex];
      selectedTutorSchedule =
          await getTutorSchedule(currentAccessToken, currentEvent.userId);
      selectedTutorSchedule = selectedTutorSchedule['scheduleOfTutor'];
      emit(FindTutorViewDetailSuccessState());
      emit(FindTutorLoadedState);
    } else {
      emit(FindTutorViewDetailFailedState());
      emit(FindTutorLoadedState);
    }
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
    currentUserId = await getUserId();
    emit(FindTutorLoadedState());
  }
}
