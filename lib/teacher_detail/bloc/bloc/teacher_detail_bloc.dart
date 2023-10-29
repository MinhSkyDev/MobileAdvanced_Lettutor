import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teacher_detail_event.dart';
part 'teacher_detail_state.dart';

class TeacherDetailBloc extends Bloc<TeacherDetailEvent, TeacherDetailState> {
  TeacherDetailBloc() : super(TeacherDetailInitial()) {
    on<TeacherDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
