import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/tutor_dto.dart';

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
