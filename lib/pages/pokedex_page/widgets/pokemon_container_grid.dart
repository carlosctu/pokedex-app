import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class PokemonContainerGrid extends StatelessWidget {
  const PokemonContainerGrid({super.key});

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
              '#001',
              style: theme.typography.b2.copyWith(
                color: theme.colors.greyScaleGroup.medium,
              ),
            ),
          ),
          Positioned.fill(
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
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              'assets/png/pokemon.png',
              height: 72,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            alignment: Alignment.bottomCenter,
            child: DefaultTextStyle(
              style: theme.typography.b2,
              child: const Text('Bulbasaur'),
            ),
          ),
        ],
      ),
    );
  }
}
