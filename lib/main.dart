import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Appnavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: TextTheme(bodyText1: GoogleFonts.poppins())),
      debugShowCheckedModeBanner: false,
      home: Appnavigation(),
    );
  }
}
