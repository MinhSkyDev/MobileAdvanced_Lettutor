import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_list/horizontal_list.dart';
import 'package:lettutor/common_component/common_button.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/common_component/common_rounded_button.dart';
import 'package:lettutor/common_component/common_textfield.dart';
import 'package:lettutor/find_tutor/bloc/bloc/find_tutor_bloc.dart';
import 'package:lettutor/find_tutor/ui/tutor_detail.dart';
import 'package:lettutor/find_tutor/ui/tutor_recommend_card.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

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

  int currentPage = 1;

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

  void goNextPage() {
    currentPage += 1;
    BlocProvider.of<FindTutorBloc>(context)
        .add(FindTutorSwitchPageEvent(pageSwitch: currentPage));
  }

  void goPreviousPage() {
    currentPage -= 1;
    BlocProvider.of<FindTutorBloc>(context)
        .add(FindTutorSwitchPageEvent(pageSwitch: currentPage));
  }

  void getValidIndex() {
    if (currentPage <= 0) {
      currentPage = 1;
    } else {
      currentPage -= 1;
    }
  }

  @override
  void initState() {
    BlocProvider.of<FindTutorBloc>(context).add(FindTutorInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: BlocProvider.of<FindTutorBloc>(context),
      listener: (context, state) {
        if (state is FindTutorSwitchPageFailedState) {
          getValidIndex();
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Switch Page Failed!',
          );
        } else if (state is FindTutorViewDetailFailedState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'View Tutor Detail Unsuccessful',
          );
        } else if (state is FindTutorViewDetailSuccessState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<FindTutorBloc>(context),
                    child: const TutorDetailScreen(),
                  )));
        }
      },
      builder: (context, state) {
        if (state is FindTutorInitial || state is FindTutorLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return getFindTutorMainScreen();
      },
    );
  }

  Widget getFindTutorMainScreen() {
    FindTutorBloc currentFindTutorBloc =
        BlocProvider.of<FindTutorBloc>(context);
    dynamic currenttutorsObjects = currentFindTutorBloc.currentTutors;
    List<dynamic> currentTutors = currenttutorsObjects["tutors"]['rows'];
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
            height: 5,
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
              height: 35,
              width: double.maxFinite,
              list: [
                RoundedButtonSmallBold("Select a day", () async {
                  await _selectDate(context);
                }),
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

          //RECOMENDED TUTORS
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCommonBoldBig(
                "Recommended Tutors",
              ),
              getNextAndPrevious(
                () {
                  goPreviousPage();
                },
                () {
                  goNextPage();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Flexible(
              flex: 7,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                padding: const EdgeInsets.all(8),
                itemCount: currentTutors.length,
                itemBuilder: (BuildContext context, int index) {
                  return TutorRecommendItem(
                    onClick: () {
                      currentFindTutorBloc.add(FindTutorOnClickEvent(
                          currentIndex: index,
                          userId: currentTutors[index]['userId'] as String));
                    },
                    currentTutor: Tutor(
                        avatarURL: currentTutors[index]['avatar']?.toString() ??
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommunity.atlassian.com%2Ft5%2FJira-Software-questions%2FUnassigned-avatar-missing-in-Jira-Server%2Fqaq-p%2F794354&psig=AOvVaw2pTN_zKHA2FZrom_UGJnnj&ust=1706201463964000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLDZk6O-9oMDFQAAAAAdAAAAABAE',
                        name: currentTutors[index]['name'],
                        nationality:
                            currentTutors[index]['country']?.toString() ??
                                'N/A',
                        rating: currentTutors[index]['rating'] ?? 0,
                        skills:
                            currentTutors[index]['specialties']?.toString() ??
                                'N/A',
                        description:
                            currentTutors[index]['bio']?.toString() ?? 'N/A'),
                  );
                },
              ))
        ],
      ),
    );
  }
}
