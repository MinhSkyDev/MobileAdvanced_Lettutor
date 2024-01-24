part of 'my_course_bloc.dart';

@immutable
abstract class MyCourseState {}

class MyCourseInitial extends MyCourseState {}

class MyCourseLoadingCourseState extends MyCourseState {}

class MyCourseLoadedCourseState extends MyCourseState {}
