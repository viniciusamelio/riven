import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riven/shared/presentation/styles/color.dart';

TextStyle headerOneStyle({Color? color}) => GoogleFonts.inter(
      fontSize: 40,
      color: color ?? primaryGreen,
      fontWeight: FontWeight.w900,
    );

TextStyle headerThreeStyle({Color? color}) => GoogleFonts.inter(
      fontWeight: FontWeight.w800,
      color: color ?? primaryGreen,
      fontSize: 22,
    );

TextStyle headerFourStyle({Color? color}) => GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: color ?? primaryGreen,
      fontSize: 18,
    );
TextStyle defaultTextStyle({Color? color, double? size, FontWeight? weight}) =>
    GoogleFonts.inter(
      color: color ?? greyTextColor,
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.normal,
    );

TextStyle assetLabelTextStyle(
        {Color? color, double? size, FontWeight? weight}) =>
    GoogleFonts.inter(
      color: color ?? greyTextColor,
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.w700,
    );
