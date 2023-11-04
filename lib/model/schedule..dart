import 'package:lettutor/model/tutor.dart';

class Schedule {
  DateTime bookDay;
  String request;
  Tutor currentTutor;

  Schedule(
      {required this.bookDay,
      required this.currentTutor,
      required this.request});
}
