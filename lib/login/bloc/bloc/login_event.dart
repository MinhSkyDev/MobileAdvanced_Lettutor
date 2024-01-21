part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginOnInitEvent extends LoginEvent {}

class LoginOnSigninClickButtonEvent extends LoginEvent {
  LoginRequest currentLoginRequest;
  LoginOnSigninClickButtonEvent({required this.currentLoginRequest});
}

class LoginOnForgotPasswordClickButton extends LoginEvent {}

class LoginOnUsernameTextWrite extends LoginEvent {}

class LoginOnPasswordTextWrite extends LoginEvent {}

class LoginOnRegisterTextPressEvent extends LoginEvent {}
