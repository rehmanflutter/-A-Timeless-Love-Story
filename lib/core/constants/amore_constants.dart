import 'package:flutter/material.dart';

class AmoreColors {
  AmoreColors._();

  // Primary palette
  static const Color rose = Color(0xFFC0485A);
  static const Color roseLight = Color(0xFFE8788A);
  static const Color rosePale = Color(0xFFFDF0F2);
  static const Color roseDark = Color(0xFF8B2035);
  static const Color roseDeep = Color(0xFF5A1020);

  // Gold accents
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFE8D5A0);

  // Neutrals
  static const Color cream = Color(0xFFFDF8F2);
  static const Color creamSecondary = Color(0xFFFDF5EA);
  static const Color textDark = Color(0xFF2C1A1E);
  static const Color textMid = Color(0xFF6B3A44);
  static const Color textSoft = Color(0xFFA07080);

  // Dark section
  static const Color darkBg = Color(0xFF2C1A1E);
  static const Color darkBgSecondary = Color(0xFF4A1E28);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [rose, roseDark],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [roseDark, roseDeep],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [goldLight, gold],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkBg, darkBgSecondary],
  );

  static LinearGradient roseGlow({double opacity = 0.15}) => LinearGradient(
        colors: [
          rose.withOpacity(opacity),
          roseLight.withOpacity(opacity * 0.6),
        ],
      );
}

class AmoreSpacing {
  AmoreSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 40;
  static const double xxl = 64;
  static const double xxxl = 96;
}

class AmoreRadii {
  AmoreRadii._();
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 28;
  static const double pill = 999;
}

class AmoreBreakpoints {
  AmoreBreakpoints._();
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

class AmoreDurations {
  AmoreDurations._();
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration verySlow = Duration(milliseconds: 1000);
}
