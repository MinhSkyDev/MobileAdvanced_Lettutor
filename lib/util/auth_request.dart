import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/auth_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> registerUser(RegisterRequest request) async {
  const String apiUrl = 'https://sandbox.api.lettutor.com/auth/register';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      // Request was successful
      final jsonResponse = json.decode(response.body);
      final registerResponse = RegisterResponse.fromJson(jsonResponse);
    } else {
      // Request failed
      print('Failed to register. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    return response.statusCode;
  } catch (e) {
    print('Error during registration: $e');
    return -1;
  }
}

Future<int> loginUser(LoginRequest request) async {
  const String apiUrl = 'https://sandbox.api.lettutor.com/auth/login';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      // Request was successful
      final jsonResponse = json.decode(response.body);
      //final loginResponse = LoginResponse.fromJson(jsonResponse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('lettutorUser', (response.body));
    } else {
      // Request failed
    }

    return response.statusCode;
  } catch (e) {
    return -1;
  }
}
