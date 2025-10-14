import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme(this.source);
  final Color source;
  final ThemeMode mode = ThemeMode.system;

  // Vision Colors
  static const Color sageGreen = Color(0xFF87A96B);
  static const Color warmCharcoal = Color(0xFF4A4A4A);
  static const Color softGold = Color(0xFFD4AF37);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color deepCharcoal = Color(0xFF2C2C2C);
  static const Color lightGray = Color(0xFFE8E8E8);

  ThemeData _base(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(centerTitle: false),
      brightness: brightness,
    );
  }

  ThemeData light() {
    final colors = ColorScheme.fromSeed(
      seedColor: sageGreen,
      brightness: Brightness.light,
      primary: sageGreen,
      secondary: warmCharcoal,
      tertiary: softGold,
      surface: offWhite,
      onSurface: deepCharcoal,
      outline: lightGray,
    );

    final root = _base(Brightness.light).copyWith(
      brightness: Brightness.light,
      colorScheme: colors,
      scaffoldBackgroundColor: offWhite,
      cardColor: Colors.white,
      shadowColor: warmCharcoal.withOpacity(0.1),
    );

    return root.copyWith(
      textTheme: _createTextTheme(colors.onSurface),
      primaryTextTheme: _createTextTheme(colors.onPrimary),
    );
  }

  ThemeData dark() {
    final colors = ColorScheme.fromSeed(
      seedColor: sageGreen,
      brightness: Brightness.dark,
      primary: sageGreen,
      secondary: warmCharcoal,
      tertiary: softGold,
      surface: const Color(0xFF1A1A1A),
      onSurface: Colors.white,
      outline: Colors.white.withOpacity(0.2),
    );

    final root = _base(Brightness.dark).copyWith(
      brightness: Brightness.dark,
      colorScheme: colors,
      scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      cardColor: const Color(0xFF2A2A2A),
      shadowColor: Colors.black.withOpacity(0.3),
    );

    return root.copyWith(
      textTheme: _createTextTheme(colors.onSurface),
      primaryTextTheme: _createTextTheme(colors.onPrimary),
    );
  }

  TextTheme _createTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.12,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.16,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.22,
      ),
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.29,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.33,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.27,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.5,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.43,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.8),
        height: 1.33,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.43,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor.withOpacity(0.8),
        height: 1.33,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textColor.withOpacity(0.8),
        height: 1.2,
      ),
    );
  }
}

extension on TextTheme {
  TextTheme withColor(Color value) {
    return copyWith(
      displayLarge: displayLarge!.copyWith(color: value),
      displayMedium: displayMedium!.copyWith(color: value),
      displaySmall: displaySmall!.copyWith(color: value),
      headlineLarge: headlineLarge!.copyWith(color: value),
      headlineMedium: headlineMedium!.copyWith(color: value),
      headlineSmall: headlineSmall!.copyWith(color: value),
      bodyLarge: bodyLarge!.copyWith(color: value),
      bodyMedium: bodyMedium!.copyWith(color: value),
      bodySmall: bodySmall!.copyWith(color: value),
      titleLarge: titleLarge!.copyWith(color: value),
      titleMedium: titleMedium!.copyWith(color: value),
      titleSmall: titleSmall!.copyWith(color: value),
      labelLarge: labelLarge!.copyWith(color: value),
      labelMedium: labelMedium!.copyWith(color: value),
      labelSmall: labelSmall!.copyWith(color: value),
    );
  }
}
