import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color red = const Color(0xffC8161D);
Color black = const Color(0xff000000);
Color grey = const Color(0xff667C8A);
Color white = const Color(0xffFFFFFF);
Color lightpink = const Color(0xffF27D82);
Color backgroundcolor = const Color(0xffE5E5E5);
BoxShadow button = const BoxShadow(
    color: Colors.black38,
    offset: Offset(1.0, 1.0),
    blurRadius: 4.0,
    spreadRadius: 1.0);

textW400Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w400);
}

textW500Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w500);
}

textW600Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
}

textW700Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w700);
}

textW800Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w800);
}

textW900Stylepoppins(Color color, double fontSize) {
  return GoogleFonts.poppins(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w800);
}
