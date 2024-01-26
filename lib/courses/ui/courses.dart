import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common_component/common_button.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/course_detail/ui/course_detail.dart';
import 'package:lettutor/courses/bloc/bloc/course_bloc.dart';
import 'package:lettutor/courses/ui/course_card.dart';
import 'package:lettutor/model/course.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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

  int currentPage = 1;

  void goNextPage() {
    currentPage += 1;
    BlocProvider.of<CourseBloc>(context)
        .add(CourseOnItemSwitchPage(pageSwitch: currentPage));
  }

  void goPreviousPage() {
    currentPage -= 1;
    BlocProvider.of<CourseBloc>(context)
        .add(CourseOnItemSwitchPage(pageSwitch: currentPage));
  }

  void getValidIndex() {
    if (currentPage <= 0) {
      currentPage = 1;
    } else {
      currentPage -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    CourseBloc currentCourseBloc = BlocProvider.of<CourseBloc>(context);
    return BlocConsumer(
      bloc: currentCourseBloc,
      listener: (context, state) {
        if (state is CourseSwitchPageFailed) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Switch Page Failed!',
          );
        } else if (state is CourseViewDetailState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<CourseBloc>(context),
                    child: const CourseDetailScreen(),
                  )));
        }
      },
      builder: (context, state) {
        if (state is CourseLoadedState) {
          return getCourseMainScreen();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget getCourseMainScreen() {
    CourseBloc currentCourseBloc = BlocProvider.of<CourseBloc>(context);
    dynamic currentCourses = currentCourseBloc.currentCourses['data']['rows'];

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
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextHeader2("Available Courses"),
            getNextAndPrevious(() {
              goPreviousPage();
            }, () {
              goNextPage();
            }),
          ]),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: currentCourses.length,
                itemBuilder: ((context, index) {
                  return CourseCard(
                    onClick: () {
                      currentCourseBloc.add(CourseOnItemClickEvent(
                          courseID: currentCourses[index]['id']));
                    },
                    currentCourse: Course(
                        courseDescription: currentCourses[index]['description'],
                        courseTitle: currentCourses[index]['name'],
                        courseDifficulty: currentCourses[index]['level'],
                        courseImageUrl: currentCourses[index]['imageUrl'],
                        numLessons: currentCourses[index]['topics'].length),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
