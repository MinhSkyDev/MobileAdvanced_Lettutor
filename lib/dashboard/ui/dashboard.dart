import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/courses/ui/courses.dart';
import 'package:lettutor/find_tutor/ui/find_tutor.dart';
import 'package:lettutor/history/ui/history_screen.dart';
import 'package:lettutor/schedule/ui/Schedule.dart';

import '../../my_course/ui/my_course.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  child: TabBarText("Tutor"),
                ),
                Tab(
                  child: TabBarText("Schedule"),
                ),
                Tab(
                  child: TabBarText("History"),
                ),
                Tab(
                  child: TabBarText("Course"),
                ),
                Tab(
                  child: TabBarText("My Course"),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  FindTutor(),
                  ScheduleScreen(),
                  HistoryScreen(),
                  CoursesScreen(),
                  MyCourseScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text TabBarText(String input) => Text(
        input,
        style: TextStyle(color: Colors.black45),
      );
}
