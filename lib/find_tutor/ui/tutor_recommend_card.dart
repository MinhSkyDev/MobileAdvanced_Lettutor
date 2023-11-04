import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lettutor/model/Tutor.dart';

class TutorRecommendItem extends StatelessWidget {
  Tutor currentTutor;
  TutorRecommendItem({super.key, required this.currentTutor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: Image.network(currentTutor.avatarURL).image,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentTutor.name),
                    Text(currentTutor.nationality),
                    Text("Direct Message"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
