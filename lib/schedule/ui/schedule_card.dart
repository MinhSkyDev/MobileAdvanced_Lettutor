import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/model/schedule..dart';

class ScheduleCard extends StatelessWidget {
  Schedule currentSchedule;
  ScheduleCard({super.key, required this.currentSchedule});

  List<String> weekdayMapping = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  String getCurrentScheduleDay() {
    String result = "";
    DateTime currentDateTime = currentSchedule.bookDay;
    int weekDay = currentDateTime.weekday - 1;
    int month = currentDateTime.month;
    int day = currentDateTime.day;
    result =
        weekdayMapping[weekDay] + "," + month.toString() + "/" + day.toString();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TUTOR INFO
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AVATAR
                        CircleAvatar(
                          radius: size.width * 0.1,
                          backgroundImage: Image.network(
                                  currentSchedule.currentTutor.avatarURL)
                              .image,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentSchedule.currentTutor.name),
                            Text(currentSchedule.currentTutor.nationality),
                            Text("Direct Message"),
                          ],
                        ),
                        //Time Schedule
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(getCurrentScheduleDay()),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text("Request for lesson"),
                  Text(currentSchedule.request),
                ],
              ),
            ),
          ),
        ));
  }
}
