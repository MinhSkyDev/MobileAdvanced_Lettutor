import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/courses/ui/course_card.dart';
import 'package:lettutor/model/course.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  Course fakeCourse = Course(
      courseDescription: "BEST C++ CLASS",
      courseTitle: "C++ Advanced",
      courseDifficulty: "Hard",
      courseImageUrl:
          "https://www.web-development-institute.com/wp-content/uploads/2021/03/c-plus-plus-advanced-course.jpg",
      numLessons: 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Discover Courses",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                CourseCard(currentCourse: fakeCourse),
                CourseCard(currentCourse: fakeCourse),
                CourseCard(currentCourse: fakeCourse),
                CourseCard(currentCourse: fakeCourse),
                CourseCard(currentCourse: fakeCourse),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
