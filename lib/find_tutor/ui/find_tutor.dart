import 'package:flutter/material.dart';
import 'package:horizontal_list/horizontal_list.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/common_component/common_rounded_button.dart';
import 'package:lettutor/common_component/common_textfield.dart';
import 'package:lettutor/find_tutor/ui/tutor_recommend_card.dart';

import '../../model/Tutor.dart';

class FindTutor extends StatefulWidget {
  const FindTutor({super.key});

  @override
  State<FindTutor> createState() => _FindTutorState();
}

class _FindTutorState extends State<FindTutor> {
  final tutorNameController = TextEditingController();
  final tutorNationalityController = TextEditingController();
  List<String> languageList = ["Vietnam", "Japan", "Korean"];

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextHeader1("Find a tutor"),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonTextField(
                  controller: tutorNameController,
                  hintText: "Enter Tutor Name"),
              const SizedBox(
                width: 10,
              ),
              DropdownMenu<String>(
                  inputDecorationTheme: InputDecorationTheme(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    constraints:
                        BoxConstraints.tight(const Size.fromHeight(40)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  initialSelection: languageList.first,
                  dropdownMenuEntries:
                      languageList.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    },
                  ).toList())
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [TextCommonBold("Select available tutoring time")],
          ),
          SafeArea(
            child: HorizontalListView(
              height: 40,
              width: double.maxFinite,
              list: [
                RoundedButtonSmallBold("Select a day", () {}),
                RoundedButtonSmallBold("Start time ", () {}),
                RoundedButtonSmallBold("End time", () {})
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: widget,
                      ))
                  .toList(),
            ),
          ),
          Row(
            children: [
              RoundedButtonBold("Reset Filter", () {}),
            ],
          ),

          //RECOMENDED TUTORS
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                "Recommended Tutors",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              TutorRecommendItem(
                currentTutor: Tutor(
                    avatarURL:
                        "https://media.post.rvohealth.io/wp-content/uploads/2020/08/732x549_Are_Random_Erections_Normal-1-732x549.jpg",
                    name: "ABC",
                    nationality: "Vietnam",
                    rating: 5,
                    skills: ["C++", "English"],
                    description: "Im super good"),
              ),
              TutorRecommendItem(
                currentTutor: Tutor(
                    avatarURL:
                        "https://media.post.rvohealth.io/wp-content/uploads/2020/08/732x549_Are_Random_Erections_Normal-1-732x549.jpg",
                    name: "ABC",
                    nationality: "Vietnam",
                    rating: 5,
                    skills: ["C++", "English"],
                    description: "Im super good"),
              ),
              TutorRecommendItem(
                currentTutor: Tutor(
                    avatarURL:
                        "https://media.post.rvohealth.io/wp-content/uploads/2020/08/732x549_Are_Random_Erections_Normal-1-732x549.jpg",
                    name: "ABC",
                    nationality: "Vietnam",
                    rating: 5,
                    skills: ["C++", "English"],
                    description: "Im super good"),
              )
            ],
          ))
        ],
      ),
    );
  }
}
