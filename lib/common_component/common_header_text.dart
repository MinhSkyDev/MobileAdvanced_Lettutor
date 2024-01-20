import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TextHeader1(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 35,
        textStyle: const TextStyle(color: Colors.blueAccent),
        fontWeight: FontWeight.w800,
      ));
}

Widget TextHeader2(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 15,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w700,
      ));
}

Widget TextHeader3(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w700,
      ));
}

Widget TextForButton(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        textStyle: const TextStyle(color: Colors.white),
        fontWeight: FontWeight.w800,
      ));
}

Widget TextCommon(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w500,
      ));
}

Widget TextCommonBold(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w800,
      ));
}

TextStyle TextStyleCommon() {
  return GoogleFonts.montserrat(
    fontSize: 13,
    textStyle: const TextStyle(color: Colors.black),
    fontWeight: FontWeight.w500,
  );
}
