import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/course_dto.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/course_request.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  dynamic currentCourses;
  late CourseDTO selectedCourse;
  CourseBloc() : super(CourseInitial()) {
    on<CourseOnInitEvent>((event, emit) async {
      await CourseOnInitEventHandler(event, emit);
    });

    on<CourseOnItemSwitchPage>((event, emit) async {
      await CourseOnItemSwitchPageEventHandler(event, emit);
    });

    on<CourseOnItemClickEvent>((event, emit) async {
      await CourseOnItemClickEventEventHandler(event, emit);
    });
  }

  FutureOr<void> CourseOnItemClickEventEventHandler(event, emit) async {
    String accessToken = await getAccessToken();
    String courseID = (event as CourseOnItemClickEvent).courseID;
    selectedCourse = await getCourseInfo(CourseInfoRequest(
      courseId: courseID,
      accessToken: accessToken,
    ));
    emit(CourseViewDetailState());
    emit(CourseLoadedState());
  }

  FutureOr<void> CourseOnItemSwitchPageEventHandler(event, emit) async {
    String currentAccessToken = await getAccessToken();
    CourseOnItemSwitchPage courseOnItemSwitchPage =
        event as CourseOnItemSwitchPage;
    dynamic newCourses = await getCourses(CourseRequest(
      accessToken: currentAccessToken,
      page: courseOnItemSwitchPage.pageSwitch,
      size: 9,
    ));

    if (newCourses != null || newCourses['data'].length != 0) {
      currentCourses = newCourses;
    } else {
      emit(CourseSwitchPageFailed());
    }

    emit(CourseLoadedState());
  }

  FutureOr<void> CourseOnInitEventHandler(event, emit) async {
    emit(CourseInitial());
    emit(CourseLoadingState());
    String currentAccessToken = await getAccessToken();
    currentCourses = await getCourses(CourseRequest(
      accessToken: currentAccessToken,
      page: 1,
      size: 9,
    ));

    emit(CourseLoadedState());
  }
}
