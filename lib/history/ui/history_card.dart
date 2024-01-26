import 'package:flutter/material.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/model/history.dart';

class HistoryCard extends StatelessWidget {
  History currentHistory;
  HistoryCard({super.key, required this.currentHistory});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
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
                        CircleAvatar(
                          radius: size.width * 0.1,
                          backgroundImage: Image.network(
                                  currentHistory.currentTutor.avatarURL)
                              .image,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCommonBold("Name"),
                            TextCommon(currentHistory.currentTutor.name),
                            TextCommonBold("Nationality"),
                            TextCommon(currentHistory.currentTutor.nationality),
                            TextCommonBold("Request for lesson"),
                            TextCommon(currentHistory.request),
                          ],
                        ),
                        //Time Schedule
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextCommonBold(getCurrentScheduleDay()),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

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
    DateTime currentDateTime = currentHistory.bookDay;
    int weekDay = currentDateTime.weekday - 1;
    int month = currentDateTime.month;
    int day = currentDateTime.day;
    result = "${weekdayMapping[weekDay]}, $month/$day";

    return result;
  }
}
