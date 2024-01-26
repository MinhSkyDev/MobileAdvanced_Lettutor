import 'dart:convert';
import 'dart:math';

import 'package:lettutor/dto/auth_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginResponse> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userinfoString = prefs.getString('lettutorUser') as String;
  Map<String, dynamic> userinfoResponse = json.decode(userinfoString);
  LoginResponse userInfo = LoginResponse.fromJson(userinfoResponse);
  return userInfo;
}

DateTime convertUnixTimestampToDateTime(int unixTimestamp) {
  // Convert the Unix timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp);

  // Convert the DateTime to UTC
  DateTime utcDateTime = dateTime.toUtc();

  return utcDateTime;
}

int getRandomNumber(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min + 1);
}

Future<String> getAccessToken() async {
  LoginResponse currentUser = await getUserData();
  String currentAccessToken = currentUser.tokens['access']['token'];
  return currentAccessToken;
}
