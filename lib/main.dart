import 'package:flutter/material.dart';
import 'package:lettutor/home/ui/home.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
      appBarTheme: const AppBarTheme(
        color: Colors.blueAccent,
      ),
    ),
  ));
}
