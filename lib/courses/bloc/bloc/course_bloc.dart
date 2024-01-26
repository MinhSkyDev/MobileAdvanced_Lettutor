import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  dynamic currentCourses;
  CourseBloc() : super(CourseInitial()) {
    on<CourseOnInitEvent>((event, emit) async {
      await CourseOnInitEventHandler(event, emit);
    });
  }

  FutureOr<void> CourseOnInitEventHandler(event, emit) async {}
}
