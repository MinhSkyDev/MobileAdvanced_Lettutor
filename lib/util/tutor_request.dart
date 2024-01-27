import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/tutor_dto.dart';
import 'package:lettutor/util/common_util.dart';

Future<dynamic> getTutors(TutorRequest request) async {
  const String apiUrl = 'https://sandbox.api.lettutor.com/tutor/more';
  final Map<String, dynamic> queryParameters = request.toQueryParameters();

  try {
    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParameters);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${request.accessToken}',
      },
    );
    if (response.statusCode == 200) {
      // Request was successful

      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return null;
    }
  } catch (e) {
    print('Error while getting tutors: $e');
    return null;
  }
}

Future<dynamic> getTutorDetail(String tutorId, String accessToken) async {
  String apiUrl = 'https://sandbox.api.lettutor.com/tutor/$tutorId';

  try {
    final Uri uri = Uri.parse(apiUrl);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      // Request was successful

      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return null;
    }
  } catch (e) {
    print('Error while getting tutors: $e');
    return null;
  }
}

Future<int> giveReview(ReviewDto request) async {
  const String apiUrl = 'https://sandbox.api.lettutor.com/user/feedbackTutor';
  String accessToken = await getAccessToken();

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode(request.toJson()),
    );

    print(response.body);
    if (response.statusCode == 200) {
      // Request was successful
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  } catch (e) {
    return -1;
  }
}
