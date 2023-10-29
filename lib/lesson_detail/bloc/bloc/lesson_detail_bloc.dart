import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lesson_detail_event.dart';
part 'lesson_detail_state.dart';

class LessonDetailBloc extends Bloc<LessonDetailEvent, LessonDetailState> {
  LessonDetailBloc() : super(LessonDetailInitial()) {
    on<LessonDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
