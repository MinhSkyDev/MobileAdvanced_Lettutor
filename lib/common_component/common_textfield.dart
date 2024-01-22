import 'package:flutter/material.dart';
import 'package:lettutor/common_component/common_header_text.dart';

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
        height: size.height * 0.07,
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
                  hintStyle: TextStyleCommonHint(),
                  hintText: hintText,
                  fillColor: Colors.white70),
            )));
  }
}
