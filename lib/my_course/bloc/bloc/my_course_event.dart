part of 'my_course_bloc.dart';

@immutable
abstract class MyCourseEvent {}

class MyCourseInitEvent extends MyCourseEvent {}

class MyCourseSwitchPage extends MyCourseEvent {}

class MyCourseOnCourseClick extends MyCourseEvent {}
