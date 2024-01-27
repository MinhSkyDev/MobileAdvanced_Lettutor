import 'dart:convert'; // For encoding the data to JSON

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/util/common_util.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  final TextEditingController levelController = TextEditingController();
  final TextEditingController learnTopicsController = TextEditingController();
  final TextEditingController testPreparationsController =
      TextEditingController();

  late String userAvatar;

  void updateUser() async {
    // Create the PUT request body
    Map<String, dynamic> requestBody = {
      "name": nameController.text,
      "country": countryController.text,
      "phone": phoneController.text,
      "birthday": birthdayController.text,
      "level": levelController.text,
      "learnTopics": [learnTopicsController.text],
      "testPreparations": [],
    };

    // Encode the body to JSON
    String jsonBody = jsonEncode(requestBody);

    // Make the PUT request
    String apiUrl =
        "https://sandbox.api.lettutor.com/user/info"; // Replace with your API endpoint
    String accessToken = await getAccessToken();
    http.Response response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonBody,
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Successful update
      print('User updated successfully');
    } else {
      // Handle error
      print('Error updating user: ${response.statusCode}');
      print(response.body);
    }
  }

  Future<void> getThisAvatar() async {
    String newAvatarUrl = await getAvatar();
    setState(() {
      userAvatar = newAvatarUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    getThisAvatar();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: Image.network(userAvatar).image,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: countryController,
                decoration: const InputDecoration(labelText: 'Country'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: birthdayController,
                decoration: const InputDecoration(labelText: 'Birthday'),
              ),
              TextField(
                controller: levelController,
                decoration: const InputDecoration(labelText: 'Level'),
              ),
              TextField(
                controller: learnTopicsController,
                decoration: const InputDecoration(labelText: 'Learn Topics'),
              ),
              TextField(
                controller: testPreparationsController,
                decoration:
                    const InputDecoration(labelText: 'Test Preparations'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateUser,
                child: const Text('Update User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
