part of 'find_tutor_bloc.dart';

@immutable
abstract class FindTutorState {}

class FindTutorInitial extends FindTutorState {}

class FindTutorLoadingState extends FindTutorState {}

class FindTutorLoadedState extends FindTutorState {}

class FindTutorSwitchPageFailedState extends FindTutorState {}

class FindTutorViewDetailSuccessState extends FindTutorState {}

class FindTutorViewDetailFailedState extends FindTutorState {}
