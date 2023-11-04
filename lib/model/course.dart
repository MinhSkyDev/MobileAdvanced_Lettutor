class Course {
  String courseImageUrl;
  String courseTitle;
  String courseDescription;
  String courseDifficulty;
  int numLessons;

  Course({
    required this.courseDescription,
    required this.courseTitle,
    required this.courseDifficulty,
    required this.courseImageUrl,
    required this.numLessons,
  });
}
