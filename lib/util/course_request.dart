import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/course_dto.dart';

Future<dynamic> getCourses(CourseRequest request) async {
  const String apiUrl = 'https://sandbox.api.lettutor.com/course';
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
    return null;
  }
}

Future<void> getCourseInfo(CourseInfoRequest request) async {
  final String apiUrl =
      'https://sandbox.api.lettutor.com/course/${request.courseId}';

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${request.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      // Request was successful
      final jsonResponse = json.decode(response.body);
      final courseInfo = CourseInfo.fromJson(jsonResponse);
    } else {
      print(
          'Failed to get course information. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error while getting course information: $e');
  }
}
