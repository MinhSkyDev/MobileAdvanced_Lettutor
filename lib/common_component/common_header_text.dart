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

Widget TextHeader2White(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 15,
        textStyle: const TextStyle(color: Colors.white),
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

Widget TextSideBar(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 28,
        textStyle: const TextStyle(color: Colors.white),
        fontWeight: FontWeight.w800,
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
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w500,
      ));
}

Widget TextCommonDescription(String text) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      maxLines: 9,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w500,
      ));
}

Widget TextCommonGrey(String text) {
  return Text(text,
      softWrap: true,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        textStyle: const TextStyle(color: Colors.grey),
        fontWeight: FontWeight.w800,
      ));
}

Widget TextCommonGreyLight(String text) {
  return Text(text,
      softWrap: true,
      textAlign: TextAlign.justify,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        textStyle: const TextStyle(color: Colors.grey),
        fontWeight: FontWeight.w500,
      ));
}

Widget TextCommonGreyLightSmall(String text) {
  return Text(text,
      softWrap: true,
      textAlign: TextAlign.start,
      style: GoogleFonts.montserrat(
        fontSize: 11,
        textStyle: const TextStyle(color: Colors.grey),
        fontWeight: FontWeight.w700,
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

Widget TextCommonBoldBig(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        textStyle: const TextStyle(color: Colors.black),
        fontWeight: FontWeight.w800,
      ));
}

Widget TextCommonBoldWhite(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 13,
        textStyle: const TextStyle(color: Colors.white),
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

TextStyle TextStyleCommonHint() {
  return GoogleFonts.montserrat(
    fontSize: 11,
    textStyle: const TextStyle(color: Colors.black),
    fontWeight: FontWeight.w500,
  );
}
