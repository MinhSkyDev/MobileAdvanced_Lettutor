part of 'home_bloc.dart';

//Define HomeState for HomeScreen
//Authour: Minh Quang Le
@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}
