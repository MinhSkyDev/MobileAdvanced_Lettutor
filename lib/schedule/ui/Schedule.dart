import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/model/schedule..dart';
import 'package:lettutor/model/tutor.dart';
import 'package:lettutor/schedule/ui/schedule_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String messageSchedule_1 = "Here is a list of the sessions you have booked";
  String messageSchedule_2 =
      "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours";

  Tutor fakeTutor = Tutor(
      avatarURL:
          "https://media.post.rvohealth.io/wp-content/uploads/2020/08/732x549_Are_Random_Erections_Normal-1-732x549.jpg",
      name: "ABC",
      nationality: "Vietnam",
      rating: 5,
      skills: ["C++", "English"],
      description: "Im super good");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
          Expanded(
            child: Column(
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
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ScheduleCard(
                        currentSchedule: Schedule(
                            bookDay: DateTime.now(),
                            currentTutor: fakeTutor,
                            request: "There is no Request"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
