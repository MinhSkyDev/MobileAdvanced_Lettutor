import 'dart:core';

class Tutor {
  String name = "";
  String nationality;
  String avatarURL;
  int rating;
  List<String> skills;
  String description;

  Tutor(
      {required this.name,
      required this.nationality,
      required this.rating,
      required this.skills,
      required this.avatarURL,
      required this.description});
}
