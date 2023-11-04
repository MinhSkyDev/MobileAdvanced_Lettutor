import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/courses/ui/course_card.dart';
import 'package:lettutor/model/course.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
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
          const SizedBox(height: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Your Current Courses",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Your courses will be displayed here",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [CourseCard(currentCourse: fakeCourse)],
                ))
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
