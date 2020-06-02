import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor;
Color accentColor;

Color surfaceColor;

Color dividerColor;

Color backGroundGradientItem1;
Color backGroundGradientItem2;
Color actionButtonColor;

ThemeData lightTheme() {
  primaryColor = Colors.white;
  accentColor = Colors.cyan;
  surfaceColor = Colors.indigo;

  backGroundGradientItem1 = Colors.blue;
  backGroundGradientItem2 = Colors.cyan;
  dividerColor = Colors.grey;
  actionButtonColor = Colors.grey[600];
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.cyan),
      ),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: GoogleFonts.roboto(),
          headline5: GoogleFonts.roboto(
            fontSize: 20,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
          caption: GoogleFonts.alice(),
        ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.blue),
    ),
    canvasColor: Colors.white,
    dividerColor: dividerColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: surfaceColor,
      splashColor: primaryColor,
      foregroundColor: primaryColor,
    ),
  );
}

ThemeData darkTheme() {
  primaryColor = Color.fromRGBO(45, 46, 64, 1.0);
  accentColor = Color.fromRGBO(35, 129, 206, 1.0);
  surfaceColor = Color.fromRGBO(248, 203, 165, 1.0);
  backGroundGradientItem1 = Color.fromRGBO(222, 99, 99, 1.0);
  backGroundGradientItem2 = Color.fromRGBO(244, 177, 136, 1.0);
  dividerColor = Color.fromRGBO(56, 56, 78, 1.0);
  actionButtonColor = Colors.grey[100];

  return ThemeData.dark().copyWith(
    dividerColor: dividerColor,
    primaryColor: primaryColor,
    canvasColor: primaryColor,
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: GoogleFonts.roboto(),
          caption: GoogleFonts.alice(),
          headline5: GoogleFonts.roboto(
            fontSize: 20,
            fontStyle: FontStyle.normal,
          ),
        ),
    accentColor: accentColor,
    scaffoldBackgroundColor: primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: surfaceColor,
      splashColor: primaryColor,
    ),
  );
}
