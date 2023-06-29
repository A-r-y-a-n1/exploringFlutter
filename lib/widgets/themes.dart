import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      hintColor: Colors.black,
      highlightColor: Colors.white,
      textTheme: Theme.of(context).textTheme,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black87,
      canvasColor: darkCreamColor,
      hintColor: Colors.white,
      highlightColor: Colors.grey.shade800,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //Colors
  static Color creamColor = Color.fromARGB(255, 249, 247, 209);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color.fromARGB(255, 66, 61, 93);
  static Color lightBluishColor = Vx.indigo600;
  static Color buttonColor = lightBluishColor;
  static Color accentColor = Vx.white;
}
