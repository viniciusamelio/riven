import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryGreen,
  accentColor: primaryGreen,
  errorColor: red,
  primaryColorDark: primaryGreen,
  fontFamily: GoogleFonts.inter().fontFamily,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    fillColor: spotlightDark,
    filled: true,
    helperStyle: TextStyle(
      color: greyTextColor,
    ),
    isDense: true,
    focusColor: primaryGreen,
    labelStyle: TextStyle(
      color: greyTextColor,
    ),
  ),
  backgroundColor: backgroundColor,
);
