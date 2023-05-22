import 'package:flutter/material.dart';

class PokeTypography {
  final TextStyle h1;
  final TextStyle h2;
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
  const PokeTypography._({
    required this.h1,
    required this.h2,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.c1,
    required this.b1,
    required this.b2,
    required this.b3,
  });

  factory PokeTypography(Color textColor) => PokeTypography._(
        h1: TextStyle(
          fontSize: 24,
          height: 1.3,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        h2: TextStyle(
          fontSize: 16,
          height: 1.3,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s1: TextStyle(
          fontSize: 14,
          height: 1.15,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s2: TextStyle(
          fontSize: 12,
          height: 1.3,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        s3: TextStyle(
          fontSize: 10,
          height: 1.6,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        c1: TextStyle(
          fontSize: 8,
          height: 1.5,
          fontStyle: FontStyle.normal,
          color: textColor,
        ),
        b1: TextStyle(
          fontSize: 14,
          height: 1.15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
        b2: TextStyle(
          fontSize: 12,
          height: 1.3,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
        b3: TextStyle(
          fontSize: 10,
          height: 1.6,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          color: textColor,
        ),
      );
}

extension TextStyleBoldExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
