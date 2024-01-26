import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/model/schedule..dart';
import 'package:lettutor/model/tutor.dart';
import 'package:lettutor/schedule/bloc/bloc/schedule_bloc.dart';
import 'package:lettutor/schedule/ui/schedule_card.dart';
import 'package:lettutor/util/common_util.dart';

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
      skills: "C++, English",
      description: "Im super good");

  @override
  void initState() {
    BlocProvider.of<ScheduleBloc>(context).add(ScheduleOnInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<ScheduleBloc>(context),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ScheduleLoadedState) {
          return getScheduleMainScreen();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget getScheduleMainScreen() {
    ScheduleBloc currentBloc = BlocProvider.of<ScheduleBloc>(context);
    dynamic currentownschedulesObject = currentBloc.currentSchedules;
    List<dynamic> currentOwnSchedules =
        currentownschedulesObject['data']['rows'];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              TextHeader1(
                "Schedule",
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeader2(
                  messageSchedule_1,
                ),
                TextCommon(
                  messageSchedule_2,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: currentOwnSchedules.length,
                        itemBuilder: (BuildContext context, int index) {
                          dynamic currenttutorObject =
                              currentOwnSchedules[index]['scheduleDetailInfo']
                                  ['scheduleInfo']['tutorInfo'];

                          return ScheduleCard(
                              currentSchedule: Schedule(
                            request: currentOwnSchedules[index]
                                        ['studentRequest']
                                    ?.toString() ??
                                "",
                            bookDay: convertUnixTimestampToDateTime(
                                currentOwnSchedules[index]
                                    ['createdAtTimeStamp']),
                            currentTutor: Tutor(
                              avatarURL:
                                  currenttutorObject['avatar']?.toString() ??
                                      "",
                              name:
                                  currenttutorObject['name']?.toString() ?? "",
                              nationality:
                                  currenttutorObject['country']?.toString() ??
                                      "",
                              rating: 5.0,
                              skills: "ABC",
                              description: "ABC",
                            ),
                          ));
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
