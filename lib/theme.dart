import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData baseLight()=>ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0EA5E9),
      secondary: Color(0xFF22C55E), // green-500
        surface: Color(0xFFF8FAFC), // slate-50
        onSurface: Color(0xFF0F172A)
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    )
  );

  static ThemeData baseDark() => ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xffB8CDF8), // sky-400
      secondary: Color(0xFF22C55E),
      surface: Color(0xff41463D),
      onSurface: Color(0xFFE2E8F0),
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff41463D),
      elevation: 0,
      centerTitle: false,
    ),
  );

  static final light =baseLight();
  static final dark= baseDark();
}