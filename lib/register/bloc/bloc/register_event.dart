part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterRegisterUserEvent extends RegisterEvent {
  String email;
  String password;
  RegisterRegisterUserEvent({required this.email, required this.password});
}
