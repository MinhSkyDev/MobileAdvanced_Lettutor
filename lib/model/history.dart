import 'package:lettutor/model/Tutor.dart';

class History {
  DateTime bookDay;
  String request;
  Tutor currentTutor;

  History(
      {required this.bookDay,
      required this.currentTutor,
      required this.request});
}
