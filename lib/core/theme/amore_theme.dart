import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/amore_constants.dart';

class AmoreTheme {
  AmoreTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AmoreColors.cream,
      colorScheme: const ColorScheme.light(
        primary: AmoreColors.rose,
        secondary: AmoreColors.gold,
        surface: Colors.white,
        error: Color(0xFFB00020),
      ),
      textTheme: _textTheme,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      dividerColor: Color(0x1FC0485A),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      // Display – Playfair Display for hero headlines
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 64,
        fontWeight: FontWeight.w700,
        color: AmoreColors.textDark,
        height: 1.08,
        letterSpacing: -1.0,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 46,
        fontWeight: FontWeight.w700,
        color: AmoreColors.textDark,
        height: 1.12,
        letterSpacing: -0.5,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AmoreColors.textDark,
        height: 1.2,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AmoreColors.textDark,
        height: 1.25,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AmoreColors.textDark,
      ),
      titleLarge: GoogleFonts.playfairDisplay(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: AmoreColors.textDark,
      ),
      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AmoreColors.textDark,
      ),
      bodyLarge: GoogleFonts.lato(
        fontSize: 17,
        fontWeight: FontWeight.w300,
        color: AmoreColors.textMid,
        height: 1.85,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: AmoreColors.textMid,
        height: 1.75,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AmoreColors.textSoft,
        letterSpacing: 0.2,
      ),
      labelLarge: GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AmoreColors.rose,
        letterSpacing: 1.8,
      ),
    );
  }
}
