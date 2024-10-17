import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamThemeText {
  static TextTheme lightTextTheme = TextTheme(
      headlineMedium: GoogleFonts.montserrat(
          color: Colors.black87, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.aBeeZee(color: Colors.black45, fontSize: 18));
  static TextTheme darkTextTheme = TextTheme(
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
      bodyMedium: GoogleFonts.aBeeZee(color: Colors.white60, fontSize: 18));
}
