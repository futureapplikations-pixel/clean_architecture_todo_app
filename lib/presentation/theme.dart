
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme(this.source);
  final Color source;
  final ThemeMode mode = ThemeMode.system;

  // New Vision Colors
  static const Color primaryColor = Color(0xFF0A2540);
  static const Color secondaryColor = Color(0xFF00A29A);
  static const Color accentColor = Color(0xFFF47C20);
  static const Color backgroundColorLight = Color(0xFFF5F7FA);
  static const Color backgroundColorDark = Color(0xFF0A192F);
  static const Color cardColorLight = Colors.white;
  static const Color cardColorDark = Color(0xFF112240);
  static const Color fontColorLight = Color(0xFF2C2C2C);
  static const Color fontColorDark = Colors.white;


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
      seedColor: primaryColor,
      brightness: Brightness.light,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      surface: backgroundColorLight,
      onSurface: fontColorLight,
      outline: Colors.grey.shade300,
    );

    final root = _base(Brightness.light).copyWith(
      brightness: Brightness.light,
      colorScheme: colors,
      scaffoldBackgroundColor: backgroundColorLight,
      cardColor: cardColorLight,
      shadowColor: Colors.grey.withOpacity(0.1),
    );

    return root.copyWith(
      textTheme: _createTextTheme(colors.onSurface),
      primaryTextTheme: _createTextTheme(colors.onPrimary),
    );
  }

  ThemeData dark() {
    final colors = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      surface: backgroundColorDark,
      onSurface: fontColorDark,
      outline: Colors.grey.shade700,
    );

    final root = _base(Brightness.dark).copyWith(
      brightness: Brightness.dark,
      colorScheme: colors,
      scaffoldBackgroundColor: backgroundColorDark,
      cardColor: cardColorDark,
      shadowColor: Colors.black.withOpacity(0.3),
    );

    return root.copyWith(
      textTheme: _createTextTheme(colors.onSurface),
      primaryTextTheme: _createTextTheme(colors.onPrimary),
    );
  }

  TextTheme _createTextTheme(Color textColor) {
    final baseTextTheme = GoogleFonts.interTextTheme();
    return baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(color: textColor),
      displayMedium: baseTextTheme.displayMedium?.copyWith(color: textColor),
      displaySmall: baseTextTheme.displaySmall?.copyWith(color: textColor),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: textColor),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: textColor),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: textColor),
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: textColor),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: textColor),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: textColor),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: textColor),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: textColor),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: textColor),
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: textColor),
      labelMedium: baseTextTheme.labelMedium?.copyWith(color: textColor),
      labelSmall: baseTextTheme.labelSmall?.copyWith(color: textColor),
    ).apply(
      bodyColor: textColor,
      displayColor: textColor,
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

