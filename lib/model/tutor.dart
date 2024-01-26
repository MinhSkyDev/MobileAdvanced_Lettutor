import 'dart:core';

class Tutor {
  String name = "";
  String nationality = "";
  String avatarURL = "https://api.minimalavatars.com/avatar/random/png";
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
