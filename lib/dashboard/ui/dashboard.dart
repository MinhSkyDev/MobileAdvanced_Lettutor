import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/courses/ui/courses.dart';
import 'package:lettutor/find_tutor/ui/find_tutor.dart';
import 'package:lettutor/history/ui/history.dart';
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
                  child: Text("Tutor"),
                ),
                Tab(
                  child: Text("Schedule"),
                ),
                Tab(
                  child: Text("History"),
                ),
                Tab(
                  child: Text("Course"),
                ),
                Tab(
                  child: Text("My Course"),
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
}
