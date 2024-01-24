import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/schedule_request.dart';
import 'package:meta/meta.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  dynamic currentBookedCourses;

  MyCourseBloc() : super(MyCourseInitial()) {
    on<MyCourseInitEvent>((event, emit) async {
      await MyCourseInitEventHandler(event, emit);
    });
  }

  FutureOr<void> MyCourseInitEventHandler(event, emit) async {
    emit(MyCourseInitial());
    emit(MyCourseLoadingCourseState());

    LoginResponse loginResponse = await getUserData();
    String currentAccessToken = loginResponse.tokens['access']['token'];

    currentBookedCourses = await getYourOwnHistorySchedule(currentAccessToken);
    emit(MyCourseLoadedCourseState());
  }
}
