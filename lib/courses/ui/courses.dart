import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/courses/bloc/bloc/course_bloc.dart';
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
  void initState() {
    BlocProvider.of<CourseBloc>(context).add(CourseOnInitEvent());
    super.initState();
  }

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
              TextHeader1(
                "Discover Courses",
              )
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
