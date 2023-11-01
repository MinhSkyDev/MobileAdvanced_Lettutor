import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String messageSchedule_1 = "Here is a list of the sessions you have booked";
  String messageSchedule_2 =
      "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            const Text(
              "Schedule",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageSchedule_1,
              style: TextStyle(fontSize: 10),
            ),
            Text(
              messageSchedule_2,
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ],
    );
  }
}
