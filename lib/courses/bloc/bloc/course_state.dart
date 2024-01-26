part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseLoadedState extends CourseState {}

class CourseSwitchPageFailed extends CourseState {}

class CourseViewDetailState extends CourseState {}
