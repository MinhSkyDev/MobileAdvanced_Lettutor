import 'package:flutter/material.dart';

Widget getNextAndPrevious(
    VoidCallback onPreviousPressed, VoidCallback onNextPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: onPreviousPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
        ),
        child: const Icon(Icons.arrow_back),
      ),
      const SizedBox(
        width: 10,
      ),
      ElevatedButton(
        onPressed: onNextPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
        ),
        child: const Icon(Icons.arrow_forward),
      ),
    ],
  );
}
