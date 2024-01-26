import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/model/course.dart';

class CourseCard extends StatelessWidget {
  Course currentCourse;
  VoidCallback onClick;
  CourseCard({super.key, required this.currentCourse, required this.onClick});

  String getNumLessonString() {
    String result = "${currentCourse.numLessons} Lessons";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width * 0.8;
    double cardHeight = size.height * 0.4;
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
              width: cardWidth,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 15),
                  child: Column(
                    children: [
                      //IMAGE
                      Image.network(
                        currentCourse.courseImageUrl,
                        height: cardHeight * 0.7,
                        width: cardWidth,
                        fit: BoxFit.fill,
                      ),
                      TextCommonBold(currentCourse.courseTitle),
                      TextCommon(currentCourse.courseDescription),
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
                                  child: IgnorePointer(
                                    child: Row(
                                      children: [
                                        TextCommon("Difficulty: "),
                                        RatingBar.builder(
                                          itemSize: 15,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.redAccent,
                                            size: 5,
                                          ),
                                          onRatingUpdate: (value) {},
                                          initialRating: double.parse(
                                              currentCourse.courseDifficulty),
                                          allowHalfRating: true,
                                        )
                                      ],
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextCommonBold(getNumLessonString())),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
