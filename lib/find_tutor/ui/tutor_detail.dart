import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/common_component/common_rounded_button.dart';
import 'package:lettutor/common_component/login_textfield.dart';
import 'package:lettutor/dto/tutor_dto.dart';
import 'package:lettutor/find_tutor/bloc/bloc/find_tutor_bloc.dart';
import 'package:lettutor/find_tutor/ui/tutor_review_card.dart';
import 'package:lettutor/util/common_util.dart';
import 'package:lettutor/util/schedule_request.dart';
import 'package:lettutor/util/tutor_request.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({super.key});

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  late VideoPlayerController _videoController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late FindTutorBloc currentTutorBloc;

  late String userId;
  @override
  void initState() {
    FindTutorBloc findTutorBloc = BlocProvider.of<FindTutorBloc>(context);
    currentTutorBloc = findTutorBloc;
    dynamic currentTutor = findTutorBloc.selectedTutorDetail;
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        currentTutor['video'],
      ),
    );

    _initializeVideoPlayerFuture = _videoController.initialize().then((_) {
      setState(() {
        _videoController.play();
        _videoController.pause();
      });
    });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoController,
    );

    userId = findTutorBloc.currentUserId;
    super.initState();
  }

  SfCalendar _calendar(dynamic schedules) {
    return SfCalendar(
      view: CalendarView.week,
      firstDayOfWeek: DateTime.now().weekday,
      showNavigationArrow: true,
      showDatePickerButton: true,
      showCurrentTimeIndicator: true,
      timeSlotViewSettings: const TimeSlotViewSettings(
        timeTextStyle: TextStyle(
          fontSize: 10,
        ),
        timeIntervalHeight: 30,
        timeIntervalWidth: 250,
        timeInterval: Duration(minutes: 30),
        timeFormat: 'kk:mm',
      ),
      dataSource: MeetingDataSource(_getDataSource(schedules)),
      onTap: calendarTapped,
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) async {
    if (calendarTapDetails.targetElement == CalendarElement.appointment ||
        calendarTapDetails.targetElement == CalendarElement.agenda) {
      final Meeting appointmentDetails = calendarTapDetails.appointments![0];
      String result = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(appointmentDetails.eventName),
          // content: _form(appointmentDetails),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                int rs = await bookLesson(
                    appointmentDetails.scheduleId, "TemporaryMQL");
                if (rs == 200) {
                  print("[Tutor Detail]: After booked tutor");
                  Navigator.pop(context, 'Success');
                  await currentTutorBloc.updateTutorSchedule(
                      currentTutorBloc.selectedTutor['userId']);
                  setState(() {});
                } else {
                  Navigator.pop(context, 'Failed');
                }
              },
              child: const Text('Book'),
            ),
          ],
        ),
      );
      if (result == 'Book') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Booking detail'),
            content: const Text('Booked successfully'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                  setState(() {});
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      } else if (result == 'Failed') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Booking detail'),
            content: const Text('Booked failed'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      }
    }
  }

  List<Meeting> _getDataSource(dynamic schedules) {
    final List<Meeting> meetings =
        (schedules as List<dynamic>).map<Meeting>((e) {
      String eventName = (e['isBooked']!) ? 'Booked' : 'Book';

      if (eventName == 'Booked') {
        if (e['scheduleDetails'] != null &&
            e['scheduleDetails']!.any((lesson) =>
                lesson['bookingInfos'] != null &&
                lesson['bookingInfos']!
                    .any((student) => student['userId'] == userId))) {
          eventName = 'Reserved';
        }
      }

      Color background;
      switch (eventName) {
        case 'Booked':
          background = const Color(0xFF0F8644);
          break;
        case 'Reserved':
          background = Colors.grey;
          break;
        default:
          background = Colors.blue;
      }

      DateTime startTime =
          DateTime.fromMillisecondsSinceEpoch(e['startTimestamp']);
      DateTime endTime = DateTime.fromMillisecondsSinceEpoch(e['endTimestamp']);

      return Meeting(e['scheduleDetails'][0]['id'].toString(), eventName,
          startTime, endTime, background, false);
    }).toList();

    return meetings;
  }

  final reviewInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FindTutorBloc findTutorBloc = BlocProvider.of<FindTutorBloc>(context);
    dynamic currentTutor = findTutorBloc.selectedTutorDetail;
    dynamic feedbacks = findTutorBloc.selectedTutor['feedbacks'];
    print("[Tutor Detail]: Re-load");

    if (currentTutor['User']['avatar'] ==
        "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png") {
      int random = getRandomNumber(1, 1000);

      currentTutor['User']['avatar'] =
          "https://api.minimalavatars.com/avatar/$random/png";
    }

    return Scaffold(
      appBar: AppBar(
          title: TextHeader2White(currentTutor['User']['name'] as String)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE
              Row(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: Image.network(currentTutor['User']
                                ['avatar'] ??
                            getRandomAvatarUrl())
                        .image,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCommonBold(currentTutor['User']['name'] ?? ''),
                      IgnorePointer(
                        child: RatingBar.builder(
                          itemSize: 15,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.redAccent,
                            size: 5,
                          ),
                          onRatingUpdate: (value) {},
                          initialRating: double.parse(
                              (currentTutor['avgRating']).toString()),
                          allowHalfRating: true,
                        ),
                      ),
                      TextCommonBold(currentTutor['User']['country'] ?? ''),
                      const SizedBox(
                        height: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            currentTutor['isFavourite'] == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ))
                    ],
                  )
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              //DESCRIPTION
              TextCommonGreyLightSmall(currentTutor['bio']),
              const SizedBox(
                height: 15,
              ),

              //VIDEO
              TextHeader2("Introduction Video"),
              _videoController.value.isInitialized
                  ? SafeArea(
                      child: SizedBox(
                        height: 400,
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              //EDUCATION
              const SizedBox(
                height: 15,
              ),
              TextHeader2("Education"),
              TextCommonGreyLightSmall(currentTutor['education']),

              //EXPERIENCE
              const SizedBox(
                height: 15,
              ),
              TextHeader2("Experience"),
              TextCommonGreyLightSmall(currentTutor['experience']),

              //Booked
              const SizedBox(
                height: 15,
              ),
              TextHeader2("Book your class with this tutor"),
              _calendar(findTutorBloc.selectedTutorSchedule),

              const SizedBox(
                height: 15,
              ),
              TextCommonBold("Recent Review"),
              const SizedBox(height: 5),
              ListView.builder(
                itemCount: feedbacks.length >= 4 ? 4 : 0,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  print(feedbacks[index]);
                  print(feedbacks[index]['rating']);
                  return TutorReview(
                    currentAvatarUrl:
                        feedbacks[index]['firstInfo']['avatar'].toString(),
                    currentName:
                        feedbacks[index]['firstInfo']['name'].toString(),
                    rating: double.parse(feedbacks[index]['rating'].toString()),
                    reviewMessage: feedbacks[index]['content'].toString(),
                  );
                }),
              ),

              const SizedBox(height: 15),
              TextHeader2("Give this tutor a review: "),
              const SizedBox(height: 5),
              LoginTextField(
                  controller: reviewInput,
                  hintText: "Give your review",
                  obscureText: false),
              const SizedBox(height: 5),

              RoundedButtonBold("Give review", () async {
                print(currentTutorBloc.currentUserId);
                int statusCode = await giveReview(ReviewDto(
                    bookingId: "3d424fd6-e4c9-4325-a913-b7042e9c4d58",
                    userId: currentTutorBloc.currentUserId,
                    rating: 5.0,
                    content: reviewInput.text));

                if (statusCode == 200) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    title: 'Review',
                    text: 'Give review successfully!',
                  );
                } else {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: 'Errorr',
                    text: 'Give review unsuccessfully!',
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
