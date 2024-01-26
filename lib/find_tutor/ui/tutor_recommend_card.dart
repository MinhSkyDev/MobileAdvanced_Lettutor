import 'package:flutter/material.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/model/Tutor.dart';
import 'package:lettutor/util/common_util.dart';

class TutorRecommendItem extends StatelessWidget {
  Tutor currentTutor;
  TutorRecommendItem({super.key, required this.currentTutor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (currentTutor.avatarURL ==
        "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png") {
      int random = getRandomNumber(1, 1000);

      currentTutor.avatarURL =
          "https://api.minimalavatars.com/avatar/$random/png";
    }
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          Image.network(currentTutor.avatarURL).image,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCommonBold("Name"),
                          TextCommon(currentTutor.name),
                          TextCommonBold("Nationality"),
                          TextCommon(currentTutor.nationality),
                          TextCommon("Skill: ${currentTutor.skills}"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextCommonBold("Description:"),
                TextCommonDescription(currentTutor.description)
              ],
            ),
          ),
        ));
  }
}
