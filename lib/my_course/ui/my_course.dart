import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/courses/ui/course_card.dart';
import 'package:lettutor/model/course.dart';
import 'package:lettutor/my_course/bloc/bloc/my_course_bloc.dart';

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
    return BlocConsumer(
      bloc: BlocProvider.of<MyCourseBloc>(context),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyCourseLoadedCourseState) {
          return getMyCourseMainScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getMyCourseMainScreen() {
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
                    TextHeader1(
                      "Your Courses",
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextHeader2(
                      "Your booked courses will be displayed here",
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  children: [
                    CourseCard(onClick: () {}, currentCourse: fakeCourse)
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
