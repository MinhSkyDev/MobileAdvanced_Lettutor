import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final controller;
  final String hintText;
  const CommonTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.4,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                      color: Colors.grey[800],
                      height: 1,
                      fontSize: 10,
                      fontFamily: 'Montserrat'),
                  hintText: hintText,
                  fillColor: Colors.white70),
            )));
  }
}
