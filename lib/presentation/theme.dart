import 'package:flutter/material.dart';

/// A class that holds the theme data for the app.
class AppTheme {
  /// The primary color of the app.
  final Color source;

  /// The theme mode of the app.
  final ThemeMode mode;

  /// Creates a new [AppTheme].
  const AppTheme(this.source, {this.mode = ThemeMode.system});

  /// Creates a light theme from the given [colorScheme].
  ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: source,
      brightness: Brightness.light,
    );
    return _base(colorScheme).copyWith(
      brightness: Brightness.light,
    );
  }

  /// Creates a dark theme from the given [colorScheme].
  ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: source,
      brightness: Brightness.dark,
    );
    return _base(colorScheme).copyWith(
      brightness: Brightness.dark,
    );
  }

  ThemeData _base(ColorScheme colorScheme) {
    final isLight = colorScheme.brightness == Brightness.light;
    final onSurface = colorScheme.onSurface;
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(centerTitle: false),
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: _textTheme(onSurface),
      chipTheme: _chipTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      floatingActionButtonTheme: _fabTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(colorScheme),
    );
  }

  TextTheme _textTheme(Color onSurface) => TextTheme(
        displayLarge: TextStyle(color: onSurface),
        displayMedium: TextStyle(color: onSurface),
        displaySmall: TextStyle(color: onSurface),
        headlineLarge: TextStyle(color: onSurface),
        headlineMedium: TextStyle(color: onSurface),
        headlineSmall: TextStyle(color: onSurface),
        bodyLarge: TextStyle(color: onSurface),
        bodyMedium: TextStyle(color: onSurface),
        bodySmall: TextStyle(color: onSurface),
        titleLarge: TextStyle(color: onSurface),
        titleMedium: TextStyle(color: onSurface),
        titleSmall: TextStyle(color: onSurface),
        labelLarge: TextStyle(color: onSurface),
        labelMedium: TextStyle(color: onSurface),
        labelSmall: TextStyle(color: onSurface),
      );

  ChipThemeData _chipTheme(ColorScheme colorScheme) => ChipThemeData(
        backgroundColor: colorScheme.surface,
        deleteIconColor: colorScheme.onSurface,
        labelStyle: TextStyle(color: colorScheme.onSurface),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSurface),
        selectedColor: colorScheme.primary,
        disabledColor: colorScheme.onSurface.withOpacity(0.12),
        padding: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: colorScheme.surface,
        surfaceTintColor: colorScheme.surfaceTint,
      );

  FloatingActionButtonThemeData _fabTheme(ColorScheme colorScheme) =>
      FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      );

  InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) =>
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
      );
}