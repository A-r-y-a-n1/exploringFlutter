import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: creamColor,
        ).copyWith(
          secondary: buttonColor,
          primaryContainer: lightBluishColor, // Replace deprecated `primary`
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        hintColor: Colors.black87,
        highlightColor: Colors.white,
        textTheme: customTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                buttonColor, // Replace `primary` with `backgroundColor`
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: buttonColor), // Updated syntax
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primaryContainer: darkBluishColor, // Replace deprecated `primary`
          secondary: buttonColor,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black87,
        canvasColor: darkCreamColor,
        hintColor: Colors.white,
        highlightColor: Colors.grey.shade800,
        textTheme: customTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor, // Replace `primary`
            foregroundColor: Colors.white,
          ),
        ),
      );

  static TextTheme customTextTheme(TextTheme base) => base.copyWith(
        displayLarge: base.displayLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ), // Replace `headline1` with `displayLarge`
        bodyLarge: base.bodyLarge?.copyWith(
          fontSize: 16,
        ), // Replace `bodyText1` with `bodyLarge`
        labelLarge: base.labelLarge?.copyWith(
          color: Colors.white,
        ), // Replace `button` with `labelLarge`
      );

  // Colors
  static Color creamColor = const Color.fromARGB(255, 249, 247, 209);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color.fromARGB(255, 66, 61, 93);
  static Color lightBluishColor = Vx.indigo600;
  static Color buttonColor = lightBluishColor;
}
