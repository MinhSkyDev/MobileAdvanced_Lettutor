import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            const Text(
              "History",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Text(
          messageSchedule_1,
          style: TextStyle(fontSize: 10),
        ),
        Text(
          messageSchedule_2,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
