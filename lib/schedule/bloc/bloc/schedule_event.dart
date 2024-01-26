part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}

class ScheduleOnInitEvent extends ScheduleEvent {}

class ScheduleOnClickEvent extends ScheduleEvent {}

class ScheduleOnSwitchPageEvent extends ScheduleEvent {
  int pageSwitch;
  ScheduleOnSwitchPageEvent({required this.pageSwitch});
}
