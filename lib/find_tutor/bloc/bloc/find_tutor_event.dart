part of 'find_tutor_bloc.dart';

@immutable
abstract class FindTutorEvent {}

class FindTutorInitEvent extends FindTutorEvent {}

class FindTutorOnClickEvent extends FindTutorEvent {
  String userId;
  int currentIndex;
  FindTutorOnClickEvent({required this.userId, required this.currentIndex});
}

class FindTutorSwitchPageEvent extends FindTutorEvent {
  int pageSwitch;
  FindTutorSwitchPageEvent({required this.pageSwitch});
}
