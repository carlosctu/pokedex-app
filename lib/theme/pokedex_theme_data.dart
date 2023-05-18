import 'package:flutter/material.dart';
import 'package:pokedex_flutter_app/tokens/tokens.dart';

class PokedexThemeData {
  final PokedexColors colors;
  final PokedexTypography typography;
  final ThemeData themeData;
  PokedexThemeData._({
    required this.colors,
    required this.typography,
    required this.themeData,
  });

  factory PokedexThemeData() {
    final colors = PokedexColors.contexts;
    final typography = PokedexTypography(colors.greyScaleGroup.dark);
    final themeData = _getCustomTheme(colors, typography);

    return PokedexThemeData._(
      colors: colors,
      typography: typography,
      themeData: themeData,
    );
  }
}

ThemeData _getCustomTheme(
  PokedexColors colors,
  PokedexTypography typography,
) =>
    ThemeData(
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
