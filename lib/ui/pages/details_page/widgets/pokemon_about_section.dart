import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';
import 'package:pokedex_flutter_app/domain/entities/pokemon/pokemon_details_response.dart';
import 'package:pokedex_flutter_app/utils/extensions/extensions.dart';

class PokemonAboutSection extends StatelessWidget {
  final PokeThemeData theme;
  final PokemonDetailsResponse pokemonDetails;
  const PokemonAboutSection({
    super.key,
    required this.pokemonDetails,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About',
          style: theme.typography.h2,
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(
            top: 8,
          ),
          height: 64,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSection(
                hasToppadding: true,
                caption: 'Weight',
                topContent: [
                  const Icon(
                    Icons.work_outline,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${(pokemonDetails.weight / 10).toString()} kg',
                    style: theme.typography.b1,
                  )
                ],
              ),
              _buildDivider(),
              _buildSection(
                hasToppadding: true,
                caption: 'Height',
                topContent: [
                  Transform.rotate(
                    angle: 90 * (pi / 180),
                    child: const Icon(
                      Icons.straighten_rounded,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${(pokemonDetails.height / 10).toString()} m',
                    style: theme.typography.b1,
                  )
                ],
              ),
              _buildDivider(),
              _buildSection(
                caption: 'Moves',
                topContent: [
                  Column(
                    children: pokemonDetails.moves
                        .sublist(0, 2)
                        .map(
                          (move) => Text(
                            move.move.name.capitalizeFirstLetter(),
                            style: theme.typography.b2.copyWith(
                              color: theme.colors.greyScaleGroup.dark,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required List<Widget> topContent,
    required String caption,
    bool? hasToppadding,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasToppadding != null) const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: topContent,
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              caption,
              style: theme.typography.b3.copyWith(
                color: theme.colors.greyScaleGroup.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 52,
      color: theme.colors.greyScaleGroup.light,
    );
  }
}
