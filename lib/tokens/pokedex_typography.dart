import 'package:flutter/material.dart';

class PokedexTypography {
  final TextStyle h1;
  final TextStyle s1;
  final TextStyle s2;
  final TextStyle s3;
  final TextStyle c1;
  final TextStyle b1;
  final TextStyle b2;
  final TextStyle b3;

  /// Typography:
  /// h = headline
  /// s = subtitle
  /// c = caption
  /// b = body
  const PokedexTypography._({
    required this.h1,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.c1,
    required this.b1,
    required this.b2,
    required this.b3,
  });

  factory PokedexTypography(Color textColor) => PokedexTypography._(
        h1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s3: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        c1: TextStyle(
          fontSize: 8,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        b1: TextStyle(
          fontSize: 14,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        b2: TextStyle(
          fontSize: 12,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        b3: TextStyle(
          fontSize: 10,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
      );
}

extension TextStyleBoldExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
