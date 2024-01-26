part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class CourseOnInitEvent extends CourseEvent {}

class CourseOnItemClickEvent extends CourseEvent {
  String courseID;
  CourseOnItemClickEvent({required this.courseID});
}

class CourseOnItemSwitchPage extends CourseEvent {
  int pageSwitch;
  CourseOnItemSwitchPage({required this.pageSwitch});
}
