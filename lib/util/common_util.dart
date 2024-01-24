import 'dart:convert';

import 'package:lettutor/dto/auth_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginResponse> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userinfoString = prefs.getString('lettutorUser') as String;
  Map<String, dynamic> userinfoResponse = json.decode(userinfoString);
  LoginResponse userInfo = LoginResponse.fromJson(userinfoResponse);
  return userInfo;
}
