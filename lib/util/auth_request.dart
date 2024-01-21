import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lettutor/dto/auth_dto.dart';

Future<void> registerUser(RegisterRequest request) async {
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
      print('Registration successful');
      print('User ID: ${registerResponse.user.id}');
      print('Access Token: ${registerResponse.tokens['access']['token']}');
    } else {
      // Request failed
      print('Failed to register. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error during registration: $e');
  }
}

Future<void> loginUser(LoginRequest request) async {
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
      final loginResponse = LoginResponse.fromJson(jsonResponse);
      // print('Login successful');
      // print('User ID: ${loginResponse.user.id}');
      // print('Access Token: ${loginResponse.tokens['access']['token']}');
    } else {
      // Request failed
      print('Failed to login. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error during login: $e');
  }
}
