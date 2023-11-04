import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/model/course.dart';

class CourseCard extends StatelessWidget {
  Course currentCourse;
  CourseCard({super.key, required this.currentCourse});

  String getNumLessonString() {
    String result = currentCourse.numLessons.toString() + " Lessons";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double card_width = size.width * 0.8;
    double card_height = size.height * 0.2;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          width: card_width,
          height: card_height,
          child: Expanded(
            child: Column(
              children: [
                //IMAGE
                Image.network(
                  currentCourse.courseImageUrl,
                  height: card_height * 0.6,
                  width: card_width,
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
                )
              ],
            ),
          )),
    );
  }
}
