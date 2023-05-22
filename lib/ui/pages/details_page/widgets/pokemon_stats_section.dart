import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonStatsSection extends StatelessWidget {
  final PokeThemeData theme;
  final PokemonDetailsResponse pokemonDetails;
  final Color pokemonColor;

  const PokemonStatsSection({
    Key? key,
    required this.theme,
    required this.pokemonDetails,
    required this.pokemonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Base stats',
            style: theme.typography.h2,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatsName(),
              _buildVerticalDivider(),
              _buildStatsValues(),
              _buildStatusBar(),
            ],
          ),
        ],
      ),
    );
  }

  String _getStateName(String? name) {
    if (name == null) return '';
    switch (name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SATK';
      case 'special-defense':
        return 'SDEF';
      case 'speed':
        return "SPD";
    }
    return '';
  }

  Widget _buildStatsName() {
    return Column(
      children: pokemonDetails.stats
          .map(
            (stat) => Container(
              alignment: AlignmentDirectional.center,
              constraints: const BoxConstraints(minHeight: 16),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                _getStateName(stat.stat.name),
                style: theme.typography.s2,
              ),
            ),
          )
          .toList(),
    );
  }

  _buildVerticalDivider() {
    return Container(
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      width: 1,
      height: 160,
      color: theme.colors.greyScaleGroup.light,
    );
  }

  _buildStatsValues() {
    return Column(
      children: pokemonDetails.stats
          .map(
            (stat) => Container(
              alignment: AlignmentDirectional.center,
              constraints: const BoxConstraints(minHeight: 16),
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 8,
              ),
              child: Text(
                stat.baseStat!.formatPokemonStat(),
                style: theme.typography.b2,
              ),
            ),
          )
          .toList(),
    );
  }

  _buildStatusBar() {
    return Expanded(
      child: Column(
        children: pokemonDetails.stats
            .map(
              (stat) => Container(
                alignment: AlignmentDirectional.center,
                constraints: const BoxConstraints(minHeight: 16),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: StatusBar(
                  progressValue: stat.baseStat!.toDouble(),
                  statusColor: pokemonColor,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
