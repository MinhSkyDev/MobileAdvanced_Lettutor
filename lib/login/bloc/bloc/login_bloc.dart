import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginOnSigninClickButtonEvent>((event, emit) async {
      await LoginOnSigninClickButtonEventHandler(event, emit);
    });

    on<LoginOnInitEvent>((event, emit) {
      LoginOnInitEventHandler(event, emit);
    });

    on<LoginOnRegisterTextPressEvent>((event, emit) async {
      await LoginOnRegisterTextPressEventHandler(event, emit);
    });
  }

  FutureOr<void> LoginOnSigninClickButtonEventHandler(event, emit) async {
    //FIXME: Login sẽ handle logic tới db ở đây, tạm thời chưa có

    //Chuyển trạng thái sang loading
    emit(LoginSigninLoading());
    //FIXME: Chừng nào xong thì mới chuyển sang LoginLoadedSucces
    await Future.delayed(const Duration(seconds: 3));
    bool isLoginSuccess = true;
    if (isLoginSuccess) {
      print("Im here at LoginSiginLoadedSucces");
      emit(LoginSiginLoadedSucces());
    } else {
      emit(LoginSigninLoadedFailed());
    }
  }

  FutureOr<void> LoginOnInitEventHandler(
      LoginOnInitEvent event, Emitter<LoginState> emit) async {
    //Currently do nothing
  }

  FutureOr<void> LoginOnRegisterTextPressEventHandler(event, emit) async {
    print("[Login Screen] Change to Register Screen");
    emit(LoginMoveToRegisterScreen());
    emit(LoginInitial());
  }
}
