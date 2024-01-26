import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

//Define HomeBloc for HomeScreen
//Authour: Minh Quang Le
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitEvent>((event, emit) {
      HomeInitEventHandler(event, emit);
    });
    on<HomeLoadingEvent>((event, emit) {});
    on<HomeLoadedEvent>((event, emit) {});
  }

  FutureOr<void> HomeInitEventHandler(
      HomeEvent event, Emitter<HomeState> emitter) async {
    //Maybe this will be add some initial config of the app
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoaded());
  }
}
