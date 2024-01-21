import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/course_dto.dart';

Future<void> getCourses(CourseRequest request) async {
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
      print(jsonResponse);
    } else {
      // Request failed
      print('Failed to get courses. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error while getting courses: $e');
  }
}
