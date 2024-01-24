import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> getYourOwnBookedSchedule(String accessToken) async {
  const String apiUrl =
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=20&orderBy=meeting&sortBy=asc&inFuture=1';

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
    print('Error while getting your own schedule: $e');
    return null;
  }
}

Future<dynamic> getYourOwnHistorySchedule(String accessToken) async {
  const String apiUrl =
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=20&orderBy=meeting&sortBy=asc';

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
    print('Error while getting your own schedule: $e');
    return null;
  }
}
