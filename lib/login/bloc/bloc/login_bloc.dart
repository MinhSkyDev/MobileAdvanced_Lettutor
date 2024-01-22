import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/util/auth_request.dart';
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
    LoginOnSigninClickButtonEvent loginOnSigninClickButtonEvent =
        event as LoginOnSigninClickButtonEvent;

    int status =
        await loginUser(loginOnSigninClickButtonEvent.currentLoginRequest);

    bool isLoginSuccess = false;

    if (status == 200) {
      isLoginSuccess = true;
    }

    if (isLoginSuccess) {
      print("Im here at LoginSiginLoadedSucces");
      emit(LoginSiginLoadedSucces());
    } else {
      emit(LoginSigninLoadedFailed());
      emit(LoginInitial());
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

// // await getTutors(TutorRequest(
    // //     perPage: 9,
    // //     numPage: 1,
    // //     accessToken:
    // //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE3MDU4NTIzOTIsImV4cCI6MTcwNTkzODc5MiwidHlwZSI6ImFjY2VzcyJ9.HfklmteZKm6qlCQ0QxI2JYS6y5wWG4H2VtAJwjKFPF8"));

    // await getCourses(CourseRequest(
    //     page: 9,
    //     size: 1,
    //     accessToken:
    //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE3MDU4NTIzOTIsImV4cCI6MTcwNTkzODc5MiwidHlwZSI6ImFjY2VzcyJ9.HfklmteZKm6qlCQ0QxI2JYS6y5wWG4H2VtAJwjKFPF8"));