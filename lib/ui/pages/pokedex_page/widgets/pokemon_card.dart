import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class PokemonCard extends StatelessWidget {
  final PokeThemeData theme;
  final String pokemonName;
  final String pokemonNumber;
  final String pokemonImage;
  const PokemonCard({
    super.key,
    required this.pokemonNumber,
    required this.pokemonImage,
    required this.theme,
    required this.pokemonName,
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
          _buildPokemonNumber(),
          _buildCardSecondaryBackground(),
          _buildPokemonImage(),
          _buildPokemonName(),
        ],
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Container(
      padding: const EdgeInsets.only(top: 4, right: 8),
      alignment: Alignment.topRight,
      child: Text(
        pokemonNumber,
        style: theme.typography.b2.copyWith(
          color: theme.colors.greyScaleGroup.medium,
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Image.network(
        pokemonImage,
        height: 72,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Image.asset(
            'assets/png/pokemon_skeleton.png',
            height: 72,
            color: theme.colors.greyScaleGroup.medium.withOpacity(0.5),
          );
        },
      ),
    );
  }

  Widget _buildPokemonName() {
    return Container(
      padding: const EdgeInsets.only(bottom: 4),
      alignment: Alignment.bottomCenter,
      child: Text(
        pokemonName,
        style: theme.typography.b2,
      ),
    );
  }

  Widget _buildCardSecondaryBackground() {
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
