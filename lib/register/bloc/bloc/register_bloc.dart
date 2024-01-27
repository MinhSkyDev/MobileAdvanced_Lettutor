import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/util/auth_request.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterRegisterUserEvent>((event, emit) async {
      await RegisterRegisterUserEventHandler(event, emit);
    });
  }

  FutureOr<void> RegisterRegisterUserEventHandler(event, emit) async {
    print("[Register Screen] Im Registering!");
    RegisterRegisterUserEvent currentEvent = event as RegisterRegisterUserEvent;
    RegisterRequest request = RegisterRequest(
        email: currentEvent.email, password: currentEvent.email, source: null);
    int statusCode = await registerUser(request);
    if (statusCode == 201) {
      emit(RegisterSuccessRegisterState());
      emit(RegisterInitial());
    } else {
      emit(RegisterFailedRegisterState());
      emit(RegisterInitial());
    }
  }
}
