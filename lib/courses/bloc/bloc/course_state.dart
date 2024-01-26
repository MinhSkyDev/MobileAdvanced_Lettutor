part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoadingState extends CourseState {}

class CourseLaodedState extends CourseState {}
