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

class PokedexSizes {
  final DropShadow dropShadow;
  final InnerShadow innerShadow;
  PokedexSizes._({
    required this.dropShadow,
    required this.innerShadow,
  });

  double dpToPx(BuildContext context, double dp) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return dp * devicePixelRatio;
  }

  PokedexSizes sizes(BuildContext context) => PokedexSizes._(
        dropShadow: DropShadow(
          x20: dpToPx(context, 2),
          x60: dpToPx(context, 6),
        ),
        innerShadow: InnerShadow(
          x20: dpToPx(context, 2),
        ),
      );
}
