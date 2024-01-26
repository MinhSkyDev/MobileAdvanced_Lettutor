import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_component/common_button.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/history/bloc/bloc/history_bloc.dart';
import 'package:lettutor/history/ui/history_card.dart';
import 'package:lettutor/model/history.dart';
import 'package:lettutor/util/common_util.dart';

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
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(HistoryOnInitEvent());
    super.initState();
  }

  int currentPage = 1;

  void goNextPage() {
    currentPage += 1;
    BlocProvider.of<HistoryBloc>(context)
        .add(HistoryOnSwitchPageEvent(pageSwitch: currentPage));
  }

  void goPreviousPage() {
    currentPage -= 1;
    BlocProvider.of<HistoryBloc>(context)
        .add(HistoryOnSwitchPageEvent(pageSwitch: currentPage));
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
    HistoryBloc currentHistoryBloc = BlocProvider.of<HistoryBloc>(context);

    return BlocConsumer(
      bloc: currentHistoryBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HistoryLoadedState) {
          return getHistoryMainScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getHistoryMainScreen() {
    HistoryBloc currentHistoryBloc = BlocProvider.of<HistoryBloc>(context);
    dynamic currentownschedulesObject =
        currentHistoryBloc.currentHistorySchedules;
    List<dynamic> currentOwnSchedules =
        currentownschedulesObject['data']['rows'];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCommonBoldBig("Your history"),
              getNextAndPrevious(() {
                goPreviousPage();
              }, () {
                goNextPage();
              })
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: currentOwnSchedules.length,
                  itemBuilder: (BuildContext context, int index) {
                    dynamic currenttutorObject = currentOwnSchedules[index]
                        ['scheduleDetailInfo']['scheduleInfo']['tutorInfo'];

                    return HistoryCard(
                        currentHistory: History(
                      request: currentOwnSchedules[index]['studentRequest']
                              ?.toString() ??
                          "",
                      bookDay: convertUnixTimestampToDateTime(
                          currentOwnSchedules[index]['createdAtTimeStamp']),
                      currentTutor: Tutor(
                        avatarURL:
                            currenttutorObject['avatar']?.toString() ?? "",
                        name: currenttutorObject['name']?.toString() ?? "",
                        nationality:
                            currenttutorObject['country']?.toString() ?? "",
                        rating: 5.0,
                        skills: "ABC",
                        description: "ABC",
                      ),
                    ));
                  })),
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
