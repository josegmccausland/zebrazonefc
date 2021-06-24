import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/screens/homeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zebra Zone',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(textTheme: GoogleFonts.antonTextTheme()),
    );
  }
}
