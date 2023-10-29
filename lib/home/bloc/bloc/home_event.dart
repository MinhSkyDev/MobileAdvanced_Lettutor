part of 'home_bloc.dart';

//Define HomeEvent for HomeScreen
//Authour: Minh Quang Le
@immutable
abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {}
