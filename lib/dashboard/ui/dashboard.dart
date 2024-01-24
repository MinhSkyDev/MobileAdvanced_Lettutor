import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/courses/bloc/bloc/course_bloc.dart';
import 'package:lettutor/courses/ui/courses.dart';
import 'package:lettutor/dto/auth_dto.dart';
import 'package:lettutor/find_tutor/bloc/bloc/find_tutor_bloc.dart';
import 'package:lettutor/find_tutor/ui/find_tutor.dart';
import 'package:lettutor/history/bloc/bloc/history_bloc.dart';
import 'package:lettutor/history/ui/history_screen.dart';
import 'package:lettutor/my_course/bloc/bloc/my_course_bloc.dart';
import 'package:lettutor/schedule/bloc/bloc/schedule_bloc.dart';
import 'package:lettutor/schedule/ui/Schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../my_course/ui/my_course.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0; // Index of the currently selected screen
  late LoginResponse currentUserInfo;
  bool isDataLoaded = false;
  @override
  void initState() {
    getUserData();
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userinfoString = prefs.getString('lettutorUser');

    if (userinfoString != null) {
      Map<String, dynamic> userinfoResponse = json.decode(userinfoString);
      LoginResponse userInfo = LoginResponse.fromJson(userinfoResponse);
      currentUserInfo = userInfo;
      setState(() {
        isDataLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isDataLoaded
        ? Scaffold(
            appBar: AppBar(
              title: TextCommonBoldWhite('Lettutor'),
            ),
            drawer: SidePanel(
              currentIndex: _currentIndex,
              onItemTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
                Navigator.pop(context); // Close the drawer
              },
              userLoginInfo: currentUserInfo,
            ),
            body: SafeArea(
              child: MultiBlocProvider(providers: [
                BlocProvider<FindTutorBloc>(
                  create: (BuildContext context) => FindTutorBloc(),
                ),
                BlocProvider<ScheduleBloc>(
                  create: (BuildContext context) => ScheduleBloc(),
                ),
                BlocProvider<MyCourseBloc>(
                  create: (BuildContext context) => MyCourseBloc(),
                ),
                BlocProvider<CourseBloc>(
                  create: (BuildContext context) => CourseBloc(),
                ),
                BlocProvider<HistoryBloc>(
                    create: (BuildContext context) => HistoryBloc()),
              ], child: DashboardContent(currentIndex: _currentIndex)),
            ),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}

class DashboardContent extends StatelessWidget {
  final int currentIndex;

  const DashboardContent({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return const FindTutor();
      case 1:
        return const ScheduleScreen();
      case 2:
        return const HistoryScreen();
      case 3:
        return const CoursesScreen();
      case 4:
        return const MyCourseScreen();
      default:
        return Container(); // Handle invalid index gracefully
    }
  }
}

class SidePanel extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final LoginResponse userLoginInfo;

  const SidePanel({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.userLoginInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: TextCommonBoldWhite(
                userLoginInfo.user.name), // Replace with the user's name
            accountEmail: TextCommonBoldWhite(
                userLoginInfo.user.email), // Replace with the user's email
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                userLoginInfo.user.avatar, // Replace with the mockup avatar URL
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
          for (var i = 0; i < 5; i++)
            ListTile(
              title: Text(
                getTabText(i),
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              selected: currentIndex == i,
              onTap: () => onItemTapped(i),
            ),
        ],
      ),
    );
  }

  String getTabText(int index) {
    switch (index) {
      case 0:
        return 'Tutor';
      case 1:
        return 'Schedule';
      case 2:
        return 'History';
      case 3:
        return 'Courses';
      case 4:
        return 'My Courses';
      default:
        return '';
    }
  }
}
