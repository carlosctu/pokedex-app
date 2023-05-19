import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class PokemonContainerGrid extends StatelessWidget {
  final String pokemonName;
  final String pokemonNumber;
  final String pokemonImage;
  const PokemonContainerGrid({
    super.key,
    required this.pokemonName,
    required this.pokemonNumber,
    required this.pokemonImage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.greyScaleGroup.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colors.greyScaleGroup.light,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 4, right: 8),
            alignment: Alignment.topRight,
            child: Text(
              pokemonNumber,
              style: theme.typography.b2.copyWith(
                color: theme.colors.greyScaleGroup.medium,
              ),
            ),
          ),
          const _SecondaryContainerBackground(),
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              pokemonImage,
              height: 72,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            alignment: Alignment.bottomCenter,
            child: Text(
              pokemonName,
              style: theme.typography.b2,
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondaryContainerBackground extends StatelessWidget {
  const _SecondaryContainerBackground();

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Positioned.fill(
      bottom: 0,
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: 0.4,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colors.greyScaleGroup.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
