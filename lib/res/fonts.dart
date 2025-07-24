import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nyari_gyak_2025/res/colours.dart';

enum FontSizes { smallest, small, medium, large }

class Fonts {
  final monstserrat_variable = GoogleFonts.montserrat(
    color: Colours.black,
    fontSize: 16,
  );

  static TextStyle montserrat({
    Color color = Colours.black,

    FontSizes fontSize = FontSizes.medium,
    FontWeight weight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    double size;

    switch (fontSize) {
      case FontSizes.smallest:
        size = 12;
      case FontSizes.small:
        size = 14;
      case FontSizes.medium:
        size = 16;
      default:
        size = 26;
    }

    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: weight,
      decoration: decoration,
    );
  }

  static TextStyle cormorant({
    Color color = Colours.black,
    FontSizes fontSize = FontSizes.medium,
    FontWeight weight = FontWeight.normal,
  }) {
    double size;

    switch (fontSize) {
      case FontSizes.smallest:
        size = 12;
      case FontSizes.small:
        size = 14;
      case FontSizes.medium:
        size = 16;
      default:
        size = 26;
    }

    return GoogleFonts.cormorantGaramond(
      color: color,
      fontSize: size,
      fontWeight: weight,
    );
  }
}
