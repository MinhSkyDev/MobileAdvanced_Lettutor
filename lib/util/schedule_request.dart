import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/util/common_util.dart';

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
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=9&orderBy=meeting&sortBy=asc';

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

Future<dynamic> getYourOwnHistorySchedulePage(
    String accessToken, int pageSwitch) async {
  String apiUrl =
      'https://sandbox.api.lettutor.com/booking/list/student?page=$pageSwitch&perPage=9&orderBy=meeting&sortBy=asc';

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

Future<dynamic> getTutorSchedule(String accessToken, String tutorId) async {
  String apiUrl =
      'https://sandbox.api.lettutor.com/schedule?tutorId=$tutorId&page=0';

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

Future<dynamic> bookLesson(String scheduleId, String note) async {
  String accessToken = await getAccessToken();

  const String apiUrl = 'https://sandbox.api.lettutor.com/booking';

  List<String> scheduleIdList = [scheduleId];
  BookRequest request =
      BookRequest(scheduleDetailIds: scheduleIdList, note: note);

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      // Request was successful
      final jsonResponse = json.decode(response.body);
      //final loginResponse = LoginResponse.fromJson(jsonResponse);
    } else {
      // Request failed
    }

    return response.statusCode;
  } catch (e) {
    return -1;
  }
}

class BookRequest {
  List<String> scheduleDetailIds;
  String note;

  BookRequest({required this.scheduleDetailIds, required this.note});

  Map<String, dynamic> toJson() {
    return {
      'scheduleDetailIds': scheduleDetailIds,
      'note': note,
    };
  }

  factory BookRequest.fromJson(Map<String, dynamic> json) {
    return BookRequest(
      scheduleDetailIds: List<String>.from(json['scheduleDetailIds']),
      note: json['note'],
    );
  }
}
