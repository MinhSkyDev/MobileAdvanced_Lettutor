import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'find_tutor_event.dart';
part 'find_tutor_state.dart';

class FindTutorBloc extends Bloc<FindTutorEvent, FindTutorState> {
  FindTutorBloc() : super(FindTutorInitial()) {
    on<FindTutorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
