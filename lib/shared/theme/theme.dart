import 'package:google_fonts/google_fonts.dart';
import 'package:bakery/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
      primaryColor: const Color(0xFFD6D2C4),
      scaffoldBackgroundColor: const Color(0xFFB9EDDD),
      appBarTheme: AppBarTheme(
        backgroundColor: appbarBackgroundColor,
        elevation: 0.6,
        titleTextStyle: GoogleFonts.lato(
          color: const Color(0xFF577D86),
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF577D86),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: const Color(0xFF577D86),
        selectedItemColor: Colors.blueGrey[900]!,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: const Color(0xFF577D86),
        labelColor: Colors.blueGrey[900]!,
      ),
      textTheme: TextTheme(
        titleSmall: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
        titleMedium: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
        titleLarge: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
        bodyLarge: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
        bodySmall: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
        bodyMedium: GoogleFonts.lato(
          color: Colors.blueGrey[900],
        ),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primaryColor));
}
