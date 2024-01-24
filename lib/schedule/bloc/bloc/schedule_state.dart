part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoadingState extends ScheduleState {}

class ScheduleLoadedState extends ScheduleState {}
