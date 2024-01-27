part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessRegisterState extends RegisterState {}

class RegisterFailedRegisterState extends RegisterState {}
