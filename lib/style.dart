import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor;
Color accentColor;

Color surfaceColor;

Color backGroundGradientItem1;
Color backGroundGradientItem2;

ThemeData lightTheme() {
  primaryColor = Color.fromRGBO(45, 46, 64, 1.0);
  accentColor = Color.fromRGBO(35, 129, 206, 1.0);
  surfaceColor = Color.fromRGBO(248, 203, 165, 1.0);
  backGroundGradientItem1 = Color.fromRGBO(222, 99, 99, 1.0);
  backGroundGradientItem2 = Color.fromRGBO(244, 177, 136, 1.0);

  return ThemeData.light().copyWith();
}

ThemeData darkTheme() {
  primaryColor = Color.fromRGBO(45, 46, 64, 1.0);
  accentColor = Color.fromRGBO(35, 129, 206, 1.0);
  surfaceColor = Color.fromRGBO(248, 203, 165, 1.0);
  backGroundGradientItem1 = Color.fromRGBO(222, 99, 99, 1.0);
  backGroundGradientItem2 = Color.fromRGBO(244, 177, 136, 1.0);

  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    textTheme: ThemeData.dark().textTheme.copyWith(
          headline6: GoogleFonts.roboto(),
          caption: GoogleFonts.alice(),
        ),
    accentColor: accentColor,
    scaffoldBackgroundColor: primaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: surfaceColor,
      splashColor: primaryColor,
    ),
  );
}
