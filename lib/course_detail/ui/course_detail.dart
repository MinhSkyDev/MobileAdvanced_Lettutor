import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/course_detail/ui/pdf_viewer.dart';
import 'package:lettutor/courses/bloc/bloc/course_bloc.dart';
import 'package:lettutor/dto/course_dto.dart';

class CourseDetailScreen extends StatefulWidget {
  final String? courseTitle;
  final String? courseSubtitle;
  final String? experienceLevel;
  final String? courseLength;
  final List<String>? suggestedTutors;

  const CourseDetailScreen({
    Key? key,
    this.courseTitle,
    this.courseSubtitle,
    this.experienceLevel,
    this.courseLength,
    this.suggestedTutors,
  }) : super(key: key);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class TopicCard extends StatelessWidget {
  final String topicName;
  final int index;
  final VoidCallback onTap;

  const TopicCard(
      {super.key,
      required this.topicName,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        title: Text("Topics #$index $topicName"),
      ),
    );
  }
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    CourseDTO currentselectedcourseDto =
        BlocProvider.of<CourseBloc>(context).selectedCourse;
    CourseDataDTO courseDataDTO = currentselectedcourseDto.data;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextHeader2White(courseDataDTO.name as String),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Course Image
          Hero(
            tag: 'course_image',
            child: Image.network(
              // Replace with placeholder image if data is missing
              courseDataDTO.imageUrl as String,
              fit: BoxFit.cover,
              height: 200.0,
            ),
          ),
          const SizedBox(height: 16.0),
          // Course Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextHeader2(
                courseDataDTO.name ?? 'Course Title',
              ),
            ],
          ),
          TextCommonGrey(
            courseDataDTO.description ?? 'Subtitle',
          ),

          const SizedBox(height: 8.0),
          // Course Details
          Row(
            children: [
              TextHeader2(
                'Level:',
              ),
              const SizedBox(width: 8.0),
              IgnorePointer(
                child: RatingBar.builder(
                  itemSize: 15,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.redAccent,
                    size: 5,
                  ),
                  onRatingUpdate: (value) {},
                  initialRating: double.parse(courseDataDTO.level as String),
                  allowHalfRating: true,
                ),
              )
            ],
          ),
          TextHeader2(
            'Overview:',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: size.width * 0.85,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCommon("Why take this course?"),
                      TextCommonGreyLight(courseDataDTO.reason as String),
                      TextCommon("What will you able to do?"),
                      TextCommonGreyLight(courseDataDTO.purpose as String)
                    ]),
              )
            ],
          ),
          Row(
            children: [
              TextHeader2(
                'Course Length:',
              ),
              const SizedBox(width: 8.0),
              TextCommon(
                "${(courseDataDTO.topics as List<TopicDTO>).length} Weeks" ??
                    '10 Weeks',
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // Suggested Tutors
          TextHeader2(
            'List Topics:',
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopicCard(
                topicName: courseDataDTO.topics?[index].name as String,
                index: index,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFViewer(
                                pdfUrl: courseDataDTO.topics?[index].nameFile
                                    as String,
                              )));
                }),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: courseDataDTO.topics?.length ?? 0,
          ),
        ],
      ),
    );
  }
}
