import 'package:flutter/material.dart';

class DropShadow {
  final double x20;
  final double x60;
  const DropShadow({
    required this.x20,
    required this.x60,
  });
}

class InnerShadow {
  final double x20;
  const InnerShadow({
    required this.x20,
  });
}

class PokeSizes {
  final DropShadow dropShadow;
  final InnerShadow innerShadow;
  PokeSizes._({
    required this.dropShadow,
    required this.innerShadow,
  });

  double dpToPx(BuildContext context, double dp) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return dp * devicePixelRatio;
  }

  PokeSizes sizes(BuildContext context) => PokeSizes._(
        dropShadow: DropShadow(
          x20: dpToPx(context, 2),
          x60: dpToPx(context, 6),
        ),
        innerShadow: InnerShadow(
          x20: dpToPx(context, 2),
        ),
      );
}
