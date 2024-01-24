import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/history/ui/history_card.dart';
import 'package:lettutor/model/history.dart';

import '../../model/Tutor.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String messageSchedule_1 =
      "The following is a list of lessons you have attended";
  String messageSchedule_2 =
      "You can review the details of the lessons you have attended";

  Tutor fakeTutor = Tutor(
      avatarURL:
          "https://media.post.rvohealth.io/wp-content/uploads/2020/08/732x549_Are_Random_Erections_Normal-1-732x549.jpg",
      name: "ABC",
      nationality: "Vietnam",
      rating: 5,
      skills: "C++, English",
      description: "Im super good");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              TextHeader1(
                "History",
              ),
            ],
          ),
          TextHeader2(
            messageSchedule_1,
          ),
          TextCommon(
            messageSchedule_2,
          ),
          Expanded(
            child: ListView(
              children: [
                HistoryCard(
                    currentHistory: History(
                        bookDay: DateTime.now(),
                        currentTutor: fakeTutor,
                        request: "No Request"))
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle normalTextStyle() {
    return GoogleFonts.montserrat(
      fontSize: 10,
      textStyle: const TextStyle(color: Colors.black87),
      fontWeight: FontWeight.w500,
    );
  }
}
