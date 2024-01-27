import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/common_component/common_header_text.dart';

class TutorReview extends StatelessWidget {
  dynamic currentAvatarUrl;
  dynamic currentName;
  dynamic rating;
  dynamic reviewMessage;
  TutorReview({
    super.key,
    required this.currentAvatarUrl,
    required this.currentName,
    required this.rating,
    required this.reviewMessage,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TUTOR INFO
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AVATAR
                        CircleAvatar(
                          radius: size.width * 0.1,
                          backgroundImage:
                              Image.network(currentAvatarUrl).image,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextCommon("Name: $currentName"),
                            RatingBar.builder(
                              itemSize: 15,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.redAccent,
                                size: 5,
                              ),
                              onRatingUpdate: (value) {},
                              initialRating: rating,
                              allowHalfRating: true,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextCommonBold(reviewMessage)
                ],
              ),
            ),
          ),
        ));
  }
}
