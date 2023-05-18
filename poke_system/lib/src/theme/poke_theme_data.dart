import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class PokeThemeData {
  final PokeColors colors;
  final PokeTypography typography;
  final ThemeData themeData;
  PokeThemeData._({
    required this.colors,
    required this.typography,
    required this.themeData,
  });

  factory PokeThemeData() {
    final colors = PokeColors.contexts;
    final typography = PokeTypography(colors.greyScaleGroup.dark);
    final themeData = _getCustomTheme(colors, typography);

    return PokeThemeData._(
      colors: colors,
      typography: typography,
      themeData: themeData,
    );
  }
}

ThemeData _getCustomTheme(
  PokeColors colors,
  PokeTypography typography,
) =>
    ThemeData(
      appBarTheme: AppBarTheme(color: colors.identityGroup.primary),
      primaryColor: colors.identityGroup.primary,
      textTheme: TextTheme(
        displayLarge: typography.h1,
        titleMedium: typography.s1,
        titleSmall: typography.s2,
        bodyLarge: typography.b1,
        bodyMedium: typography.b2,
        bodySmall: typography.c1,
      ),
    );
