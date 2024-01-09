import 'package:flutter/material.dart';
import 'package:lettutor/model/course.dart';

class CourseCard extends StatelessWidget {
  Course currentCourse;
  CourseCard({super.key, required this.currentCourse});

  String getNumLessonString() {
    String result = "${currentCourse.numLessons} Lessons";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width * 0.8;
    double cardHeight = size.height * 0.2;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Expanded(
            child: Column(
              children: [
                //IMAGE
                Image.network(
                  currentCourse.courseImageUrl,
                  height: cardHeight * 0.6,
                  width: cardWidth,
                  fit: BoxFit.fill,
                ),
                Text(currentCourse.courseTitle),
                Text(currentCourse.courseDescription),
                const SizedBox(
                  height: 5,
                ),

                //DIFFICULTY AND LESSONS
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(currentCourse.courseDifficulty)),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(getNumLessonString())),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
