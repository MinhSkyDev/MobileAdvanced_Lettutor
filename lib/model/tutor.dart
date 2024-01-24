import 'dart:core';

class Tutor {
  String name = "";
  String nationality = "";
  String avatarURL = "https://i.pravatar.cc/300";
  double rating;
  String skills = "";
  String description = "";

  Tutor(
      {required this.name,
      required this.nationality,
      required this.rating,
      required this.skills,
      required this.avatarURL,
      required this.description});
}
