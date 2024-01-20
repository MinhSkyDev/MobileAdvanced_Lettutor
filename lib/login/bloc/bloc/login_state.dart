part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSigninLoading extends LoginState {}

class LoginSiginLoadedSucces extends LoginState {}

class LoginSigninLoadedFailed extends LoginState {}

class LoginMoveToRegisterScreen extends LoginState {}
